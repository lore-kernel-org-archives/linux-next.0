From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sound tree build warning
Date: Wed, 12 Aug 2009 11:13:49 +1000
Message-ID: <20090812111349.14cb4d37.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__12_Aug_2009_11_13_49_+1000_7g8nKtU_uMrUGpLp"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755011AbZHLBN6@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Ribeiro <drwyrm@gmail.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__12_Aug_2009_11_13_49_+1000_7g8nKtU_uMrUGpLp
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

sound/soc/codecs/ad1938.c:458: warning: initialization from incompatible po=
inter type

Introduced by commit a5479e389e989acfeca9c32eeb0083d086202280 ("ASoC:
change set_tdm_slot api to allow slot_width override").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__12_Aug_2009_11_13_49_+1000_7g8nKtU_uMrUGpLp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqCF00ACgkQjjKRsyhoI8xQxQCfYA6qnHbPW1m2eASbYE3SXSmT
2XcAmwdSGZEEdB9GNiq4+WBUvUBBKV12
=EBO2
-----END PGP SIGNATURE-----

--Signature=_Wed__12_Aug_2009_11_13_49_+1000_7g8nKtU_uMrUGpLp--
