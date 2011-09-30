From: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: [PATCH] staging: add module.h to various iio drivers
Date: Fri, 30 Sep 2011 18:06:58 -0400
Message-ID: <1317420418-28335-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-l3A5Bk7waGM@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Since they are assuming it is there implicitly and will fail otherwise
with things like:

drivers/staging/iio/impedance-analyzer/ad5933.c:816: warning: type
 defaults to =E2=80=98int=E2=80=99 in declaration of =E2=80=98MODULE_AU=
THOR=E2=80=99

drivers/staging/iio/adc/ad7280a.c:990: warning: type defaults to =E2=80=
=98int=E2=80=99
 in declaration of =E2=80=98MODULE_AUTHOR=E2=80=99

Signed-off-by: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>

diff --git a/drivers/staging/iio/adc/ad7280a.c b/drivers/staging/iio/ad=
c/ad7280a.c
index ab6cf9c..6ca4532 100644
--- a/drivers/staging/iio/adc/ad7280a.c
+++ b/drivers/staging/iio/adc/ad7280a.c
@@ -14,6 +14,7 @@
 #include <linux/err.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/module.h>
=20
 #include "../iio.h"
 #include "../sysfs.h"
diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/=
staging/iio/impedance-analyzer/ad5933.c
index acc0e69..5783742 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -16,6 +16,7 @@
 #include <linux/types.h>
 #include <linux/err.h>
 #include <linux/delay.h>
+#include <linux/module.h>
 #include <asm/div64.h>
=20
 #include "../iio.h"
--=20
1.7.6
