#1
git clone https://github.com/KausMan/checkstyle.git
cd checkstyle
mvn test
mvn org.jacoco:jacoco-maven-plugin:report
cd ..
java -Xmx3000m -classpath jars/randoop-all-4.1.1.jar:/home/kaushalm/checkstyle/target/classes:jars/picocli-3.9.0.jar:jars/antlr-2.7.7.jar:jars/antlr4-runtime-4.7.2.jar:jars/commons-beanutils-1.9.3.jar:jars/commons-logging-1.2.jar:jars/commons-collections-3.2.2.jar:jars/guava-27.0.1-jre.jar:jars/failureaccess-1.0.1.jar:jars/listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar:jars/jsr305-3.0.2.jar:jars/checker-qual-2.5.2.jar:jars/error_prone_annotations-2.2.0.jar:jars/j2objc-annotations-1.1.jar:jars/animal-sniffer-annotations-1.17.jar:jars/ant-1.10.5.jar:jars/ant-launcher-1.10.5.jar:jars/Saxon-HE-9.9.0-2.jar  randoop.main.Main gentests --classlist=myclasses.txt  --time-limit=60 --flaky-test-behavior=DISCARD --sof-exception=ERROR --minimize-error-test





