From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the drivers-x86 tree
Date: Wed, 17 Apr 2019 07:33:49 +1000
Message-ID: <20190417073349.3fadd192@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/MtS/Z8_SxH.4Z12.q1J3aeX"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: linux-next.vger.kernel.org

--Sig_/MtS/Z8_SxH.4Z12.q1J3aeX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  6cc13c28da5b ("platform/x86: dell-laptop: fix rfkill functionality")

Fixes tag

  Fixes: 549b49 ("platform/x86: dell-smbios: Introduce dispatcher for SMM c=
alls")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/MtS/Z8_SxH.4Z12.q1J3aeX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly2Sj0ACgkQAVBC80lX
0GzBFggAo6r0WhMdvUg5ZQyb8D4rTe81gwO/cIU61IQEsI39OOW8Wuhd3NVxwc9V
8BDhEP/wT25VsnhRkOTDEC4KACAHNIU5SGV1paLT0slGgK/+J5iTpvO/svBIgjNp
DJRLgWkrgFGAZRWZsg/H+GJoOgdnHrvynYKRLNxh7tQ49cu4MEKU/IxkQFvjQjKi
32FRKtYN5WhWqJzlWT0Z1Xuk8mW+usX+bByxwlpybp+ta7gMBcmIXHrpzkknYfoz
HCOufbtfwd9SZDQa+ZaPeBpdwZJFj9kwOlJ2mocEUgMMRZ4CYVDD92hg0arCG7iY
Lw3onaItBDDCSVDypNC5koWe0Wpulg==
=8Pbd
-----END PGP SIGNATURE-----

--Sig_/MtS/Z8_SxH.4Z12.q1J3aeX--
