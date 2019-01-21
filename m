From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the sound tree
Date: Mon, 21 Jan 2019 11:21:48 +1100
Message-ID: <20190121112148.591aa586@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/i0=jcW/0wXIqaqa5k9yLkpH"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>
List-Id: linux-next.vger.kernel.org

--Sig_/i0=jcW/0wXIqaqa5k9yLkpH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

After merging the sound tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

sound/pci/hda/hda_codec.c: In function 'hda_codec_runtime_suspend':
sound/pci/hda/hda_codec.c:2926:18: warning: unused variable 'pcm' [-Wunused=
-variable]
  struct hda_pcm *pcm;
                  ^~~

Introduced by commit

  17bc4815de58 ("ALSA: pci: Remove superfluous snd_pcm_suspend*() calls")

--=20
Cheers,
Stephen Rothwell

--Sig_/i0=jcW/0wXIqaqa5k9yLkpH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxFEJwACgkQAVBC80lX
0Gyk2Af/f91kbIth3V532/gGMTmJk6Pr49NM2M/AeyJrAB1ypLKoy3UaeGOs1VEy
gbS8nH9nHSkha3jyJKdFG3ir+A7jLqzX/dKLLD+806UoaqFOa6OBM2nBj1QGI/Y4
QBQKoD/gF6H9zuBXgW30X9tSIRp1/+twGZ4WsgsdSDfMPhqBGGts2+zesVpcAQFC
HTSyed4tlthe6PbwbSAb/OpMQL8tnJ4BafzS5QxOicM+Q5xxlNvTdPOCbmrvV9ZI
ctgGMjpJ3C+oLVKT9TtQHc8UJO4P03rl3ufmE8PepPJAAz43n+NByWwPcqhhTbN2
YYiNm1Miq3DZX8r5AM/XpJjwb/4yLg==
=6w2p
-----END PGP SIGNATURE-----

--Sig_/i0=jcW/0wXIqaqa5k9yLkpH--
