From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sound tree with the davinci tree
Date: Thu, 23 Jul 2009 11:21:10 +1000
Message-ID: <20090723112110.e42430e9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__23_Jul_2009_11_21_10_+1000_mC3rUaRrIR40MFl6"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752495AbZGWBVS@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chaithrika U S <chaithrika@ti.com>, Pavel Kiryukhin <pkiryukhin@ru.mvista.com>, Naresh Medisetty <naresh@ti.com>, Steve Chen <schen@mvista.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Sudhakar Rajashekhara <sudhakar.raj@ti.com>, Kevin Hilman <khilman@deeprootsystems.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__23_Jul_2009_11_21_10_+1000_mC3rUaRrIR40MFl6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Today's linux-next merge of the sound tree got a conflict in
sound/soc/davinci/davinci-evm.c between commit
95d0d986d09ac25a5b9f2bf28f289ab0823e86d5 ("davinci: EDMA: multiple CCs,
channel mapping and API changes") from the davinci tree and commit
04f80f5c486b39446af44e218dba90ec210d61ca ("ASoC: Add machine driver
support for DM646x") from the sound tree.

The latter removes the code modified by the former.  I have just used the
latter.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__23_Jul_2009_11_21_10_+1000_mC3rUaRrIR40MFl6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpnuwYACgkQjjKRsyhoI8yJDwCcC6q4QwdEHSYj8ibh8Ln2FcHY
1TQAmwdT3TjdtEx+g9vsVx2+2LK6rx1n
=avKv
-----END PGP SIGNATURE-----

--Signature=_Thu__23_Jul_2009_11_21_10_+1000_mC3rUaRrIR40MFl6--
