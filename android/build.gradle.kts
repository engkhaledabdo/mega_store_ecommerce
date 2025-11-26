allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

// Ensure older or third-party Android library modules (e.g., pub cache plugins)
// that don't declare a `namespace` in their Gradle files get a default one so
// AGP 8+ can configure them. This avoids modifying files in the Pub cache.
subprojects {
    plugins.withId("com.android.library") {
        afterEvaluate {
            try {
                val androidExt = extensions.findByName("android")
                if (androidExt != null && androidExt is com.android.build.gradle.LibraryExtension) {
                    val currentNamespace = try { androidExt.namespace } catch (_: Throwable) { null }
                    if (currentNamespace == null || currentNamespace.isBlank()) {
                        // Provide a safe default namespace using the root project group or project name
                        val safeName = project.name.replace(Regex("[^A-Za-z0-9_]"), "_")
                        androidExt.namespace = "com.example.pubcache.$safeName"
                    }
                }
            } catch (_: Throwable) {
                // Ignore failures here; it's only a best-effort fix.
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
