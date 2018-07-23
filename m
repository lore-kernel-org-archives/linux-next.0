From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-msm tree
Date: Mon, 23 Jul 2018 14:50:06 +1000
Message-ID: <20180723145006.5a26207f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0612575490=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Clark <robdclark@gmail.com>, Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--===============0612575490==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+xjnmUetd=y0duXd=.MLNVr"; protocol="application/pgp-signature"

--Sig_/+xjnmUetd=y0duXd=.MLNVr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rob,

[Dave, this will presumably soon turn up in the drm tree]

After merging the drm-msm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c: In function 'dpu_plane_destroy':
drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1483:3: error: too few arguments =
to function 'drm_plane_helper_disable'
   drm_plane_helper_disable(plane);
   ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/msm/msm_drv.h:43:0,
                 from drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:24:
include/drm/drm_plane_helper.h:72:5: note: declared here
 int drm_plane_helper_disable(struct drm_plane *plane,
     ^~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  drm_plane_helper_disable ("drm/msm: Add SDM845 DPU support")

interacting with commit

  070473bcf703 ("drm: add missing ctx argument to plane transitional helper=
s")

from the drm tree.

I have added this merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 23 Jul 2018 12:47:04 +1000
Subject: [PATCH] drm: msm: merge fix for drm_plane_helper_disable() API cha=
nge

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/ms=
m/disp/dpu1/dpu_plane.c
index d3d7ebf0c394..b640e39ebaca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1480,7 +1480,7 @@ static void dpu_plane_destroy(struct drm_plane *plane)
=20
 		mutex_destroy(&pdpu->lock);
=20
-		drm_plane_helper_disable(plane);
+		drm_plane_helper_disable(plane, NULL);
=20
 		/* this will destroy the states as well */
 		drm_plane_cleanup(plane);
--=20
2.18.0

--=20
Cheers,
Stephen Rothwell

--Sig_/+xjnmUetd=y0duXd=.MLNVr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltVXn4ACgkQAVBC80lX
0GzjNgf/Z6u2dz+1Fp7VQC3NvGWmKTfv7kkl/Anz1D6xfWlOCaJTi+Dv7VZFHcZp
oWnAolpBpEHeUHU/BIjm+HdieSYdg6nqFJg5mjLVPxe7CUUO0s9Mvh7rg+Th0vNK
NTj+vGPLgSSIVtPWw7NVkZXj1DEDLQpmYMhGDVdARudHSbnbMG8Udq5xCV1RVLJC
gDApa50kjrfb3Ujsh5dZ8x1qaOXX5KE0taakB4545enOiFvfTuPHKRFG5t38OGwh
a+/7yOZguW831CkJ1g2u+Noe2Vo7nn5IfPwpthfq/kBUkXyokkhSmPkCVFhsGnKj
ht7Tf+2gNgNLtIsAoOzUfCk3VPoaVw==
=pqLA
-----END PGP SIGNATURE-----

--Sig_/+xjnmUetd=y0duXd=.MLNVr--

--===============0612575490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0612575490==--
