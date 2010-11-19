

(add-to-list 'load-path (expand-file-name "~/emacs/jdee-2.4.0.1/lisp/"))
(require 'jde)

;; maven code
(require 'compile)

;; classpath
(setenv "CLASSPATH"
        "/Users/joseph/.m2/repository/aopalliance/aopalliance/1.0/aopalliance-1.0.jar:/Users/joseph/.m2/repository/asm/asm/3.1/asm-3.1.jar:/Users/joseph/.m2/repository/cglib/cglib/2.2/cglib-2.2.jar:/Users/joseph/.m2/repository/cglib/cglib-nodep/2.2/cglib-nodep-2.2.jar:/Users/joseph/.m2/repository/com/google/code/gson/gson/1.4/gson-1.4.jar:/Users/joseph/.m2/repository/com/google/protobuf/protobuf-java/2.3.0/protobuf-java-2.3.0.jar:/Users/joseph/.m2/repository/com/rabbitmq/amqp-client/2.1.0/amqp-client-2.1.0.jar:/Users/joseph/.m2/repository/com/sun/xml/bind/jaxb-impl/2.1.12/jaxb-impl-2.1.12.jar:/Users/joseph/.m2/repository/com/sun/xml/stream/sjsxp/1.0.1/sjsxp-1.0.1.jar:/Users/joseph/.m2/repository/commons-cli/commons-cli/1.1/commons-cli-1.1.jar:/Users/joseph/.m2/repository/commons-codec/commons-codec/1.3/commons-codec-1.3.jar:/Users/joseph/.m2/repository/commons-httpclient/commons-httpclient/3.1/commons-httpclient-3.1.jar:/Users/joseph/.m2/repository/commons-io/commons-io/1.2/commons-io-1.2.jar:/Users/joseph/.m2/repository/javassist/javassist/3.6.0.GA/javassist-3.6.0.GA.jar:/Users/joseph/.m2/repository/javax/activation/activation/1.1/activation-1.1.jar:/Users/joseph/.m2/repository/javax/annotation/jsr250-api/1.0/jsr250-api-1.0.jar:/Users/joseph/.m2/repository/javax/servlet/servlet-api/2.5/servlet-api-2.5.jar:/Users/joseph/.m2/repository/javax/xml/bind/jaxb-api/2.1/jaxb-api-2.1.jar:/Users/joseph/.m2/repository/javax/xml/stream/stax-api/1.0/stax-api-1.0.jar:/Users/joseph/.m2/repository/jline/jline/0.9.94/jline-0.9.94.jar:/Users/joseph/.m2/repository/junit/junit/4.8.1/junit-4.8.1.jar:/Users/joseph/.m2/repository/net/jcip/jcip-annotations/1.0/jcip-annotations-1.0.jar:/Users/joseph/.m2/repository/org/apache/geronimo/specs/geronimo-jta_1.1_spec/1.1.1/geronimo-jta_1.1_spec-1.1.1.jar:/Users/joseph/.m2/repository/org/apache/httpcomponents/httpclient/4.0/httpclient-4.0.jar:/Users/joseph/.m2/repository/org/apache/httpcomponents/httpcore/4.0.1/httpcore-4.0.1.jar:/Users/joseph/.m2/repository/org/apache/lucene/lucene-core/2.9.2/lucene-core-2.9.2.jar:/Users/joseph/.m2/repository/org/codehaus/jackson/jackson-core-asl/1.6.0/jackson-core-asl-1.6.0.jar:/Users/joseph/.m2/repository/org/codehaus/jackson/jackson-jaxrs/1.5.3/jackson-jaxrs-1.5.3.jar:/Users/joseph/.m2/repository/org/codehaus/jackson/jackson-mapper-asl/1.5.3/jackson-mapper-asl-1.5.3.jar:/Users/joseph/.m2/repository/org/codehaus/jackson/jackson-xc/1.5.3/jackson-xc-1.5.3.jar:/Users/joseph/.m2/repository/org/codehaus/jettison/jettison/1.2/jettison-1.2.jar:/Users/joseph/.m2/repository/org/easymock/easymock/3.0/easymock-3.0.jar:/Users/joseph/.m2/repository/org/eclipse/jetty/jetty-continuation/7.1.6.v20100715/jetty-continuation-7.1.6.v20100715.jar:/Users/joseph/.m2/repository/org/eclipse/jetty/jetty-deploy/7.1.6.v20100715/jetty-deploy-7.1.6.v20100715.jar:/Users/joseph/.m2/repository/org/eclipse/jetty/jetty-http/7.1.6.v20100715/jetty-http-7.1.6.v20100715.jar:/Users/joseph/.m2/repository/org/eclipse/jetty/jetty-io/7.1.6.v20100715/jetty-io-7.1.6.v20100715.jar:/Users/joseph/.m2/repository/org/eclipse/jetty/jetty-security/7.1.6.v20100715/jetty-security-7.1.6.v20100715.jar:/Users/joseph/.m2/repository/org/eclipse/jetty/jetty-server/7.1.6.v20100715/jetty-server-7.1.6.v20100715.jar:/Users/joseph/.m2/repository/org/eclipse/jetty/jetty-servlet/7.1.6.v20100715/jetty-servlet-7.1.6.v20100715.jar:/Users/joseph/.m2/repository/org/eclipse/jetty/jetty-start/7.1.6.v20100715/jetty-start-7.1.6.v20100715.jar:/Users/joseph/.m2/repository/org/eclipse/jetty/jetty-util/7.1.6.v20100715/jetty-util-7.1.6.v20100715.jar:/Users/joseph/.m2/repository/org/eclipse/jetty/jetty-webapp/7.1.6.v20100715/jetty-webapp-7.1.6.v20100715.jar:/Users/joseph/.m2/repository/org/eclipse/jetty/jetty-xml/7.1.6.v20100715/jetty-xml-7.1.6.v20100715.jar:/Users/joseph/.m2/repository/org/jboss/resteasy/jaxrs-api/2.0.1.GA/jaxrs-api-2.0.1.GA.jar:/Users/joseph/.m2/repository/org/jboss/resteasy/resteasy-jackson-provider/2.0.1.GA/resteasy-jackson-provider-2.0.1.GA.jar:/Users/joseph/.m2/repository/org/jboss/resteasy/resteasy-jaxb-provider/2.0.1.GA/resteasy-jaxb-provider-2.0.1.GA.jar:/Users/joseph/.m2/repository/org/jboss/resteasy/resteasy-jaxrs/2.0.1.GA/resteasy-jaxrs-2.0.1.GA.jar:/Users/joseph/.m2/repository/org/jboss/resteasy/resteasy-jettison-provider/2.0.1.GA/resteasy-jettison-provider-2.0.1.GA.jar:/Users/joseph/.m2/repository/org/jboss/resteasy/resteasy-spring/2.0.1.GA/resteasy-spring-2.0.1.GA.jar:/Users/joseph/.m2/repository/org/neo4j/neo4j-apoc/1.1/neo4j-apoc-1.1.pom:/Users/joseph/.m2/repository/org/neo4j/neo4j-graph-algo/0.6/neo4j-graph-algo-0.6.jar:/Users/joseph/.m2/repository/org/neo4j/neo4j-index/1.1/neo4j-index-1.1.jar:/Users/joseph/.m2/repository/org/neo4j/neo4j-kernel/1.1/neo4j-kernel-1.1.jar:/Users/joseph/.m2/repository/org/neo4j/neo4j-online-backup/0.6/neo4j-online-backup-0.6.jar:/Users/joseph/.m2/repository/org/neo4j/neo4j-remote-graphdb/0.7/neo4j-remote-graphdb-0.7.jar:/Users/joseph/.m2/repository/org/neo4j/neo4j-shell/1.1/neo4j-shell-1.1.jar:/Users/joseph/.m2/repository/org/objenesis/objenesis/1.2/objenesis-1.2.jar:/Users/joseph/.m2/repository/org/scannotation/scannotation/1.0.2/scannotation-1.0.2.jar:/Users/joseph/.m2/repository/org/slf4j/jcl-over-slf4j/1.6.1/jcl-over-slf4j-1.6.1.jar:/Users/joseph/.m2/repository/org/slf4j/slf4j-api/1.6.1/slf4j-api-1.6.1.jar:/Users/joseph/.m2/repository/org/slf4j/slf4j-jdk14/1.6.1/slf4j-jdk14-1.6.1.jar:/Users/joseph/.m2/repository/org/springframework/spring-aop/3.0.4.RELEASE/spring-aop-3.0.4.RELEASE.jar:/Users/joseph/.m2/repository/org/springframework/spring-asm/3.0.4.RELEASE/spring-asm-3.0.4.RELEASE.jar:/Users/joseph/.m2/repository/org/springframework/spring-beans/3.0.4.RELEASE/spring-beans-3.0.4.RELEASE.jar:/Users/joseph/.m2/repository/org/springframework/spring-context/3.0.4.RELEASE/spring-context-3.0.4.RELEASE.jar:/Users/joseph/.m2/repository/org/springframework/spring-core/3.0.4.RELEASE/spring-core-3.0.4.RELEASE.jar:/Users/joseph/.m2/repository/org/springframework/spring-expression/3.0.4.RELEASE/spring-expression-3.0.4.RELEASE.jar:/Users/joseph/.m2/repository/org/springframework/spring-test/3.0.4.RELEASE/spring-test-3.0.4.RELEASE.jar:/Users/joseph/.m2/repository/org/springframework/spring-tx/3.0.4.RELEASE/spring-tx-3.0.4.RELEASE.jar:/Users/joseph/.m2/repository/org/springframework/spring-web/3.0.4.RELEASE/spring-web-3.0.4.RELEASE.jar:/Users/joseph/.m2/repository/org/zenoss/org.zenoss.amqp/1.0-SNAPSHOT/org.zenoss.amqp-1.0-SNAPSHOT.jar:/Users/joseph/.m2/repository/org/zenoss/org.zenoss.protobufs/1.0-SNAPSHOT/org.zenoss.protobufs-1.0-SNAPSHOT.jar"
        )

(defvar mvn-command-history nil
  "Maven command history variable")

(defvar mvn-command-option "jetty:run"
  "Default option for mvn, I am cheating since we always jetty:run it in the bitch")

(defun mvnfast()
  (interactive)
  (let ((fn (buffer-file-name)))
    (let ((dir (file-name-directory fn)))
      (while (and (not (file-exists-p (concat dir "/pom.xml")))
                  (not (equal dir (file-truename (concat dir "/..")))))
        (setq dir (file-truename (concat dir "/.."))))
      (if (not (file-exists-p (concat dir "/pom.xml")))
          (message "No pom.xml found")
        (compile (concat "mvn -f " dir "/pom.xml " mvn-command-option  "  -Dmaven.test.skip=true"))))))

(define-key java-mode-map "\C-c\C-x5" 'mvnfast)

(defun mvn(&optional args)
  "Runs maven in the current project. Starting at the directoy where the file being vsisited resides, a search is
   made for pom.xml recsurively. A maven command is made from the first directory where the pom.xml file is found is then displayed
  in the minibuffer. The command can be edited as needed and then executed. Errors are navigate to as in any other compile mode"
  (interactive)
  (let ((fn (buffer-file-name)))
    (let ((dir (file-name-directory fn)))
      (while (and (not (file-exists-p (concat dir "/pom.xml")))
                  (not (equal dir (file-truename (concat dir "/..")))))
        (setq dir (file-truename (concat dir "/.."))))
      (if (not (file-exists-p (concat dir "/pom.xml")))
          (message "No pom.xml found")
        (compile (read-from-minibuffer "Command: "
                                       (concat "mvn -f " dir "/pom.xml " mvn-command-option " -Dmaven.test.skip=true")
                                       nil nil 'mvn-command-history))))))
;; String pattern for locating errors in maven output. This assumes a Windows drive letter at the beginning
(add-to-list
 'compilation-error-regexp-alist
 '("^\([a-zA-Z]:.*\):\[\([0-9]+\),\([0-9]+\)\]" 1 2 3))

;; set the classpaths we use
(setq jde-global-classpath '("/Users/joseph/.m2/repository/aopalliance/aopalliance/1.0/aopalliance-1.0.jar:/Users/joseph/.m2/repository/asm/asm/3.1/asm-3.1.jar:/Users/joseph/.m2/repository/cglib/cglib/2.2/cglib-2.2.jar:/Users/joseph/.m2/repository/cglib/cglib-nodep/2.2/cglib-nodep-2.2.jar:/Users/joseph/.m2/repository/com/google/code/gson/gson/1.4/gson-1.4.jar:/Users/joseph/.m2/repository/com/google/protobuf/protobuf-java/2.3.0/protobuf-java-2.3.0.jar:/Users/joseph/.m2/repository/com/rabbitmq/amqp-client/2.1.0/amqp-client-2.1.0.jar:/Users/joseph/.m2/repository/com/sun/xml/bind/jaxb-impl/2.1.12/jaxb-impl-2.1.12.jar:/Users/joseph/.m2/repository/com/sun/xml/stream/sjsxp/1.0.1/sjsxp-1.0.1.jar:/Users/joseph/.m2/repository/commons-cli/commons-cli/1.1/commons-cli-1.1.jar:/Users/joseph/.m2/repository/commons-codec/commons-codec/1.3/commons-codec-1.3.jar:/Users/joseph/.m2/repository/commons-httpclient/commons-httpclient/3.1/commons-httpclient-3.1.jar:/Users/joseph/.m2/repository/commons-io/commons-io/1.2/commons-io-1.2.jar:/Users/joseph/.m2/repository/javassist/javassist/3.6.0.GA/javassist-3.6.0.GA.jar:/Users/joseph/.m2/repository/javax/activation/activation/1.1/activation-1.1.jar:/Users/joseph/.m2/repository/javax/annotation/jsr250-api/1.0/jsr250-api-1.0.jar:/Users/joseph/.m2/repository/javax/servlet/servlet-api/2.5/servlet-api-2.5.jar:/Users/joseph/.m2/repository/javax/xml/bind/jaxb-api/2.1/jaxb-api-2.1.jar:/Users/joseph/.m2/repository/javax/xml/stream/stax-api/1.0/stax-api-1.0.jar:/Users/joseph/.m2/repository/jline/jline/0.9.94/jline-0.9.94.jar:/Users/joseph/.m2/repository/junit/junit/4.8.1/junit-4.8.1.jar:/Users/joseph/.m2/repository/net/jcip/jcip-annotations/1.0/jcip-annotations-1.0.jar:/Users/joseph/.m2/repository/org/apache/geronimo/specs/geronimo-jta_1.1_spec/1.1.1/geronimo-jta_1.1_spec-1.1.1.jar:/Users/joseph/.m2/repository/org/apache/httpcomponents/httpclient/4.0/httpclient-4.0.jar:/Users/joseph/.m2/repository/org/apache/httpcomponents/httpcore/4.0.1/httpcore-4.0.1.jar:/Users/joseph/.m2/repository/org/apache/lucene/lucene-core/2.9.2/lucene-core-2.9.2.jar:/Users/joseph/.m2/repository/org/codehaus/jackson/jackson-core-asl/1.6.0/jackson-core-asl-1.6.0.jar:/Users/joseph/.m2/repository/org/codehaus/jackson/jackson-jaxrs/1.5.3/jackson-jaxrs-1.5.3.jar:/Users/joseph/.m2/repository/org/codehaus/jackson/jackson-mapper-asl/1.5.3/jackson-mapper-asl-1.5.3.jar:/Users/joseph/.m2/repository/org/codehaus/jackson/jackson-xc/1.5.3/jackson-xc-1.5.3.jar:/Users/joseph/.m2/repository/org/codehaus/jettison/jettison/1.2/jettison-1.2.jar:/Users/joseph/.m2/repository/org/easymock/easymock/3.0/easymock-3.0.jar:/Users/joseph/.m2/repository/org/eclipse/jetty/jetty-continuation/7.1.6.v20100715/jetty-continuation-7.1.6.v20100715.jar:/Users/joseph/.m2/repository/org/eclipse/jetty/jetty-deploy/7.1.6.v20100715/jetty-deploy-7.1.6.v20100715.jar:/Users/joseph/.m2/repository/org/eclipse/jetty/jetty-http/7.1.6.v20100715/jetty-http-7.1.6.v20100715.jar:/Users/joseph/.m2/repository/org/eclipse/jetty/jetty-io/7.1.6.v20100715/jetty-io-7.1.6.v20100715.jar:/Users/joseph/.m2/repository/org/eclipse/jetty/jetty-security/7.1.6.v20100715/jetty-security-7.1.6.v20100715.jar:/Users/joseph/.m2/repository/org/eclipse/jetty/jetty-server/7.1.6.v20100715/jetty-server-7.1.6.v20100715.jar:/Users/joseph/.m2/repository/org/eclipse/jetty/jetty-servlet/7.1.6.v20100715/jetty-servlet-7.1.6.v20100715.jar:/Users/joseph/.m2/repository/org/eclipse/jetty/jetty-start/7.1.6.v20100715/jetty-start-7.1.6.v20100715.jar:/Users/joseph/.m2/repository/org/eclipse/jetty/jetty-util/7.1.6.v20100715/jetty-util-7.1.6.v20100715.jar:/Users/joseph/.m2/repository/org/eclipse/jetty/jetty-webapp/7.1.6.v20100715/jetty-webapp-7.1.6.v20100715.jar:/Users/joseph/.m2/repository/org/eclipse/jetty/jetty-xml/7.1.6.v20100715/jetty-xml-7.1.6.v20100715.jar:/Users/joseph/.m2/repository/org/jboss/resteasy/jaxrs-api/2.0.1.GA/jaxrs-api-2.0.1.GA.jar:/Users/joseph/.m2/repository/org/jboss/resteasy/resteasy-jackson-provider/2.0.1.GA/resteasy-jackson-provider-2.0.1.GA.jar:/Users/joseph/.m2/repository/org/jboss/resteasy/resteasy-jaxb-provider/2.0.1.GA/resteasy-jaxb-provider-2.0.1.GA.jar:/Users/joseph/.m2/repository/org/jboss/resteasy/resteasy-jaxrs/2.0.1.GA/resteasy-jaxrs-2.0.1.GA.jar:/Users/joseph/.m2/repository/org/jboss/resteasy/resteasy-jettison-provider/2.0.1.GA/resteasy-jettison-provider-2.0.1.GA.jar:/Users/joseph/.m2/repository/org/jboss/resteasy/resteasy-spring/2.0.1.GA/resteasy-spring-2.0.1.GA.jar:/Users/joseph/.m2/repository/org/neo4j/neo4j-apoc/1.1/neo4j-apoc-1.1.pom:/Users/joseph/.m2/repository/org/neo4j/neo4j-graph-algo/0.6/neo4j-graph-algo-0.6.jar:/Users/joseph/.m2/repository/org/neo4j/neo4j-index/1.1/neo4j-index-1.1.jar:/Users/joseph/.m2/repository/org/neo4j/neo4j-kernel/1.1/neo4j-kernel-1.1.jar:/Users/joseph/.m2/repository/org/neo4j/neo4j-online-backup/0.6/neo4j-online-backup-0.6.jar:/Users/joseph/.m2/repository/org/neo4j/neo4j-remote-graphdb/0.7/neo4j-remote-graphdb-0.7.jar:/Users/joseph/.m2/repository/org/neo4j/neo4j-shell/1.1/neo4j-shell-1.1.jar:/Users/joseph/.m2/repository/org/objenesis/objenesis/1.2/objenesis-1.2.jar:/Users/joseph/.m2/repository/org/scannotation/scannotation/1.0.2/scannotation-1.0.2.jar:/Users/joseph/.m2/repository/org/slf4j/jcl-over-slf4j/1.6.1/jcl-over-slf4j-1.6.1.jar:/Users/joseph/.m2/repository/org/slf4j/slf4j-api/1.6.1/slf4j-api-1.6.1.jar:/Users/joseph/.m2/repository/org/slf4j/slf4j-jdk14/1.6.1/slf4j-jdk14-1.6.1.jar:/Users/joseph/.m2/repository/org/springframework/spring-aop/3.0.4.RELEASE/spring-aop-3.0.4.RELEASE.jar:/Users/joseph/.m2/repository/org/springframework/spring-asm/3.0.4.RELEASE/spring-asm-3.0.4.RELEASE.jar:/Users/joseph/.m2/repository/org/springframework/spring-beans/3.0.4.RELEASE/spring-beans-3.0.4.RELEASE.jar:/Users/joseph/.m2/repository/org/springframework/spring-context/3.0.4.RELEASE/spring-context-3.0.4.RELEASE.jar:/Users/joseph/.m2/repository/org/springframework/spring-core/3.0.4.RELEASE/spring-core-3.0.4.RELEASE.jar:/Users/joseph/.m2/repository/org/springframework/spring-expression/3.0.4.RELEASE/spring-expression-3.0.4.RELEASE.jar:/Users/joseph/.m2/repository/org/springframework/spring-test/3.0.4.RELEASE/spring-test-3.0.4.RELEASE.jar:/Users/joseph/.m2/repository/org/springframework/spring-tx/3.0.4.RELEASE/spring-tx-3.0.4.RELEASE.jar:/Users/joseph/.m2/repository/org/springframework/spring-web/3.0.4.RELEASE/spring-web-3.0.4.RELEASE.jar:/Users/joseph/.m2/repository/org/zenoss/org.zenoss.amqp/1.0-SNAPSHOT/org.zenoss.amqp-1.0-SNAPSHOT.jar:/Users/joseph/.m2/repository/org/zenoss/org.zenoss.protobufs/1.0-SNAPSHOT/org.zenoss.protobufs-1.0-SNAPSHOT.jar"))

;; ;; flymake using eclipse
;; (require 'jde-eclipse-compiler-server)

;; ;; /Users/joseph/dev/eclipse/plugins/org.eclipse.jdt.core.manipulation_1.3.0.v20100520-0800.jar
;;  (add-to-list 'flymake-allowed-file-name-masks '("\\.java$" jde-ecj-flymake-init jde-ecj-flymake-cleanup))

;; customize this to not include imports everything else should work
;; jde-ecj-command-line-args