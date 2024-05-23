#!/bin/bash

#PMD
wget https://github.com/pmd/pmd/releases/download/pmd_releases%2F7.0.0/pmd-dist-7.0.0-bin.zip
unzip pmd-dist-7.0.0-bin.zip
alias pmd="$PWD/pmd-bin-7.0.0/bin/pmd"

$PWD/pmd-bin-7.0.0/bin/pmd check -d sakai/kernel -R rulesets/java/quickstart.xml -f text -r entregables/sakai.pmd.txt
$PWD/pmd-bin-7.0.0/bin/pmd check -d easybuggy/src -R rulesets/java/quickstart.xml -f text -r entregables/easybuggy.pmd.txt

#Sakai
cd sakai
mvn install
mvn clean test
mvn package

mv kernel/api/target/*.jar ../entregables
mv kernel/api/target/bom.xml ../entregables/bom/kernel-api.bom.xml

mv kernel/component-manager/target/*.jar ../entregables
mv kernel/component-manager/target/bom.xml ../entregables/bom/kernel-component-manager.bom.xml

mv kernel/kernel-impl/target/*.jar ../entregables
mv kernel/kernel-impl/target/bom.xml ../entregables/bom/kernel-impl.bom.xml

mv kernel/kernel-storage-util/target/*.jar ../entregables
mv kernel/kernel-storage-util/target/bom.xml ../entregables/bom/kernel-storage-util.bom.xml

mv kernel/kernel-test/target/*.jar ../entregables
mv kernel/kernel-test/target/bom.xml ../entregables/bom/kernel-test.bom.xml

mv kernel/kernel-util/target/*.jar ../entregables
mv kernel/kernel-util/target/bom.xml ../entregables/bom/kernel-util.bom.xml

#Easybuggy
cd ..
cd easybuggy
mvn package
mv target/easybuggy.jar ../entregables
mv target/bom.xml ../entregables/bom/easybuggy.bom.xml
