openssl s_client -connect jira.introbay.com:443 < /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /tmp/public.crt
$JAVA_HOME/bin/keytool -import -alias jira.introbay.com -keystore $JAVA_HOME/jre/lib/security/cacerts -file /tmp/public.crt
rm /tmp/public.crt
