import PackageDescription

let package = Package(
  name: "ContactCircularView",
  dependencies: [
        .Package(url: "https://github.com/k8mil/ContactCircularView.git", majorVersion: 1),
    ]
)