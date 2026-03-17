'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/AssetManifest.json": "754052023a62b77d099a13b0eb234800",
"assets/assets/lottie_files/loader.json": "b38f19170dfbbb3c8090b2a767b58ca4",
"assets/assets/lottie_files/coder_astronaut.json": "056f203c1fc9b2061d57663a31ab7644",
"assets/assets/svgs/git-logo.svg": "5eed2c8cb62e1adfae09b0129a25a1a7",
"assets/assets/svgs/dart-programming-logo.svg": "20d7b82998ddc6f73a4310bf58e609df",
"assets/assets/svgs/teams.svg": "92084e52b9e0f48050ef83c96622c054",
"assets/assets/svgs/email.svg": "45e4ff62cc7fd27d62227b3280a45101",
"assets/assets/svgs/flutter-logo.svg": "5c3a6308a335872a831a9f836f0e236c",
"assets/assets/svgs/skype.svg": "4e7f1c6eda4e57d48c586fd596dc99ad",
"assets/assets/svgs/gitlab-logo.svg": "1c43224189ae3ec7f82215c4938fa701",
"assets/assets/svgs/address.svg": "2681bb1914c8c185729326109d397180",
"assets/assets/svgs/firebase-logo.svg": "1da8d950e3f30a69d7c957c26238e1de",
"assets/assets/svgs/linkedin.svg": "4c56ec1861864b8f32eb68a4e22d6dae",
"assets/assets/svgs/c-programming-logo.svg": "dccbba627a28ad855fc569bd8c0897d8",
"assets/assets/svgs/github-logo.svg": "a0b00583d93c2f7084ad151ee0849934",
"assets/assets/svgs/phone.svg": "8d931db4998acd408fa06b67bbc5e1ea",
"assets/assets/svgs/github-icon.svg": "a9f7ad3dc6d998df5c984f5363913c7f",
"assets/assets/images/stars.jpg": "e23cec3b281f1e0138208eabb7cd426a",
"assets/assets/images/softifybd.png": "6a9d49ef7c17c4f68502e94d2d569769",
"assets/assets/images/portfolio.png": "dfa012e35567592d12201dd393efc91f",
"assets/assets/fonts/Sora-ExtraLight.ttf": "39c9de554ff1a68219b5cdabc554bcc1",
"assets/assets/fonts/Sora-Medium.ttf": "e3bb21ba620d898557d6537bbe0e9f10",
"assets/assets/fonts/Sora-Thin.ttf": "cf19f5c4ac432cd736815c489aa692d5",
"assets/assets/fonts/Sora-Light.ttf": "5662cb4703d0aeb2e42e9301ae42e0d3",
"assets/assets/fonts/Sora-ExtraBold.ttf": "d788f18b38a544fce1c35733d9d1a676",
"assets/assets/fonts/Sora-Regular.ttf": "e771c55096d16865a23c2795806fb01b",
"assets/assets/fonts/Sora-Bold.ttf": "59f1a10513024e9d080536ea7a744293",
"assets/assets/fonts/Sora-SemiBold.ttf": "921341e5f1c4ef800e1ee926676791e0",
"assets/NOTICES": "c27d97b47bc13298daf69a4a241f68b7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/AssetManifest.bin.json": "9eef7650f34b7bfc26aea4818052070a",
"assets/fonts/MaterialIcons-Regular.otf": "28e594f8704cb6df6bbf3fd194bc1608",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "87ea0c22b4701ac0369576903f00f37b",
"assets/FontManifest.json": "84f02bc1762e8d4cb159622147009f03",
"index.html": "eb745a0d1bf9c06e7e5ffea3b82eb34b",
"/": "eb745a0d1bf9c06e7e5ffea3b82eb34b",
"manifest.json": "e9e648571b3c66f6a01fbe70757ede19",
"flutter_bootstrap.js": "3be23f51f324986ef54d899c1a9c0564",
"main.dart.js": "ce8b5d0b44ea5bef8f58d867351f9b63",
"favicon.ico": "70fe1d3f2b97193e0b28931fd3616afc",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"favicon-16x16.png": "85dabd0349ac2ad4334fcbbb3db58627",
"version.json": "009c9e65172e010890f7f65fde438006",
"icons/Icon-maskable-512.png": "9da4dea4396330a60c11e982e166cba4",
"icons/Icon-maskable-192.png": "8b58b26f5063e240d01fd00c5eab9b24",
"icons/Icon-192.png": "8b58b26f5063e240d01fd00c5eab9b24",
"icons/o.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "9da4dea4396330a60c11e982e166cba4",
"apple-touch-icon.png": "52daa9691bf3904680545480bd875381",
"favicon-32x32.png": "eaf520e8f0bd070faa5c56bfd6b02a1f"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
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
