From: David =?utf-8?b?SMOkcmRlbWFu?= <david@hardeman.nu>
Subject: [PATCH] hid-picolcd_cir: fix compilation
Date: Wed, 31 Oct 2012 09:22:08 +0100
Message-ID: <20121031082208.7522.22716.stgit@zeus.hardeman.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 1-1-12-13a.han.sth.bostream.se ([82.182.30.168]:38534 "EHLO
	palpatine.hardeman.nu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935002Ab2JaIWQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 31 Oct 2012 04:22:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: mchehab@infradead.org
Cc: sfr@canb.auug.org.au, bonbons@linux-vserver.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, jkosina@suse.cz

Commit c003ab1bedf0 ("[media] rc-core: add separate defines for
protocol bitmaps and numbers") overlooked hid-picolcd.

This patch (against git.linuxtv.org/media_tree.git, branch
staging/for_v3.8) fixes the compilation breakage.

Signed-off-by: David H=C3=A4rdeman <david@hardeman.nu>
---
 drivers/hid/hid-picolcd_cir.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-picolcd_cir.c b/drivers/hid/hid-picolcd_ci=
r.c
index 13ca919..a79e95b 100644
--- a/drivers/hid/hid-picolcd_cir.c
+++ b/drivers/hid/hid-picolcd_cir.c
@@ -116,7 +116,7 @@ int picolcd_init_cir(struct picolcd_data *data, str=
uct hid_report *report)
=20
 	rdev->priv             =3D data;
 	rdev->driver_type      =3D RC_DRIVER_IR_RAW;
-	rdev->allowed_protos   =3D RC_TYPE_ALL;
+	rdev->allowed_protos   =3D RC_BIT_ALL;
 	rdev->open             =3D picolcd_cir_open;
 	rdev->close            =3D picolcd_cir_close;
 	rdev->input_name       =3D data->hdev->name;
