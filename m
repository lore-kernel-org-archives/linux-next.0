From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the v4l-dvb tree
Date: Fri, 1 Feb 2019 10:25:47 +1100
Message-ID: <20190201102547.1eb9158d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4XDVUjH.35uiijZ++PF2lAV"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pawel Osciak <posciak@chromium.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
List-Id: linux-next.vger.kernel.org

--Sig_/4XDVUjH.35uiijZ++PF2lAV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the v4l-dvb tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/media/common/videobuf2/videobuf2-core.c: In function '__vb2_dqbuf':
drivers/media/common/videobuf2/videobuf2-core.c:1772:15: warning: unused va=
riable 'i' [-Wunused-variable]
  unsigned int i;
               ^

Introduced by commit

  2cc1802f62e5 ("media: vb2: Keep dma-buf buffers mapped until they are fre=
ed")

--=20
Cheers,
Stephen Rothwell

--Sig_/4XDVUjH.35uiijZ++PF2lAV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxTg/sACgkQAVBC80lX
0Gxftgf+MlJVRZ94sc+ZDZOx7dA1tFF7RUvsm1ii9XaUnFiIeBM4lgaj/pqhgwd4
0JjMjkQ0ch8SRfUnMtMwqQmISy7PouRImUQ8+JL2FF52Av9bJXEGEo/H60jLfES3
liG2LZ2NXPza8w9fKgJhiKGwAbCeCFOk8Qaut1dmvmIiZa+kIK/fyv+/qISYCbdP
SNJoxYD2zWPsD2tVPBzpBAtxnbKWpdjoni6jHH36op6J9YCJWtzfBZSqfkvaml4h
655sHFjZLaS75IWBm20N+brNPBASmmHROmt1t1tZAVirtGgEEbIoB54AVKVfUZiA
ctwkbXeG1YXlvoNoSGJE1ymeZeVPuA==
=WDeY
-----END PGP SIGNATURE-----

--Sig_/4XDVUjH.35uiijZ++PF2lAV--
