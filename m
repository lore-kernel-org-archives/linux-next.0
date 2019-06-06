From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree with Linus' tree
Date: Thu, 6 Jun 2019 10:43:49 +1000
Message-ID: <20190606104349.49dfb934@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Oe11bsP0hu.ON7m8r/ymXG5"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
List-Id: linux-next.vger.kernel.org

--Sig_/Oe11bsP0hu.ON7m8r/ymXG5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the v4l-dvb tree got conflicts in:

  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
  drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h
  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
  drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
  drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
  drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
  drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
  drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
  drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
  drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
  drivers/media/platform/mtk-vcodec/vdec_drv_base.h
  drivers/media/platform/mtk-vcodec/vdec_drv_if.c
  drivers/media/platform/mtk-vcodec/vdec_drv_if.h
  drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
  drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
  drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
  drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
  drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
  drivers/media/platform/mtk-vcodec/venc_drv_base.h
  drivers/media/platform/mtk-vcodec/venc_drv_if.c
  drivers/media/platform/mtk-vcodec/venc_drv_if.h
  drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
  drivers/media/platform/mtk-vcodec/venc_vpu_if.c
  drivers/media/platform/mtk-vcodec/venc_vpu_if.h

between commit:

  1802d0beecaf ("treewide: Replace GPLv2 boilerplate/reference with SPDX - =
rule 174")

from Linus' tree and commit:

  9293e39c5d7f ("media: mtk-vcodec: replace GPLv2 with SPDX")

from the v4l-dvb tree.

I fixed it up (I just iused the versions from the v4l-dvb tree -
although I think that they may have gone to far in removing copyright
notices as well as the license boilerplate) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Oe11bsP0hu.ON7m8r/ymXG5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz4YcUACgkQAVBC80lX
0GxHTwgAhapoLlcNm/ijbK3nJPCKVqsRXgRCJuFJNRFCOD0SMage0zi9ipz6HfTM
4RLOF6sCkB8tr06vVgFjeNQX6FjbM0pGhuFMol+S9Z4QZpbFKJFg2TYINaCBJe3B
JLEur1yCBzpJ2kIpsLDOp5mEyQtirO2+YPc7Stbb6WQDLBGPAkqmUZYmtpwYD4wC
tllX7pmk+2yMqdrgDCRbpBOunzo9IbxIC8+ewUKslTvfPUTf7uoxp08LRUDQ+MUR
yp7RaI887ErIxwXoK/G+bBJmxDa23IQszxfoGGgYhibyf9AgTGuMyO/HCRdGDDK4
8UF0TzxOyIfpXuyZff7eI7oOv9PCZQ==
=cvIS
-----END PGP SIGNATURE-----

--Sig_/Oe11bsP0hu.ON7m8r/ymXG5--
