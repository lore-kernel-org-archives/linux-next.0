From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mfd tree with the sound tree
Date: Fri, 20 Jul 2018 13:42:19 +1000
Message-ID: <20180720134219.680ae314@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5JD4bK+5wTLCMckjOCK2b9e"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Takashi Iwai <tiwai@suse.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>
List-Id: linux-next.vger.kernel.org

--Sig_/5JD4bK+5wTLCMckjOCK2b9e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mfd tree got a conflict in:

  drivers/gpu/drm/i915/Kconfig

between commit:

  a57942bfdd61 ("ALSA: hda: Make audio component support more generic")

from the sound tree and commit:

  9c229127aee2 ("drm/i915: hdmi: add CEC notifier to intel_hdmi")

from the mfd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/Kconfig
index 5c607f2c707b,2d65d567d5d1..000000000000
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@@ -23,7 -23,7 +23,8 @@@ config DRM_I91
  	select SYNC_FILE
  	select IOSF_MBI
  	select CRC32
 +	select SND_HDA_I915 if SND_HDA_CORE
+ 	select CEC_CORE if CEC_NOTIFIER
  	help
  	  Choose this option if you have a system that has "Intel Graphics
  	  Media Accelerator" or "HD Graphics" integrated graphics,

--Sig_/5JD4bK+5wTLCMckjOCK2b9e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltRWhsACgkQAVBC80lX
0GyWpgf+OPe3aiUyVE8K7aSjJluHBiq3EtdDeBYh4fVkvgwCgBM4Tg/X2nrnctpk
g2inYr6Jo0BPG009ePaYvBF/QnEYMB0CzFc5x1AZh8Xi3qaPvTpCaCCPQGdJeJPF
Wlf/FymBUuFI+glD/g6AqXP1kbosTxzGQygxY0P1Zovo4bmy/TqEkhavhajzqd9T
PQEvI8DdyBCPe4abwJdQRAtYTOIeCfYaa/zlBDm9Wwg4tRTTxDRCgkijvgARsT89
3EelS7u5U16DsN6w+/sA6UDF0eaBF9nGzytYG+3l0/AQyae0WcVHPpY1TLIuMisx
sQfYOyPWsWvjkGyH35+X5Yi18RVNlw==
=IeSq
-----END PGP SIGNATURE-----

--Sig_/5JD4bK+5wTLCMckjOCK2b9e--
