@backend:"jvm";

import backends { myprint=myprintJvm }
import ceylon.file { home }

void fileTest() {
    myprint("This comes from testforjvm.ceylon [``home``]");
}
