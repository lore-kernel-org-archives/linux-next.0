From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-msm tree with the drm-misc tree
Date: Tue, 6 Nov 2018 11:08:57 +1100
Message-ID: <20181106110857.0b38fa37@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0669431702=="
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
To: Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mamta Shukla <mamtashukla555@gmail.com>
List-Id: linux-next.vger.kernel.org

--===============0669431702==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/yahXGyYDgNmkEuAQJp.Ra5m"; protocol="application/pgp-signature"

--Sig_/yahXGyYDgNmkEuAQJp.Ra5m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-msm tree got a conflict in:

  drivers/gpu/drm/msm/hdmi/hdmi.c

between commit:

  f384d7d514d1 ("drm: Convert to using %pOFn instead of device_node.name")

from the drm-misc tree and commit:

  bdc309778907 ("drm: msm: Use DRM_DEV_* instead of dev_*")

from the drm-msm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/msm/hdmi/hdmi.c
index 23670907a29d,74ffc2412f68..000000000000
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@@ -579,7 -585,7 +585,7 @@@ static int msm_hdmi_bind(struct device=20
  	hdmi_cfg =3D (struct hdmi_platform_config *)
  			of_device_get_match_data(dev);
  	if (!hdmi_cfg) {
- 		dev_err(dev, "unknown hdmi_cfg: %pOFn\n", of_node);
 -		DRM_DEV_ERROR(dev, "unknown hdmi_cfg: %s\n", of_node->name);
++		DRM_DEV_ERROR(dev, "unknown hdmi_cfg: %pOFn\n", of_node);
  		return -ENXIO;
  	}
 =20

--Sig_/yahXGyYDgNmkEuAQJp.Ra5m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvg25kACgkQAVBC80lX
0GxAMggAiJZdK93sVWWlZu9dKtT/eyjoG3cIWDN+q+EogqUKPM1gvKjGZeOrn6zZ
Eqzles2wqAtHDUwAi85T8GdLByPgGeYQSdjg/4ioLxzzVUIMC8XOr5B/ZH3/C5oT
9Ml9tykS/jd5rDdsxnDqFPX8MA6EsF7I/1zncZjKcs0g8t5+LV+1y7UuvPiAnYHJ
rPaa5eK8Lsy5nYNgOp/RctM2vF3cvGgucmjQgMCGjBKHwukud6mKp48hrbKJ0Fem
zy2JqGn/eayjEaXgB/LQ5B4/MoS42QKm51PF1H46cbfE1Hog3Efx3sHAWr4V7L1H
KVmWr/oU/4oAahW5s96/bdh+fzfO+w==
=Ryr9
-----END PGP SIGNATURE-----

--Sig_/yahXGyYDgNmkEuAQJp.Ra5m--

--===============0669431702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0669431702==--
