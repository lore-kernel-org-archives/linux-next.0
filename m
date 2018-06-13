From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the fbdev tree with Linus' tree
Date: Thu, 14 Jun 2018 09:40:05 +1000
Message-ID: <20180614094005.7de2c95e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/cLOMUZHCCuKOBXT_COQpXhm"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Markus Elfring <elfring@users.sourceforge.net>
List-Id: linux-next.vger.kernel.org

--Sig_/cLOMUZHCCuKOBXT_COQpXhm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bartlomiej,

Today's linux-next merge of the fbdev tree got a conflict in:

  drivers/video/fbdev/mmp/fb/mmpfb.c

between commit:

  6396bb221514 ("treewide: kzalloc() -> kcalloc()")

from Linus' tree and commit:

  e0e894f59418 ("video: fbdev-MMP: Delete an error message for a failed mem=
ory allocation in two functions")

from the fbdev tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/video/fbdev/mmp/fb/mmpfb.c
index f27697e07c55,292b3e403044..000000000000
--- a/drivers/video/fbdev/mmp/fb/mmpfb.c
+++ b/drivers/video/fbdev/mmp/fb/mmpfb.c
@@@ -493,12 -493,11 +493,11 @@@ static int modes_setup(struct mmpfb_inf
  		return 0;
  	}
  	/* put videomode list to info structure */
 -	videomodes =3D kzalloc(sizeof(struct fb_videomode) * videomode_num,
 -			GFP_KERNEL);
 +	videomodes =3D kcalloc(videomode_num, sizeof(struct fb_videomode),
 +			     GFP_KERNEL);
- 	if (!videomodes) {
- 		dev_err(fbi->dev, "can't malloc video modes\n");
+ 	if (!videomodes)
  		return -ENOMEM;
- 	}
+=20
  	for (i =3D 0; i < videomode_num; i++)
  		mmpmode_to_fbmode(&videomodes[i], &mmp_modes[i]);
  	fb_videomode_to_modelist(videomodes, videomode_num, &info->modelist);

--Sig_/cLOMUZHCCuKOBXT_COQpXhm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlshq1UACgkQAVBC80lX
0Gw6fgf+PeHsaHLzCdwE+tyKvNXYES8QeujT+UEkzGz1lbyTZPJv41UvwqWsDFbI
B2DpIXuF9TNjEsxtFvxv9zqS92VK8qIcbVxTrR3ul0d3j3nPxMAjLCl9g4EjBdQ+
8XP7QB6gX8Ov9q+T3VtTazSJYVMe9FE+fysC4IDQKhrH/tVP+2BPK2/XW146u7ku
5RuQF0OkpVZUoUr07YoMCr+Vb/5AJkLevVCkHq9HawJ+W+eUyAzHVzD1AYHsK3Rv
AliulTE3WnDWAtSjUut423Ng5XJv57FWJFD8dVbjLgmi+33cR5vKauHODg92sAS9
UlE6TfpXNHbIlgMn7tTZTT/JhhRB6Q==
=bBIz
-----END PGP SIGNATURE-----

--Sig_/cLOMUZHCCuKOBXT_COQpXhm--
