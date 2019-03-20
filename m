From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the ntb tree
Date: Thu, 21 Mar 2019 07:58:18 +1100
Message-ID: <20190321075818.24f9703a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/wfWlJaTnCrn0=Kn4xr_QCJT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Mason <jdmason@kudzu.us>, NTB Mailing List <linux-ntb@googlegroups.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Logan Gunthorpe <logang@deltatee.com>
List-Id: linux-next.vger.kernel.org

--Sig_/wfWlJaTnCrn0=Kn4xr_QCJT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f4d0dd1064b8 ("NTB: ntb_transport: Ensure qp->tx_mw_dma_addr is initaliaz=
ed")

Fixes tag

  Fixes: c27ccb899219 ("NTB: ntb_transport: Ensure the destination buffer i=
s mapped for TX DMA")

has these problem(s):

  - Target SHA1 does not exist

Did you mean:

  c59666bb32b9 ("NTB: ntb_transport: Ensure the destination buffer is mappe=
d for TX DMA")

--=20
Cheers,
Stephen Rothwell

--Sig_/wfWlJaTnCrn0=Kn4xr_QCJT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlySqWoACgkQAVBC80lX
0Gx1tAf/QOrwg468avcjYsUY2uzPNwTYuM1iGFnq15ztb04t10OLvcTKOIizdD+j
Vtn6b9ZxkVoQUOER96omj01F4ZHbWntGOx1xKmsGg97+XJg9O0nb3bGqJo3RLnlJ
uNYE6jLi+veZEILiEJ7MYqWw11EM/blYVp0YUg8/rrA/jsPkNL7xLutce4IPMepZ
PZPRaskEbxTPWqkmU+bEyuSCyBGZSq4B7GxHRCbdaEAGMPEejcIkBwrWr4y6ddHM
UwjHkoyQzkF1ceGiTMqBQPmVimBKsLUX2pkQCZ8Vh02oF7LpC9Mm+2d546ufj06I
SFlqceiMAykAzB3rGP5k4/OaZQh2XA==
=0+8A
-----END PGP SIGNATURE-----

--Sig_/wfWlJaTnCrn0=Kn4xr_QCJT--
