# GRAFT branding pipeline: extract clean artwork, generate all platform assets
from PIL import Image
import numpy as np
import os

ROOT = r"Z:\The Developer ZW\graft"
SRC = r"K:\more downloads\graft logo.png"

im = Image.open(SRC).convert("RGBA")
arr = np.asarray(im).copy()

# --- 1. Normalize alpha: artwork interior sits at ~248-253, push to 255 ---
lut = np.array([min(255, round(x * 255 / 248)) if x > 0 else 0 for x in range(256)], dtype=np.uint8)
arr[..., 3] = lut[arr[..., 3]]
norm = Image.fromarray(arr)

am = arr[..., 3] > 10

# --- 2. Split pin from wordmark: first fully-empty row band below y=600 ---
rowsum = am.sum(axis=1)
split_y = None
for y in range(600, 1200):
    if rowsum[y] == 0 and rowsum[y:y + 8].sum() == 0:
        split_y = y
        break
assert split_y, "no empty band found"
pin_mask = am.copy()
pin_mask[split_y:, :] = False
ys, xs = np.where(pin_mask)
px0, px1, py0, py1 = xs.min(), xs.max() + 1, ys.min(), ys.max() + 1
print(f"split_y={split_y} pin bbox=({px0},{py0},{px1},{py1}) size={px1-px0}x{py1-py0}")

icon = norm.crop((px0, py0, px1, py1))
icon.save(os.path.join(ROOT, "assets", "graft_icon.png"))

# --- 3. Full logo asset (pin + wordmark), tight crop with margin ---
ys, xs = np.where(am)
lx0, lx1, ly0, ly1 = xs.min(), xs.max() + 1, ys.min(), ys.max() + 1
logo = norm.crop((lx0, ly0, lx1, ly1))
logo.save(os.path.join(ROOT, "assets", "graft_logo.png"))
print(f"logo crop size={lx1-lx0}x{ly1-ly0}  icon size={icon.size}")

# --- 4. Exact brand green (mode of solid pin pixels) ---
solid = arr[py0:py1, px0:px1]
m = solid[..., 3] >= 250
cols = solid[m][:, :3]
from collections import Counter
(g, cnt) = Counter(map(tuple, cols)).most_common(1)[0]
print(f"brand green: #{g[0]:02X}{g[1]:02X}{g[2]:02X} ({cnt} px)")


