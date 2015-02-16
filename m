From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the slave-dma tree
Date: Mon, 16 Feb 2015 12:09:34 +1100
Message-ID: <20150216120934.3f4dc936@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6Un7uNlmggZnjIMrY=D+6X4"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Robin Gong <b38343@freescale.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: linux-next.vger.kernel.org

--Sig_/6Un7uNlmggZnjIMrY=D+6X4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

After merging the slave-dma tree, today's linux-next build (arm multi_v7_de=
fconfig)
failed like this:

drivers/dma/imx-sdma.c: In function 'sdma_run_channel0':
drivers/dma/imx-sdma.c:535:57: error: macro "readl" passed 2 arguments, but=
 takes just 1
  if (readl(SDMA_H_CONFIG_CSM, sdma->regs + SDMA_H_CONFIG) =3D=3D 0)
                                                         ^
drivers/dma/imx-sdma.c:535:6: error: 'readl' undeclared (first use in this =
function)
  if (readl(SDMA_H_CONFIG_CSM, sdma->regs + SDMA_H_CONFIG) =3D=3D 0)
      ^

Caused by commit 66a073b6478d ("dmaengine: imx-sdma: switch to dynamic
context mode after script loaded").

I have used the slave-dma tree from next-20150213 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/6Un7uNlmggZnjIMrY=D+6X4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU4UNSAAoJEMDTa8Ir7ZwVpswQAIqLCwoksO6qee2NNt689tyW
idWoObMpn/YfifgQF3mk3cpLOkbcoWzcKQ1B1hELiEYtCS7IpGQ6cE1Qyg7WYACE
dlLqLfGIemmYK5snjfYePB3+GKzXCxKuHehIyLNbmB52VKLDKFPQQizOQ35JyMGh
GNFEwnrKABg7wKjMGNq/As3b6dPS/IqPFwVmPwn9d7C0eAqsVt4MJ01Fplcw/DXd
ZetkKtddcmEtWtJC0MWDk7k//1wqpOgJ7hykav5egRIOrO4iFD/hOoJbHlz2CWVI
iklrYDrOp/0kZdf7erHJs2jp32+dXzaPYQRebH6p0bXEe40hZCBNdi/4VW82OSvr
NaMR/dXBtTJu7M9pFiKZlwEvMP10JHey4Ke3E8jCdvvf0DLJWPjzcTKncNMWFL6+
IDErX+p+iIkdzuXILTFg3k6ix9Cl0kqIef0HkthTNnjjG6qmiMNfomQ08CMZ97O8
ffZkzpzV2xfCD+7OZDtLCzq8m5QeuT8l7UnvQgmWl7Cb6ssnVQ6KrlLO2ZJi1WmF
ma9k9N2qaNJI14/jAfIWBiX1CM97wKFegS3EZ+YDCP1rYPS/ab/fCL7Mq/J4uLoN
oEO9n79FlnXGEyvH5iIKemVyVNW8/IgsGtoHmQUr9R1habKhuSKiDNxbHrE++hP0
hOYE/qbnlUaqus+LauLC
=1k2D
-----END PGP SIGNATURE-----

--Sig_/6Un7uNlmggZnjIMrY=D+6X4--
