From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the random tree
Date: Mon, 16 Jul 2018 15:52:07 +1000
Message-ID: <20180716155207.09fc752f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5PZ+fWbZrxkOjg9w2AfWn7B"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Theodore Ts'o <tytso@mit.edu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/5PZ+fWbZrxkOjg9w2AfWn7B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ted,

After merging the random tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/char/random.c: In function 'write_pool.constprop':
drivers/char/random.c:1912:11: warning: 't' may be used uninitialized in th=
is function [-Wmaybe-uninitialized]
    buf[i] ^=3D t;
           ^~

Introduced by commit

  349ddb707fb7 ("random: mix rdrand with entropy sent in from userspace")

--=20
Cheers,
Stephen Rothwell

--Sig_/5PZ+fWbZrxkOjg9w2AfWn7B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltMMocACgkQAVBC80lX
0Gz9KggAmFSVNwv17rtO9QrZGAkRxn8m6Vb1GFqAHE4E/EAOh7iGHrJnab1/vHHL
ibfT+qpj0nj90ZuW4+NkBRLcIBFmybNu5gn0b97jQbetigZW+7KT6LUoyUMz5ylb
o8yrvHo9PW5/vJMrkp0AqmzsD/Hd+sEdEWV6+tPcC8WsqlzymafV80HBT2WtRsbV
8IAGp4+8BUl/LzEa5GsLQA60KNFmDZ6sIfKBSrtOdJqTMRFF0fckhdCZQw6tbl/m
BYfkga8IkaqV+dbrSD18pkxVn8TzScGpT+fA8RQHuEU2PTfi06zN51JRTEnxNHkY
7/dGWW7xWyOfMz1KJvUorw12M1KZsQ==
=96qE
-----END PGP SIGNATURE-----

--Sig_/5PZ+fWbZrxkOjg9w2AfWn7B--
