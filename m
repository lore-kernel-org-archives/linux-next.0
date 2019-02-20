From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree with the dma-mapping
 tree
Date: Thu, 21 Feb 2019 10:58:51 +1100
Message-ID: <20190221105851.5b0a9b20@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9qZbnT/+rkMau5rPE3RXGXh"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Christoph Hellwig <hch@lst.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
List-Id: linux-next.vger.kernel.org

--Sig_/9qZbnT/+rkMau5rPE3RXGXh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the v4l-dvb tree got a conflict in:

  drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c

between commit:

  82c5de0ab8db ("dma-mapping: remove the DMA_MEMORY_EXCLUSIVE flag")

from the dma-mapping tree and commit:

  43a445f188e1 ("media: sh_mobile_ceu_camera: remove obsolete soc_camera dr=
iver")

from the v4l-dvb tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/9qZbnT/+rkMau5rPE3RXGXh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxt6bsACgkQAVBC80lX
0GxEcQf/d2kq/a1lx+IVPNdHYa1ZDF2Wl4/WoHlZx14OQ0cU4mmawzvzfhmYqulI
bfF2LwPEbmJ3f+yOns9APDyWZCREcjfQxSKX5g0JbRLkoK2ZZjVQtglexOAF/+0G
D4QL6H3E76oqzhtZ32G3VUJt1KqfU+BaNp+OMjHzclQ39iYFlUuFrKCtwb/tl9H7
+BgagX8wp80SBMxHS7sntcm8g8Q/AuyLihitEWe7+AI6sGEK3EBAh9h3WSn8VRRa
PbfKdKLGJJtKRE9QDeZCyCOva/Vj/SxaaLzVGBL0p51MeQ+XuYkBERZvgKOTp4p3
sFpmw+YoG0qCS/GdkabExDrmpyzuEw==
=NlNm
-----END PGP SIGNATURE-----

--Sig_/9qZbnT/+rkMau5rPE3RXGXh--
