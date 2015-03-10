From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the regulator tree
Date: Tue, 10 Mar 2015 13:44:41 +1100
Message-ID: <20150310134441.1aa4bb60@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9z/X+u0f8q_H5h0+0fR.SEd"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Hai Li <hali@codeaurora.org>, Rob Clark <robdclark@gmail.com>, Yaniv Gardi <ygardi@codeaurora.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/9z/X+u0f8q_H5h0+0fR.SEd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the regulator tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpu/drm/msm/edp/edp_ctrl.c: In function 'edp_regulator_enable':
drivers/gpu/drm/msm/edp/edp_ctrl.c:335:2: error: implicit declaration of fu=
nction 'regulator_set_optimum_mode' [-Werror=3Dimplicit-function-declaratio=
n]
  ret =3D regulator_set_optimum_mode(ctrl->vdda_vreg, VDDA_UA_ON_LOAD);
  ^

Caused by commits e39ce48f5362 ("regulator: Rename
regulator_set_optimum_mode") and ae6e808f1574 ("regulator: Drop
temporary regulator_set_optimum_mode wrapper") interacting with commit
ab5b0107ccf3 ("drm/msm: Initial add eDP support in msm drm driver
(v5)") from Linus' tree (in v4.0-rc1) tree.

There was another use of regulator_set_optimum_mode() in
drivers/phy/phy-qcom-ufs.c (introduced by commit adaafaa393ef ("phy:
qcom-ufs: add support for QUALCOMM Technologies UFS PHY drivers") also
from v4.0-rc1) which I also fixed in the patch below.

grep is your friend ...

This patch should be applied to your tree as it is based off v4.0-rc1
already.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 10 Mar 2015 13:35:59 +1100
Subject: [PATCH] fixes for regulator_set_optimum_mode name change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/msm/edp/edp_ctrl.c | 6 +++---
 drivers/phy/phy-qcom-ufs.c         | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c b/drivers/gpu/drm/msm/edp/e=
dp_ctrl.c
index 3e246210c46f..0ec5abdba5c4 100644
--- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
+++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
@@ -332,7 +332,7 @@ static int edp_regulator_enable(struct edp_ctrl *ctrl)
 		goto vdda_set_fail;
 	}
=20
-	ret =3D regulator_set_optimum_mode(ctrl->vdda_vreg, VDDA_UA_ON_LOAD);
+	ret =3D regulator_set_load(ctrl->vdda_vreg, VDDA_UA_ON_LOAD);
 	if (ret < 0) {
 		pr_err("%s: vdda_vreg set regulator mode failed.\n", __func__);
 		goto vdda_set_fail;
@@ -356,7 +356,7 @@ static int edp_regulator_enable(struct edp_ctrl *ctrl)
 lvl_enable_fail:
 	regulator_disable(ctrl->vdda_vreg);
 vdda_enable_fail:
-	regulator_set_optimum_mode(ctrl->vdda_vreg, VDDA_UA_OFF_LOAD);
+	regulator_set_load(ctrl->vdda_vreg, VDDA_UA_OFF_LOAD);
 vdda_set_fail:
 	return ret;
 }
@@ -365,7 +365,7 @@ static void edp_regulator_disable(struct edp_ctrl *ctrl)
 {
 	regulator_disable(ctrl->lvl_vreg);
 	regulator_disable(ctrl->vdda_vreg);
-	regulator_set_optimum_mode(ctrl->vdda_vreg, VDDA_UA_OFF_LOAD);
+	regulator_set_load(ctrl->vdda_vreg, VDDA_UA_OFF_LOAD);
 }
=20
 static int edp_gpio_config(struct edp_ctrl *ctrl)
diff --git a/drivers/phy/phy-qcom-ufs.c b/drivers/phy/phy-qcom-ufs.c
index 44ee983d57fe..86665e9dc399 100644
--- a/drivers/phy/phy-qcom-ufs.c
+++ b/drivers/phy/phy-qcom-ufs.c
@@ -346,10 +346,10 @@ int ufs_qcom_phy_cfg_vreg(struct phy *phy,
 			goto out;
 		}
 		uA_load =3D on ? vreg->max_uA : 0;
-		ret =3D regulator_set_optimum_mode(reg, uA_load);
+		ret =3D regulator_set_load(reg, uA_load);
 		if (ret >=3D 0) {
 			/*
-			 * regulator_set_optimum_mode() returns new regulator
+			 * regulator_set_load() returns new regulator
 			 * mode upon success.
 			 */
 			ret =3D 0;
--=20
2.1.4
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/9z/X+u0f8q_H5h0+0fR.SEd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU/lqdAAoJEMDTa8Ir7ZwVhXkP+gL9VktgGQT9hJGgQ/qs6jGY
FMYHwfYJh27DJX4ECb2oelGfpvlQfyu6Z7OVyP+XDs6P0oz8B8L1GVpopvQQM55U
tYNUonRR38t6w/Fzh+xzsFObyd8EJAMHasEzJf4zxl0FeE755yhEDv1i+qZu+bRZ
aU0u3SLvuyvbs4DX1FgKgj/0O4mDun+pVuH6RfkMBUi8agQyUHTUPh9dGynnFnCM
jRN5gBKAb3QroM96cpWNwv6+DxOSAfWPdDTTRNnp+1Z/12c3tqoUMXen++PvFjBk
WBjAVHHn/2zQEZXnC/zWz6+GhPzotM33B6ywI1ULcN5roe6h9e2wuxQINkplKX89
wo46ySSgzIIbXS3pNZxAOUCtV3fTNHP2bnq6EQ/zMlrAUwr5RcqtmfQL9TNJXWTb
P4F/0Nn71iIl1z65SAxwkBIU4hdOhyM05BHluZyuIrsIA4I6XpjVJ17FGQKhxkZI
K5pYdZjn9ye19FJWtKu5Lusd2zIa9drVVvRqHl82WfeXGJb+TA19bKopsj4NmmOr
W/rmQ5EezUrRiGV4esMfY0t3UNa/MMpvFMGfWVG8r8Y1YgZgEQcE16Pb0SY8oEXn
JP/omeGHCZSG4837fvwWCOdZQm/J8ToFRQUKm+TXFlJPu4r5X+415zUYgxFfjkMI
iUN4VqXfZ6t88uJa60rc
=MiMo
-----END PGP SIGNATURE-----

--Sig_/9z/X+u0f8q_H5h0+0fR.SEd--
