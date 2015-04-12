
"A test"
by("The Ceylon Team")
license("Apache Software License")
module backends "1.0.0" {
    @backend:"js" import ceylon.collection "1.1.1";
    @backend:"jvm" import ceylon.file "1.1.1";
}

//************************************************************
// You could even do the following, but the only real use-case
// I could imagine is when the documentation for the module
// would be very different between the two
//************************************************************

//@backend:"js"
//"A test"
//by("The Ceylon Team")
//license("Apache Software License")
//module backends "1.0.0" {
//    import ceylon.collection "1.1.1";
//}

//@backend:"jvm"
//"A test"
//by("The Ceylon Team")
//license("Apache Software License")
//module backends "1.0.0" {
//    import ceylon.file "1.1.1";
//}
