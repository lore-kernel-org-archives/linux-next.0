From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH] drm/bridge: sti_dvo: adapt to updated bridge API
Date: Thu, 29 Jan 2015 14:44:30 +0530
Message-ID: <1422522870-25693-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:56820 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760382AbbA2JWv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Jan 2015 04:22:51 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NIX003GWM215T10@mailout1.samsung.com> for
 linux-next@vger.kernel.org; Thu, 29 Jan 2015 18:22:49 +0900 (KST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org
Cc: airlied@redhat.com, paul.gortmaker@windriver.com, inki.dae@samsung.com, thierry.reding@gmail.com, seanpaul@google.com, ajaynumb@gmail.com, bhushan.r@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Commits 8eb17f05bc1802b50f8b536406357b87f63cf61d
("drm/bridge: do not pass drm_bridge_funcs to drm_bridge_init") and
fbc4572e9c48e45bdfeb2ee8c8f0198b3e70c030
("drm/bridge: make bridge registration independent of drm flow")
changed the bridge API without taking into account sti_dvo bridge
which caused the following build breakage on linux-next:

drivers/gpu/drm/sti/sti_dvo.c: In function =E2=80=98sti_dvo_brigde_dest=
roy=E2=80=99:
drivers/gpu/drm/sti/sti_dvo.c:277:2: error: implicit declaration of fun=
ction =E2=80=98drm_bridge_cleanup=E2=80=99
drivers/gpu/drm/sti/sti_dvo.c: At top level:
drivers/gpu/drm/sti/sti_dvo.c:287:2: error: unknown field =E2=80=98dest=
roy=E2=80=99 specified in initializer
drivers/gpu/drm/sti/sti_dvo.c: In function =E2=80=98sti_dvo_bind=E2=80=99=
:
drivers/gpu/drm/sti/sti_dvo.c:419:2: error: implicit declaration of fun=
ction =E2=80=98drm_bridge_init=E2=80=99

Make the necessary changes to sti_dvo bridge in order to fix the build =
breakage.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
This patch contains the minimal changes needed instead of having this:
http://cgit.freedesktop.org/~airlied/linux/commit/?h=3Ddrm-next&id=3D38=
4764c3611645d96889742a079168c86a6fc4c4

 drivers/gpu/drm/sti/sti_dvo.c |   11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dv=
o.c
index 651afad..1088fc5 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -272,19 +272,12 @@ static void sti_dvo_bridge_nope(struct drm_bridge=
 *bridge)
 	/* do nothing */
 }
=20
-static void sti_dvo_brigde_destroy(struct drm_bridge *bridge)
-{
-	drm_bridge_cleanup(bridge);
-	kfree(bridge);
-}
-
 static const struct drm_bridge_funcs sti_dvo_bridge_funcs =3D {
 	.pre_enable =3D sti_dvo_pre_enable,
 	.enable =3D sti_dvo_bridge_nope,
 	.disable =3D sti_dvo_disable,
 	.post_disable =3D sti_dvo_bridge_nope,
 	.mode_set =3D sti_dvo_set_mode,
-	.destroy =3D sti_dvo_brigde_destroy,
 };
=20
 static int sti_dvo_connector_get_modes(struct drm_connector *connector=
)
@@ -416,7 +409,8 @@ static int sti_dvo_bind(struct device *dev, struct =
device *master, void *data)
 		return -ENOMEM;
=20
 	bridge->driver_private =3D dvo;
-	drm_bridge_init(drm_dev, bridge, &sti_dvo_bridge_funcs);
+	bridge->funcs =3D &sti_dvo_bridge_funcs;
+	drm_bridge_attach(drm_dev, bridge);
=20
 	encoder->bridge =3D bridge;
 	connector->encoder =3D encoder;
@@ -446,7 +440,6 @@ static int sti_dvo_bind(struct device *dev, struct =
device *master, void *data)
 err_sysfs:
 	drm_connector_unregister(drm_connector);
 err_connector:
-	drm_bridge_cleanup(bridge);
 	drm_connector_cleanup(drm_connector);
 	return -EINVAL;
 }
--=20
1.7.9.5
