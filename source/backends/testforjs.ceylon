@backend:"js";

import backends { myprint=myprintJs }
import ceylon.collection { ArrayList }

void fileTest() {
    value x = ArrayList{"aap", "noot", "mies"};
    myprint("This comes from testforjs.ceylon [``x``]");
}
