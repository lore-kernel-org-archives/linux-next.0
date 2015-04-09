From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the regulator tree
Date: Thu, 9 Apr 2015 14:33:09 +1000
Message-ID: <20150409143309.3a1fac67@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mOUKQKAxIZg41dfCkIaSfjE"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46938 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751070AbbDIEdR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Apr 2015 00:33:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hai Li <hali@codeaurora.org>, Rob Clark <robdclark@gmail.com>, Dave Airlie <airlied@linux.ie>, Bjorn Andersson <bjorn.andersson@sonymobile.com>

--Sig_/mOUKQKAxIZg41dfCkIaSfjE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the regulator tree, today's linux-next build (arm multi_v7_de=
fconfig)
failed like this:

drivers/gpu/drm/msm/dsi/dsi_host.c: In function 'dsi_host_regulator_disable=
':
drivers/gpu/drm/msm/dsi/dsi_host.c:330:4: error: implicit declaration of fu=
nction 'regulator_set_optimum_mode' [-Werror=3Dimplicit-function-declaratio=
n]
    regulator_set_optimum_mode(s[i].consumer,
    ^

Caused by commit a689554ba6ed ("drm/msm: Initial add DSI connector
support") from the drm tree interacting with commit ae6e808f1574
("regulator: Drop temporary regulator_set_optimum_mode wrapper") from
the regulator tree.

This happens every time someone renames/changes an API :-(

I have applied the following merge fix patch.  Someone needs to make
sure Linus finds out when the latter of these two trees is merged into
his.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 9 Apr 2015 14:28:42 +1000
Subject: [PATCH] drm/msm: fixes for regulator_set_optimum_mode name change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/d=
si_host.c
index fdc54e3eff55..962cf545d24c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -327,8 +327,7 @@ static void dsi_host_regulator_disable(struct msm_dsi_h=
ost *msm_host)
 	DBG("");
 	for (i =3D num - 1; i >=3D 0; i--)
 		if (regs[i].disable_load >=3D 0)
-			regulator_set_optimum_mode(s[i].consumer,
-						regs[i].disable_load);
+			regulator_set_load(s[i].consumer, regs[i].disable_load);
=20
 	regulator_bulk_disable(num, s);
 }
@@ -343,8 +342,8 @@ static int dsi_host_regulator_enable(struct msm_dsi_hos=
t *msm_host)
 	DBG("");
 	for (i =3D 0; i < num; i++) {
 		if (regs[i].enable_load >=3D 0) {
-			ret =3D regulator_set_optimum_mode(s[i].consumer,
-							regs[i].enable_load);
+			ret =3D regulator_set_load(s[i].consumer,
+						regs[i].enable_load);
 			if (ret < 0) {
 				pr_err("regulator %d set op mode failed, %d\n",
 					i, ret);
@@ -363,7 +362,7 @@ static int dsi_host_regulator_enable(struct msm_dsi_hos=
t *msm_host)
=20
 fail:
 	for (i--; i >=3D 0; i--)
-		regulator_set_optimum_mode(s[i].consumer, regs[i].disable_load);
+		regulator_set_load(s[i].consumer, regs[i].disable_load);
 	return ret;
 }
=20
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/mOUKQKAxIZg41dfCkIaSfjE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVJgEKAAoJEMDTa8Ir7ZwVeowP/296AysB/s2j8xMc/JTlU7FV
jZsszaNywSktAkuLrbGHF4wcSEST2nnmr+0UuEMWBvCDP/188hasH4916HrbO72d
ZXdPtshu0h5ZOnQgKDlHhcm2mi3t66q4IjbAyuLZEc8cKcyovvQSE0DJVoykdOQ7
EAGr2zZcvRNWoGwwpXfb2P8rW9GCiieL8ZEGbGH8jjj+wWi41pJTkCgTQpsH8skB
jnGkhxx88mX/xX37OlqiXkFOW9txcmhroYfenxh9UyJ82nd08pWBOx7bkvn6QXJR
N8oocsofn1ASJ/jINfNnHX6XShevWT98w7rJjeYxBujhSHkasxBug9iNUifwqYK9
4m1E0Xqdkh6hxPkO0vv57RYXyTqdssjIcfi1gOEWS5zPphPwmAcRiaw/oH+s0jr8
KMXdX4rNvkZ6qMu+hEacKqa/MnQiA27BeZYaF0I0T3Vyk633jvyJZJLniH64VOG3
3meXi1yo8Joz4LYecQTKOb4e/58IS4Xw3tSJoCIk5W1RHKOEXxj/E8HmW5GF5dd5
rH+eLZDgXjf6+NQk2IN4UjuVj6tF1pFYrWA172XcpMuAk27d9TsZ+OOGx/ZRiPTL
vKFMlRQR9+DzHHxF0bc7/5TpWigUFd8/m5D99yG5IRqSDvUETkixk+J3GRtuxiCl
DARv8lq5elMYfxn3Byeo
=f0f1
-----END PGP SIGNATURE-----

--Sig_/mOUKQKAxIZg41dfCkIaSfjE--
