From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with Linus' tree
Date: Fri, 27 Apr 2012 14:37:03 +1000
Message-ID: <20120427143703.f6946999cbca5509e22820a6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__27_Apr_2012_14_37_03_+1000_swpchh510WVI0/na"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jesper Juhl <jj@chaosbits.net>
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__27_Apr_2012_14_37_03_+1000_swpchh510WVI0/na
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in
drivers/staging/vt6656/ioctl.c between commit 17b7e1ba1e2e ("staging:
vt6656: Don't leak memory in drivers/staging/vt6656/ioctl.c::private_ioctl
()") from Linus' tree and commit 62ef30b5781d ("staging: vt6656: Remove
redundant casts from ioctl.c") from the staging tree.

I fixed it up (see below) and can carry the fix as necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/staging/vt6656/ioctl.c
index d59456c,cc7357d..0000000
--- a/drivers/staging/vt6656/ioctl.c
+++ b/drivers/staging/vt6656/ioctl.c
@@@ -565,7 -565,7 +565,7 @@@ int private_ioctl(PSDevice pDevice, str
  			result =3D -ENOMEM;
  			break;
  		}
- 		pNodeList =3D kmalloc(sizeof(SNodeList) + (sNodeList.uItem * sizeof(SNo=
deItem)), (int)GFP_ATOMIC);
 -		pNodeList =3D (PSNodeList)kmalloc(sizeof(SNodeList) + (sNodeList.uItem =
* sizeof(SNodeItem)), GFP_ATOMIC);
++		pNodeList =3D kmalloc(sizeof(SNodeList) + (sNodeList.uItem * sizeof(SNo=
deItem)), GFP_ATOMIC);
  		if (pNodeList =3D=3D NULL) {
  			result =3D -ENOMEM;
  			break;

--Signature=_Fri__27_Apr_2012_14_37_03_+1000_swpchh510WVI0/na
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPmiJvAAoJEECxmPOUX5FEU24P/3Qa0A5yU6GzcJ85UfKFRRdF
I018jFEbnq3ftZTuiRWFgHuOHhRJK/qgQvQjXa7igAR5eG6Px4ODfXM0CFB8R0bi
0f4s2HToJbkriN5fNZJvxzOtAWK8F6njbq+HnpHOXNUUx/szHeFhQTO6ZEyeb5Fn
VQkppm4bwbbLT47X5GkGOyPihZDe+KSsYtrFaVov/imfCnXQOsc6Z/LTHMOsvCgD
dXFhRLS0QU3JJKUdssFG48OGy/+hnoy7XBzIse4FZzSJKIHW/Xfnmh6L99kfggGr
F1G5lVK5CJdEJdJTa7O7Fp0GPCYFPR2NbPlYkAqkXXd+C7pEQUi3PGK2T26KuCYt
ZQvLhM/dHB3xyeLUnCpAVQOCa21AO97ctgtr68GhSj+3Y0VqwnhuWNHkHzj0jbLZ
xE+eoWjRj3n2zDkL87w9S4T7HKrDBVoKF7i36rlWPUYjgiF2aRA6ihIHx/bGkhA/
cgzcQn3rEo3ZRgPIqhrtdpvUyTJmonQRJHpINZls2yk29naCS0Zvr7LwFtun+WBx
si8gVB9UBgva5tAq6wBfCO1H5WLWnP0QHBTudxwLfBtuicjE7Dvqvewb9ThhlRox
rRgBLBmRG39+wHDixrq8y0EtR/JrGvLyWeTuDVTt2rTBYximXqpYAi/UWwanSYNV
fx6dNFG8NMN1lOY3crYF
=NFgK
-----END PGP SIGNATURE-----

--Signature=_Fri__27_Apr_2012_14_37_03_+1000_swpchh510WVI0/na--
