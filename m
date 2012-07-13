From: Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] ARM: mxs: fix compile error caused by prom_update_property change
Date: Fri, 13 Jul 2012 14:13:55 +0800
Message-ID: <1342160035-24170-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]:47793
	"EHLO ch1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1030184Ab2GMFxi convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Jul 2012 01:53:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>

The commit 475d009 (of: Improve prom_update_property() function)
changed prom_update_property interface, and causes the compile
error below.

  CC      arch/arm/mach-mxs/mach-mxs.o
arch/arm/mach-mxs/mach-mxs.c: In function =E2=80=98update_fec_mac_prop=E2=
=80=99:
arch/arm/mach-mxs/mach-mxs.c:216:4: error: too many arguments to functi=
on =E2=80=98prom_update_property=E2=80=99
include/linux/of.h:263:12: note: declared here

Update the caller update_fec_mac_prop to fix the error.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
The error is seen on next-20120712 where commit 475d009 (of: Improve
prom_update_property() function) emerges.

 arch/arm/mach-mxs/mach-mxs.c |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-mxs/mach-mxs.c b/arch/arm/mach-mxs/mach-mxs.=
c
index 648bdd0..8dabfe8 100644
--- a/arch/arm/mach-mxs/mach-mxs.c
+++ b/arch/arm/mach-mxs/mach-mxs.c
@@ -162,7 +162,7 @@ enum mac_oui {
 static void __init update_fec_mac_prop(enum mac_oui oui)
 {
 	struct device_node *np, *from =3D NULL;
-	struct property *oldmac, *newmac;
+	struct property *newmac;
 	const u32 *ocotp =3D mxs_get_ocotp();
 	u8 *macaddr;
 	u32 val;
@@ -208,11 +208,7 @@ static void __init update_fec_mac_prop(enum mac_ou=
i oui)
 		macaddr[4] =3D (val >> 8) & 0xff;
 		macaddr[5] =3D (val >> 0) & 0xff;
=20
-		oldmac =3D of_find_property(np, newmac->name, NULL);
-		if (oldmac)
-			prom_update_property(np, newmac, oldmac);
-		else
-			prom_add_property(np, newmac);
+		prom_update_property(np, newmac);
 	}
 }
=20
--=20
1.7.4.1
