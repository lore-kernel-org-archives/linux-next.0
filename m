From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Fri, 8 Feb 2019 13:18:23 +1100
Message-ID: <20190208131823.0fd205b5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/dC5s+7syQoLthq/0T6_91Yv"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>
List-Id: linux-next.vger.kernel.org

--Sig_/dC5s+7syQoLthq/0T6_91Yv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

sound/soc/xilinx/xlnx_formatter_pcm.c: In function 'xlnx_formatter_pcm_new':
sound/soc/xilinx/xlnx_formatter_pcm.c:539:9: error: void value not ignored =
as it ought to be
  return snd_pcm_lib_preallocate_pages_for_all(rtd->pcm,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    SNDRV_DMA_TYPE_DEV, component->dev,
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    xlnx_pcm_hardware.buffer_bytes_max,
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    xlnx_pcm_hardware.buffer_bytes_max);
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sound/soc/xilinx/xlnx_formatter_pcm.c:543:1: warning: control reaches end o=
f non-void function [-Wreturn-type]
 }
 ^

Caused by commit

  6f6c3c36f091 ("ASoC: xlnx: add pcm formatter platform driver")

interacting with commit

  9adb5165f1de ("ALSA: pcm: Define snd_pcm_lib_preallocate_*() as returning=
 void")

from the sound tree.

I have applied the following merge fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 8 Feb 2019 13:14:24 +1100
Subject: [PATCH] Asoc: xlnx: fix up for snd_pcm_lib_preallocate_pages_for_a=
ll() API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_=
formatter_pcm.c
index 97177d35652e..dc8721f4f56b 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -536,10 +536,11 @@ static int xlnx_formatter_pcm_new(struct snd_soc_pcm_=
runtime *rtd)
 {
 	struct snd_soc_component *component =3D snd_soc_rtdcom_lookup(rtd,
 								    DRV_NAME);
-	return snd_pcm_lib_preallocate_pages_for_all(rtd->pcm,
+	snd_pcm_lib_preallocate_pages_for_all(rtd->pcm,
 			SNDRV_DMA_TYPE_DEV, component->dev,
 			xlnx_pcm_hardware.buffer_bytes_max,
 			xlnx_pcm_hardware.buffer_bytes_max);
+	return 0;
 }
=20
 static const struct snd_pcm_ops xlnx_formatter_pcm_ops =3D {
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/dC5s+7syQoLthq/0T6_91Yv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxc5u8ACgkQAVBC80lX
0GyUqgf9FAFNpFyJcXdLgAa2q8jefELz/jD6C/KUnQa9QvDGfHjitpEYgXVF7/65
4IOyrlP4Nx7s+u/6WzXhSRHQyuOwL46pQr7SjaYyZwEXD775Rf+y9iVNblSKKj+9
ZtI+k+Id5ql7XqUOIZMbaCyKAmhKqhVPdUrcXSTPzmtN/0Iq/6Gu7B4Pe1K+uvc8
2ohN1VhEmlo+JR8qJ4lVMEJZLGbTubTaCwbiw2EkvI1cBe0mNZN1mlu6B1371Snm
elJH5ULszcEzoZ9A1+RWagfA5ps1Hk3vIoQ6R+78IWPoLjXzSZZpaRGuMoAmgeVi
OqKzNbxSqjpEs0mbl/cf/+sG7hMP3A==
=4bUa
-----END PGP SIGNATURE-----

--Sig_/dC5s+7syQoLthq/0T6_91Yv--
