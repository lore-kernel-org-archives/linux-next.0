From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the sound-asoc tree
Date: Fri, 17 May 2019 08:34:11 +1000
Message-ID: <20190517083411.56ae5997@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/wB_apB0HY22uBX=AvE.6aQR"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>
List-Id: linux-next.vger.kernel.org

--Sig_/wB_apB0HY22uBX=AvE.6aQR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b06c58c2a1ee ("ASoC: fsl_asrc: Fix the issue about unsupported rate")

Fixes tag

  Fixes: fff6e03c7b65 ("ASoC: fsl_asrc: add support for 8-30kHz

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split fixes tags over more that one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/wB_apB0HY22uBX=AvE.6aQR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzd5WMACgkQAVBC80lX
0GxAcgf/bi0GX7TE6eiZ1/Y+J09jxCdks7tcJ75ey1IVBxTooVZTYYg3SEKMIIBl
X2rb5YozHithd6us+XAn58/KNe6z8fGZ9gnhqvISRNfLGb7qcamMwFvJoefs1lI6
Kc+ZjMwGF2pChp+kQceShsiVLFTCZVs3DCeq4S7mHsHXUe9ZAPHfOFNTo/KvCEDM
r9PBhzHKh7cFXDFQ63aI8fEDitPr2Dtf8CqAPykMrXHHXs0ckjProfTz/PFV8E1a
kywKv9nru/tbdGMP5C1qLej4tegLU+JrBDDsCa0OEyDCKFulkAL5PLKD0+1deA/t
YQ0XJDx/Q00fR9Ivx3odvOJqkFEIow==
=nwN0
-----END PGP SIGNATURE-----

--Sig_/wB_apB0HY22uBX=AvE.6aQR--
