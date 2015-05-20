"Only the JVM compiler should be allowed to compile this"
native("java")
module jvmimport2 "1.0.0" {
    native("js") import jvmonly "1.0.0";
}
