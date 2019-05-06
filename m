From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Fwd: linux-next: build failure after merge of the kbuild tree
Date: Mon, 6 May 2019 11:19:02 +0900
Message-ID: <CAK7LNASH4CuVBjfEJsT+aBx4aLrj9j2=aOD3B4f9+Tdcm=x2pg@mail.gmail.com>
References: <20190506094609.08e930f2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0000000000007ac93f05882ebb3c"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190506094609.08e930f2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--0000000000007ac93f05882ebb3c
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

In today's linux-next build testing,
more "make ... explicitly non-modular"
candidates showed up.


arch/arm/plat-omap/dma.c
drivers/clocksource/timer-ti-dm.c
drivers/mfd/omap-usb-host.c
drivers/mfd/omap-usb-tll.c

Would you send patches?

I think EXPORT_SYMBOL_GPL() in omap-usb-tll.c
are also unnecessary.

Thanks.



---------- Forwarded message ---------
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, May 6, 2019 at 8:51 AM
Subject: linux-next: build failure after merge of the kbuild tree
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel
Mailing List <linux-kernel@vger.kernel.org>, Alexey Gladkov
<gladkov.alexey@gmail.com>, Keshava Munegowda <keshava_mgowda@ti.com>,
Samuel Ortiz <sameo@linux.intel.com>


Hi Masahiro,

After merging the kbuild tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from include/linux/module.h:18,
                 from drivers/mfd/omap-usb-tll.c:21:
drivers/mfd/omap-usb-tll.c:462:26: error: expected ',' or ';' before
'USBHS_DRIVER_NAME'
 MODULE_ALIAS("platform:" USBHS_DRIVER_NAME);
                          ^~~~~~~~~~~~~~~~~
include/linux/moduleparam.h:26:47: note: in definition of macro '__MODULE_INFO'
   = __MODULE_INFO_PREFIX __stringify(tag) "=" info
                                               ^~~~
include/linux/module.h:164:30: note: in expansion of macro 'MODULE_INFO'
 #define MODULE_ALIAS(_alias) MODULE_INFO(alias, _alias)
                              ^~~~~~~~~~~
drivers/mfd/omap-usb-tll.c:462:1: note: in expansion of macro 'MODULE_ALIAS'
 MODULE_ALIAS("platform:" USBHS_DRIVER_NAME);
 ^~~~~~~~~~~~

Caused by commit

  6a26793a7891 ("moduleparam: Save information about built-in modules
in separate file")

USBHS_DRIVER_NAME is not defined and this kbuild tree change has
exposed it. It has been this way since commit

  16fa3dc75c22 ("mfd: omap-usb-tll: HOST TLL platform driver")

>From v3.7-rc1 in 2012.

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 6 May 2019 09:39:14 +1000
Subject: [PATCH] mfd: omap: remove unused MODULE_ALIAS from omap-usb-tll.c

USBHS_DRIVER_NAME has never been defined, so this cannot have ever
been used.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/mfd/omap-usb-tll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
index 446713dbee27..1cc8937e8bec 100644
--- a/drivers/mfd/omap-usb-tll.c
+++ b/drivers/mfd/omap-usb-tll.c
@@ -459,7 +459,7 @@ EXPORT_SYMBOL_GPL(omap_tll_disable);

 MODULE_AUTHOR("Keshava Munegowda <keshava_mgowda@ti.com>");
 MODULE_AUTHOR("Roger Quadros <rogerq@ti.com>");
-MODULE_ALIAS("platform:" USBHS_DRIVER_NAME);
+// MODULE_ALIAS("platform:" USBHS_DRIVER_NAME);
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("usb tll driver for TI OMAP EHCI and OHCI controllers");

--
2.20.1

--
Cheers,
Stephen Rothwell


-- 
Best Regards
Masahiro Yamada

--0000000000007ac93f05882ebb3c
Content-Type: application/pgp-signature; name=noname
Content-Disposition: attachment; filename=noname
Content-Transfer-Encoding: base64
Content-ID: <16a8aec8052c204bfcc1>
X-Attachment-Id: 16a8aec8052c204bfcc1

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NCg0KaVFFekJBRUJDQUFkRmlFRU5JQzk2Z2la
ODF0V2RMZ0tBVkJDODBsWDBHd0ZBbHpQZGNFQUNna1FBVkJDODBsWA0KMEd4UnRnZi9lNGNBdXRw
WENGUFdOcGRtTEpuejB5UitrOUN0UGdhd0I2dTEvNWhvUGswbkZyWTZCU0hwbGltdw0KUjg2L2o4
ajRoVmswMy9Yd3RjYVNGaXNqbnpVZ2lOSU04K3lWVU1WWUd0b20rM3hLLzR5RW42UGxXd1lybDBI
UQ0KbG5pemx1U2lyZk1IOHVkN1FxV3htMk1xbENuVlJTV0piM3UrM0pzaUljSkNiS3I3MjNVczNI
SUtKWktoK1MvdQ0KK3F3OXpscGM5c1U5N0JBWTBuVHh0VVFUVXVBTHF4UGYvanlXejlnR095dmF1
dW1zd1lDb3MxSmtVeHMzaWhqNg0KaGErWklyeWdXT3VmVXF0bGFENXNveGoxbEdNdkpheXZ2K3R6
bk1wQTNFUGxQMGNRTmwxR1FIbFQvWlVOTGJ4bQ0KVmpYcUNoUjZYaXRldWxyRG9tVGd5VHlJaUkz
WmVBPT0NCj1SNXhNDQotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0NCg==
--0000000000007ac93f05882ebb3c--
