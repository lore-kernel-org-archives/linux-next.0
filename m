From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-misc tree
Date: Tue, 24 Feb 2015 11:41:40 +1100
Message-ID: <20150224114140.3d310574@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/FCwSyTSeHiTLCCXOevkIImc"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38251 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751812AbbBXAlq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Feb 2015 19:41:46 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

--Sig_/FCwSyTSeHiTLCCXOevkIImc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpu/drm/tegra/drm.c: In function 'tegra_atomic_complete':
drivers/gpu/drm/tegra/drm.c:58:2: error: implicit declaration of function '=
drm_atomic_helper_commit_pre_planes' [-Werror=3Dimplicit-function-declarati=
on]
  drm_atomic_helper_commit_pre_planes(drm, state);
  ^
drivers/gpu/drm/tegra/drm.c:60:2: error: implicit declaration of function '=
drm_atomic_helper_commit_post_planes' [-Werror=3Dimplicit-function-declarat=
ion]
  drm_atomic_helper_commit_post_planes(drm, state);
  ^

Caused by commit ad9e7c89a4e4 ("drm/atomic-helper: Rename
commmit_post/pre_planes") interacting with commit 1503ca47d76e
("drm/tegra: Atomic conversion, phase 3, step 3") from v4.0-rc1.

I added the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 24 Feb 2015 11:37:11 +1100
Subject: [PATCH] drm/atomic-helper: fix for Rename commmit_post/pre_planes

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/tegra/drm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 7dd328d77996..5f1880766110 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -55,9 +55,9 @@ static void tegra_atomic_complete(struct tegra_drm *tegra,
 	 * current layout.
 	 */
=20
-	drm_atomic_helper_commit_pre_planes(drm, state);
+	drm_atomic_helper_commit_modeset_disables(drm, state);
 	drm_atomic_helper_commit_planes(drm, state);
-	drm_atomic_helper_commit_post_planes(drm, state);
+	drm_atomic_helper_commit_modeset_enables(drm, state);
=20
 	drm_atomic_helper_wait_for_vblanks(drm, state);
=20
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/FCwSyTSeHiTLCCXOevkIImc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU68jIAAoJEMDTa8Ir7ZwVHOYP/2C1G2aqVwktccAg2e7dUQSa
BC4N/RRo0Q8NitzS3p36FBLOFHmpt5RaA9Y1GX7szcF32R+fhQUogyFsZ7iys5Rr
B84W/IoVu2EYm319LHw+NwOY8f5z7yl9wQd5DMMEstAKLTHg4eGZQkXt/BDrndGL
p8LmA3BQX5IXm6+RTAeZ4fhwva1uw1b1qwm9FCdkinCBeytEqQM0FikwFaoX5Rds
i2c7mz1kr/jsoHWV7y4nsODjlXPyk54M9/pA4hzba4l/joYTeDq5po60NwSLC6kr
OLVpGeJILPdP655K1pQ4LfU0SG9Nlmol7gbtdqrLiMtkeRrd5ONQkBjuk7yR+LTh
FjMa4O/biM+JPfYd5OC7vx1TwU515x6MMsHLJXVATet4k1UEQb9ASvpGNvkdVZKP
6S7WOSZNgBk8VU1C5A0NYe0uaXNs9JPTk6vUmIqQt9/FV/x1QDi6moMB/6qO/Por
t3eSK6xx2zXXcpEKYxMzrqpRj7jeXR9l9GN/dpYgZHrdvRNaxVbz94j41/zt5hLV
hwq3R2ela2ctIspcJpNc5ysMnX5dJyMjXIUzYj3dNmR8jKm590te6947q93pkNCe
Ra7EY1EJHK+h7q5a/CQR7T+dgc6lmxhl55Hou0sgJu6jTzyOq5byswxTeKUoq/XP
5WItS15ZiptqjZ35vsAJ
=c5oO
-----END PGP SIGNATURE-----

--Sig_/FCwSyTSeHiTLCCXOevkIImc--
