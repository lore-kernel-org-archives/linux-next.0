From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the sound-asoc tree
Date: Thu, 2 Aug 2018 14:06:30 +1000
Message-ID: <20180802140630.7618b9d1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/fu4qPo_36Zq/xl/Y6r3sLCJ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rohit kumar <rohitkr@codeaurora.org>
List-Id: linux-next.vger.kernel.org

--Sig_/fu4qPo_36Zq/xl/Y6r3sLCJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: unmet direct dependencies detected for SND_SOC_QDSP6
  Depends on [n]: SOUND [=3Dm] && !UML && SND [=3Dm] && SND_SOC [=3Dm] && Q=
COM_APR [=3Dn] && HAS_DMA [=3Dy]
  Selected by [m]:
  - SND_SOC_SDM845 [=3Dm] && SOUND [=3Dm] && !UML && SND [=3Dm] && SND_SOC =
[=3Dm]

Introduced by commit

  6b1687bf76ef ("ASoC: qcom: add sdm845 sound card support")

--=20
Cheers,
Stephen Rothwell

--Sig_/fu4qPo_36Zq/xl/Y6r3sLCJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltig0YACgkQAVBC80lX
0Gwr2Qf/YzcvpELTqK+2twSOMiBXWDwoVM1JdWi6sUFm99u31dwPVzTm0dZLm8t5
lLkx0lJ88XYDvi/cIEOTgrG2SZuouBNQaNEkCGJOy1g/QALZu+t4KKWCkt3e8UiJ
S2TvfdTmFUmhOA+23SrBnUixIlWQvVrBS+vQZKVS/6zr5SJAYammtQEAo4ntlTCU
mqYyKGf+G/JMo5kmZzSKtUIVgM+9odQxzxBiDuKjMplaHsLWGEeM8fj1LbHUWAtv
v5aeNZeEoFzO4WOau16DAi/HAgAaVAN4MyRNsG4xcyZ7KekMtOezvbfAvmZHDwR0
kfgu0rNsDJcmAucm9b0hnCH8xNJbIQ==
=R9UE
-----END PGP SIGNATURE-----

--Sig_/fu4qPo_36Zq/xl/Y6r3sLCJ--
