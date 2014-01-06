From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the regulator tree
Date: Mon, 6 Jan 2014 17:37:03 +1100
Message-ID: <20140106173703.30c9197602a251e4113c10ab@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__6_Jan_2014_17_37_03_+1100_k5tOen+s_1rn642p"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wenyou Yang <wenyou.yang@atmel.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__6_Jan_2014_17_37_03_+1100_k5tOen+s_1rn642p
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the regulator tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from /scratch/sfr/next/include/linux/cache.h:4:0,
                 from /scratch/sfr/next/include/linux/time.h:4,
                 from /scratch/sfr/next/include/linux/stat.h:18,
                 from /scratch/sfr/next/include/linux/module.h:10,
                 from /scratch/sfr/next/drivers/regulator/act8865-regulator=
.c:18:
/scratch/sfr/next/drivers/regulator/act8865-regulator.c: In function 'act88=
65_pmic_probe':
/scratch/sfr/next/drivers/regulator/act8865-regulator.c:306:29: error: 'act=
8865_matches' undeclared (first use in this function)
  for (i =3D 0; i < ARRAY_SIZE(act8865_matches); i++) {
                             ^

Caused by commit d04b75527368 ("regulator: act8865: register all
regulators regardless of how many are used").  This build does not have
CONFIG_OF set.

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Mon__6_Jan_2014_17_37_03_+1100_k5tOen+s_1rn642p
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJSyk8TAAoJEMDTa8Ir7ZwVOMkP/1uqrUr+ZuC1jQ0jrP/Nfrjy
mFrtSzNhpEBZYwubr+XpIY28wVHzrhvz4DQ4GNlXpooiTdWAqH4JB3PKoq8WBA/3
lWiqEAY1qcp62kbN/nPqQHZJmRUr6QLbBPlXECTRNJeKbotx6x9NJ0PDxktAjLQ1
mfqKl0aJfkls68v6YlsnfMKQT85YR+DxJNsZ4qntALsffIBdL23Ws7O46Kgvwr1g
CJMMPI7beBs8d0dp48WSCiL1qXxeaNh1RLfQlj/Hne7JFv/nYnGZoBbWuOPDW9TA
Z1gmylCO4gwsFpLx1hs8QrFIr8FNRWu5KBmPdLvgwQfYMEJA4OKyjD3qHJLLto0c
FX0lQ9M80nnWXappukMsq/r6MP/SiTNzZ5u/CVpIfRaeK/iHr9MKTOJcgI78m/07
75HU+/Qtjc6UcbBOp51oluUg5BzNo3eVeZu2zwcAsQnR4EKiIJFXYN17bk39L/PS
FgsZekGEKhwYoXTgwabmIp7P0dDrtzzFZjPYsgpV3IB5WCidABgqH/jdNBYKmrbK
ThY4nEw4DcGChxY1UbC3/PnksZl9WhfpLP505Iim5BCEhQChwHfRDQJSe0OOwEkF
/GCpsU5ztYX6RYvvDMYVHK2TjEf2okaPotIFDAeHsY7ds2HOu91boiciuImDy2U/
gEtvGOhINI+qXvYKb5/F
=OGja
-----END PGP SIGNATURE-----

--Signature=_Mon__6_Jan_2014_17_37_03_+1100_k5tOen+s_1rn642p--
