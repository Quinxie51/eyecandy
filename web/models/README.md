# 3D Models (GLB)

Place GLB model files in this folder to enable real AR try-on for each product.

## File naming convention

Name each file after the product's **ID** (the `id` field from the backend or sample data):

```
models/
  red-sweater.glb
  leather-jacket.glb
  denim-jacket.glb
  white-sneakers.glb
  sunglasses.glb
  wool-coat.glb
```

`product.html` will automatically load `models/{id}.glb`. If the file is missing it falls back to a demo astronaut model so the AR functionality is still visible.

## Where to get GLB files

### From the Snap3D pipeline (recommended for this project)

The Lens Studio project at `../project/` already uses Snap3D to generate GLB meshes from product images. Export those GLBs and place them here.

### From Blender

1. Open or import any 3D model in Blender.
2. **File → Export → glTF 2.0 (.glb/.gltf)**
3. Choose **GLB** format and click **Export glTF 2.0**.

### Free CC0 sources

- [Poly Pizza](https://poly.pizza) — CC0 models, downloadable as GLB
- [Sketchfab](https://sketchfab.com/features/free-3d-models) — filter by "Downloadable" + "CC"
- [KhronosGroup glTF-Sample-Assets](https://github.com/KhronosGroup/glTF-Sample-Assets) — reference models for testing

## iOS note (USDZ)

For native iOS AR Quick Look, model-viewer needs a `.usdz` file alongside the `.glb`:

```html
<model-viewer
  src="models/red-sweater.glb"
  ios-src="models/red-sweater.usdz"
  ...>
```

To convert GLB → USDZ:
- **Blender + Reality Composer** (free, macOS only)
- **usd-from-gltf** npm package: `npx usd-from-gltf model.glb`
- **Reality Composer Pro** (Xcode, macOS)

Without a USDZ, AR still works on Android via Scene Viewer / WebXR.
iOS 16+ Safari supports WebXR which can also place models, but Quick Look gives the best iOS experience.
