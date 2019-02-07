From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the sunxi tree
Date: Fri, 8 Feb 2019 00:50:42 +1100
Message-ID: <20190208005042.6b353e17@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/d+eRIT+1OUH4EPb868ItlbJ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/d+eRIT+1OUH4EPb868ItlbJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  df0aeb208b24 ("ARM: dts: sun9i: a80-optimus: Add node for AXP809's unused=
 dc1sw regulator")

Fixes tag

  Fixes: aa4a27bc819e ("ARM: dts: sun9i: a80-optimus: Add AXP809 PMIC

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please don't wrap the Fixes tag over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/d+eRIT+1OUH4EPb868ItlbJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxcN7IACgkQAVBC80lX
0GxTuwf+K+Dot6BOmPRtiyc1uN1tXZhp4cl3ssTep9EFaOnYGHps7oM0LcOWZgQS
wfLR1lZr3UOhcRqzQic+jPcfLZP6I8j7Cuif2JQvUGlRLwxIuqpXPslane/gON9q
ysZd9Gpv9tV3E3y8/g/RiePeYiDhHFaKfW/9RwEEl58Ad/3p/PmImr5+cpbncON+
DXzSJ5CIF31gjeESCht4YDfqPfWioxhE4b+wJLlLFBXRHhOUmnOUs7wl7B5KceIN
SPThONLzhNdxrIpEYafiUHC9DfaLDHnDMaUi19UwfNbmvF0YQKOEyUE/sfO04TAq
dfywZya1Q3q7ClY0yuEWX5K+CQWi3g==
=moIH
-----END PGP SIGNATURE-----

--Sig_/d+eRIT+1OUH4EPb868ItlbJ--
