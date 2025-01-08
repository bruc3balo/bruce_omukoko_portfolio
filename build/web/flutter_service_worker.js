'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "e32c53d96008e045ef1601928d450be0",
"version.json": "96d05a9fd9d1b850cae2c09eecd52f19",
"index.html": "c2b847c989da34f99717815812c426fd",
"/": "c2b847c989da34f99717815812c426fd",
"main.dart.js": "160d191ea7001c2627c0e59908e4e0f2",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon.png": "8a35e328a1a76fb273e284827509f147",
"main.dart.mjs": "d0179422dbc2a6920ad68a1d01093432",
"icons/Icon-192.png": "611ed158b1d72eaadce85ed6c12ea373",
"icons/Icon-maskable-192.png": "611ed158b1d72eaadce85ed6c12ea373",
"icons/Icon-maskable-512.png": "357ae2f77482409f529616ea4c65fdd5",
"icons/Icon-512.png": "357ae2f77482409f529616ea4c65fdd5",
"manifest.json": "4bd8a6cd48065f6b442aa2447197abc7",
"main.dart.wasm": "7081ef3eea52e03d4dc8f23978d4f314",
"assets/AssetManifest.json": "b194b0495df3612fd6ae90f77d007ed8",
"assets/NOTICES": "01e8e6a7435dba483b2e9e5f2467c6d2",
"assets/FontManifest.json": "3ddd9b2ab1c2ae162d46e3cc7b78ba88",
"assets/AssetManifest.bin.json": "b9266c13a9d4eb37eca277735196cd66",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4769f3245a24c1fa9965f113ea85ec2a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "e9da08cdd06a0cbfd00a909715207c9c",
"assets/fonts/MaterialIcons-Regular.otf": "909ec5835d1f8bcf16533b11f2371880",
"assets/assets/bruce_forest.png": "e33fd06a4a1a37e04ad005def94a200d",
"assets/assets/spring.svg": "449e8efbf3e642eecc4d8e0b1fe7cb1d",
"assets/assets/sign.svg": "be9cfd7bbf4ec9c33bf5547be3ceeb5d",
"assets/assets/mongo.svg": "c2a864c96dbfc449ec45dd7ac4438628",
"assets/assets/skills_arrow.svg": "7df46dafa4be4551309ca7b9e790fb9b",
"assets/assets/android.svg": "67feb4e4a68f7c2d60c9c2ede7ad4bb1",
"assets/assets/flutter.svg": "bd9fec894dfe707631e11a1dfedb25b5",
"assets/assets/docker.svg": "2e0fcd7b793e8353f3e272dc38492020",
"assets/assets/git.svg": "1190a19ce3cc940741a60137a1e074cb",
"assets/assets/surprised.riv": "c562b0acfde111e658e7b605043718c7",
"assets/assets/sad.riv": "1cec632fb91e2447e518ab5bb2d0c639",
"assets/assets/bruce.png": "89422d7112d5abcc9ad50870c9cdee5a",
"assets/assets/bruce.jpg": "ecfd4223f34fb7193af7accb77e842b3",
"assets/assets/flash.svg": "d7e56f2d04c3bc17d2817da377948f2f",
"assets/assets/happy.riv": "b56049e90cd54c9391a6578f4b8809ea",
"assets/assets/rive.jpeg": "dee1dfb921109fdcb0246554f4f8d4fa",
"assets/assets/background.png": "c3238cb680319d592dc34f16d96013d7",
"assets/assets/contempt.riv": "12c3d419687709c0bb50c62846469a1b",
"assets/assets/adobe-illustrator.svg": "8b2e452a111b65f2639a81bb63bf0790",
"assets/assets/kubernets.svg": "fbf149dcc85add80815b2226e40a5192",
"assets/assets/smile.svg": "929580d1b6d21fb926fbc7ebb423fa97",
"assets/assets/visual-paradigm.png": "749b3fbd5804eb4ee4533916f014fc51",
"assets/assets/dart.svg": "ef26b12cc0b34cc83dfcde04e8bb1ea1",
"assets/assets/rugby_arrow.svg": "f82d3ea34d64aea5fdc5b519de96d720",
"assets/assets/rive.png": "30c0450bc4a86f9ee6d911050509e540",
"assets/assets/skills_hover.svg": "62ba8a49652bd0416e05501e399d2e7f",
"assets/assets/brucy.png": "2a0f168f714ca4282b96b8b2d6e53e2f",
"assets/assets/bruce_rugby.jpg": "985ccb98ad664eb659b965db2672332b",
"assets/assets/mysql.svg": "60c2bdb8b85b43b3c5178581456a1baa",
"assets/assets/pub_dev.jpeg": "cb551ee69cb162be95b0dbdc1fe81083",
"assets/assets/disgust.riv": "134267fbe4bbc0180c5dac764f8dd862",
"assets/assets/mouse.svg": "3a378e32586ffcf1b8560d80d971462a",
"assets/assets/tod.riv": "497abb256ffa8ac88d101f7d26229cc4",
"assets/assets/postgresql.svg": "d7c985e7cca077dc2d77f89a66573e35",
"assets/assets/fear.riv": "e7a5d6e31ef356b23595858f06aad4dc",
"assets/assets/anger.riv": "5ca70332f1f7da894174ac47e4a19ac9",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"main.dart.wasm",
"main.dart.mjs",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
