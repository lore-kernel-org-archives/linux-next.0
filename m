From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sound tree
Date: Tue, 15 Jul 2008 15:47:21 +1000
Message-ID: <20080715154721.59e1db2c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__15_Jul_2008_15_47_21_+1000_4cupcZ8qba3skGO+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36564 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754130AbYGOFra (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Jul 2008 01:47:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, eric miao <eric.y.miao@gmail.com>, Russell King <rmk@arm.linux.org.uk>

--Signature=_Tue__15_Jul_2008_15_47_21_+1000_4cupcZ8qba3skGO+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Today's linux-next merge of the sound tree got a conflict in
sound/soc/pxa/pxa2xx-i2s.c between commit
5a2cc50f166babc26103279c4fbc9f2bf73b79de ("[ARM] 5063/1: pxa: add clk
support for pxa2xx I2S") from Linus' tree and commit
a0386ed67f59f89f14dca2955ca053e81f2b75a8 ("ALSA: asoc: pxa - merge
structs snd_soc_codec_dai and snd_soc_cpu_dai") from the sound tree
(which is also in Linus' tree).

This is probably just a slightly different version of a conflict that has
been in linux-next for some time.

I just added the section from Linus' tree.
(The conflict is below)
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc sound/soc/pxa/pxa2xx-i2s.c
index 8f96d87,9c06553..0000000
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@@ -80,10 -78,6 +80,13 @@@ static int pxa2xx_i2s_startup(struct sn
  {
        struct snd_soc_pcm_runtime *rtd =3D substream->private_data;
        struct snd_soc_dai *cpu_dai =3D rtd->dai->cpu_dai;
++<<<<<<< HEAD:sound/soc/pxa/pxa2xx-i2s.c
 +
 +      clk_i2s =3D clk_get(NULL, "I2SCLK");
 +      if (IS_ERR(clk_i2s))
 +              return PTR_ERR(clk_i2s);
++=3D=3D=3D=3D=3D=3D=3D
++>>>>>>> sound/master:sound/soc/pxa/pxa2xx-i2s.c
 =20
        if (!cpu_dai->active) {
                SACR0 |=3D SACR0_RST;

--Signature=_Tue__15_Jul_2008_15_47_21_+1000_4cupcZ8qba3skGO+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh8OekACgkQjjKRsyhoI8yN8wCgkh5H0l/aS5haHAksCsrPl1l6
oQcAn3hk39SCJ9TOsrvUkDehkPsA1m3S
=aBRo
-----END PGP SIGNATURE-----

--Signature=_Tue__15_Jul_2008_15_47_21_+1000_4cupcZ8qba3skGO+--
