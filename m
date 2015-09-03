From: Jim Davis <jim.epost@gmail.com>
Subject: Compiler warning with extract-cert.c in recent linux-next builds
Date: Thu, 3 Sep 2015 13:03:46 -0700
Message-ID: <CA+r1ZhgY_oev6vMDCTp+54SwJZnyHQa4Ah6XBmBrYGGosjJDTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, dhowells@redhat.com, David Woodhouse <dwmw2@infradead.org>, keyrings@linux-nfs.org
List-Id: linux-next.vger.kernel.org

Over the past couple of days, linux-next builds have been turning up
this compile warning

buildlog-1441309952.txt:scripts/extract-cert.c: In function =E2=80=98wr=
ite_cert=E2=80=99:
buildlog-1441309952.txt:scripts/extract-cert.c:89:2: warning: format
not a string literal and no format arguments [-Wformat-security]
buildlog-1441309952.txt-  ERR(!i2d_X509_bio(wb, x509), cert_dst);
buildlog-1441309952.txt-  ^

This is on an Ubuntu 15.04 installation, with

jim@krebstar:~/linux-next-2$ gcc --version
gcc (Ubuntu 4.9.2-10ubuntu13) 4.9.2

Naively adding a "%s" format string silences the warning,

diff --git a/scripts/extract-cert.c b/scripts/extract-cert.c
index fd0db015c65c..907fbd888e7b 100644
--- a/scripts/extract-cert.c
+++ b/scripts/extract-cert.c
@@ -86,7 +86,7 @@ static void write_cert(X509 *x509)
         ERR(!wb, "%s", cert_dst);
     }
     X509_NAME_oneline(X509_get_subject_name(x509), buf, sizeof(buf));
-    ERR(!i2d_X509_bio(wb, x509), cert_dst);
+    ERR(!i2d_X509_bio(wb, x509), "%s",cert_dst);
     if (kbuild_verbose)
         fprintf(stderr, "Extracted cert: %s\n", buf);
 }

but I won't pretend to understand the code in detail!

--=20
Jim
