# Ported from https://gist.github.com/rojnwa/976ecf2bde0b09bfd64a6f26f7101d7e
# and modified to OS-dependent fix

import json
import sys

if sys.platform.startswith("win"):
    # Add here
    pass
elif sys.platform.startswith("linux"):
    file_path = "/usr/share/codium/resources/app/product.json"
elif sys.platform.startswith("darwin"):
    file_path = "/Applications/VSCodium.app/Contents/Resources/app/product.json"

with open(file_path, "r") as f:
    config = json.load(f)

    config["extensionsGallery"]["serviceUrl"] = "https://marketplace.visualstudio.com/_apis/public/gallery"
    config["extensionsGallery"]["cacheUrl"] = "https://vscode.blob.core.windows.net/gallery/index"
    config["extensionsGallery"]["itemUrl"] = "https://marketplace.visualstudio.com/items"

with open(file_path, "w") as f:
    json.dump(config, f, indent=2)
