From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH -next] staging: dgap: Add missing #include <linux/slab.h>
Date: Thu, 29 Aug 2013 22:53:25 +0200
Message-ID: <1377809605-27788-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gerard.telenet-ops.be ([195.130.132.48]:42039 "EHLO
	gerard.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756075Ab3H2Uxw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Aug 2013 16:53:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lidza Louina <lidza.louina@gmail.com>
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

drivers/staging/dgap/dgap_driver.c: In function =E2=80=98dgap_cleanup_m=
odule=E2=80=99:
drivers/staging/dgap/dgap_driver.c:423: error: implicit declaration of =
function =E2=80=98kfree=E2=80=99
drivers/staging/dgap/dgap_driver.c: In function =E2=80=98dgap_driver_kz=
malloc=E2=80=99:
drivers/staging/dgap/dgap_driver.c:940: error: implicit declaration of =
function =E2=80=98kmalloc=E2=80=99
drivers/staging/dgap/dgap_driver.c:940: warning: initialization makes p=
ointer from integer without a cast

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
http://kisskb.ellerman.id.au/kisskb/buildresult/9422860/
http://kisskb.ellerman.id.au/kisskb/buildresult/9419277/

 drivers/staging/dgap/dgap_driver.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/dgap/dgap_driver.c b/drivers/staging/dgap/=
dgap_driver.c
index 9f777e4..724a685 100644
--- a/drivers/staging/dgap/dgap_driver.c
+++ b/drivers/staging/dgap/dgap_driver.c
@@ -36,6 +36,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/delay.h>	/* For udelay */
+#include <linux/slab.h>
 #include <asm/uaccess.h>	/* For copy_from_user/copy_to_user */
=20
 #if LINUX_VERSION_CODE >=3D KERNEL_VERSION(2,6,39)
--=20
1.7.9.5