# --- 5. Fitting helper ---
def fitted(img, px, fill=0.8, white=False):
    """Scale img to fill*px height, center on px x px canvas."""
    w, h = img.size
    nh = round(fill * px)
    nw = round(nh * w / h)
    r = img.resize((nw, nh), Image.LANCZOS)
    canvas = Image.new("RGBA", (px, px), (255, 255, 255, 255) if white else (0, 0, 0, 0))
    canvas.paste(r, ((px - nw) // 2, (px - nh) // 2), r)
    return canvas


def out(path, img):
    path = os.path.join(ROOT, path)
    os.makedirs(os.path.dirname(path), exist_ok=True)
    img.save(path)
    print("wrote", os.path.relpath(path, ROOT))


# --- Android legacy launcher icons (transparent) ---
for dpi, sz in {"mdpi": 48, "hdpi": 72, "xhdpi": 96, "xxhdpi": 144, "xxxhdpi": 192}.items():
    out(f"android/app/src/main/res/mipmap-{dpi}/ic_launcher.png", fitted(icon, sz, 0.80))

# --- Android adaptive foreground (safe zone: content within center ~61%) ---
for dpi, sz in {"mdpi": 108, "hdpi": 162, "xhdpi": 216, "xxhdpi": 324, "xxxhdpi": 432}.items():
    out(f"android/app/src/main/res/mipmap-{dpi}/ic_launcher_foreground.png", fitted(icon, sz, 0.52))

# --- iOS AppIcon (white opaque bg — App Store requires no alpha) ---
ios_sizes = {
    "Icon-App-1024x1024@1x.png": 1024, "Icon-App-20x20@1x.png": 20, "Icon-App-20x20@2x.png": 40,
    "Icon-App-20x20@3x.png": 60, "Icon-App-29x29@1x.png": 29, "Icon-App-29x29@2x.png": 58,
    "Icon-App-29x29@3x.png": 87, "Icon-App-40x40@1x.png": 40, "Icon-App-40x40@2x.png": 80,
    "Icon-App-40x40@3x.png": 120, "Icon-App-60x60@2x.png": 120, "Icon-App-60x60@3x.png": 180,
    "Icon-App-76x76@1x.png": 76, "Icon-App-76x76@2x.png": 152, "Icon-App-83.5x83.5@2x.png": 167,
}
for name, sz in ios_sizes.items():
    out(f"ios/Runner/Assets.xcassets/AppIcon.appiconset/{name}", fitted(icon, sz, 0.76, white=True))

# --- macOS (transparent supported) ---
for sz in [16, 32, 64, 128, 256, 512, 1024]:
    out(f"macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_{sz}.png", fitted(icon, sz, 0.80))

# --- Windows .ico (multi-size, transparent) ---
ico_sizes = [16, 24, 32, 48, 64, 128, 256]
ico = Image.new("RGBA", (256, 256), (0, 0, 0, 0))
ico.paste(fitted(icon, 256, 0.85), (0, 0), fitted(icon, 256, 0.85))
ico.save(os.path.join(ROOT, "windows/runner/resources/app_icon.ico"), sizes=[(s, s) for s in ico_sizes])
print("wrote windows/runner/resources/app_icon.ico")

# --- Web ---
out("web/favicon.png", fitted(icon, 16, 0.92))
out("web/icons/Icon-192.png", fitted(icon, 192, 0.78))
out("web/icons/Icon-512.png", fitted(icon, 512, 0.78))
out("web/icons/Icon-maskable-192.png", fitted(icon, 192, 0.52, white=True))
out("web/icons/Icon-maskable-512.png", fitted(icon, 512, 0.52, white=True))

# --- iOS launch images (white, centered icon) ---
for name, (w, h, ih) in {
    "LaunchImage.png": (320, 480, 96), "LaunchImage@2x.png": (640, 960, 192),
    "LaunchImage@3x.png": (960, 1440, 288),
}.items():
    canvas = Image.new("RGBA", (w, h), (255, 255, 255, 255))
    iw = round(ih * icon.size[0] / icon.size[1])
    r = icon.resize((iw, ih), Image.LANCZOS)
    canvas.paste(r, ((w - iw) // 2, (h - ih) // 2), r)
    out(f"ios/Runner/Assets.xcassets/LaunchImage.imageset/{name}", canvas)

# --- Android splash bitmap (drawn over white launch_background) ---
out("android/app/src/main/res/drawable-xxhdpi/launch_image.png", fitted(icon, 480, 0.75))

# --- Verification sheet: icon & logo over white / dark / green ---
sheet = Image.new("RGB", (1600, 800), (128, 128, 128))
for i, (img, fill) in enumerate([(icon, 1.0), (logo, 1.0)]):
    for j, bg in enumerate([(255, 255, 255), (24, 24, 24), (2, 144, 77)]):
        c = Image.new("RGBA", (700, 700), bg + (255,))
        t = fitted(img, 560, fill)
        c.paste(t, (70, 70), t)
        sheet.paste(c.convert("RGB"), (i * 800, j * 266 - (0 if j == 0 else 0)))
sheet = Image.new("RGB", (1600, 2100), (160, 160, 160))
for i, img in enumerate([icon, logo]):
    for j, bg in enumerate([(255, 255, 255), (24, 24, 24), (2, 144, 77)]):
        c = Image.new("RGBA", (700, 700), bg + (255,))
        t = fitted(img, 560, 1.0)
        c.paste(t, (70, 70), t)
        sheet.paste(c.convert("RGB"), (i * 800, j * 700))
sheet.save(os.path.join(ROOT, "build", "_brand_check.png"))
print("DONE")
