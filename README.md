test project for a crash bug found in iOS builds

I was slowly adding things back into an empty project to see where the crash came in. I added a test sprite and a sprite with a texture, those worked fine. When I added the tilemap I started getting the crash. Narrowing down even further, it seems like just preloading the tilemap in config:

    config.preload.texts.push({ id:'assets/tilemap.tmx' });

causes the crash. Hopefully this helps narrow it down.

The crash line in Xcode: Core.hx:277:      i / luxe / / OpenGL ES 2.0 Apple A8 GPU - 53.13 / OpenGL ES GLSL ES 1.00 / Apple A8 GPU / Apple Inc. /
libc++abi.dylib: terminating with uncaught exception of type Dynamic
