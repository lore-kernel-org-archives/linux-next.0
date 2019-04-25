From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the printk tree
Date: Thu, 25 Apr 2019 23:30:49 +1000
Message-ID: <20190425233049.7e2283b0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Yyontrw5S2VclYYMUmXe8cu"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/Yyontrw5S2VclYYMUmXe8cu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  e43bb4d0feb8 ("vsprintf: Consistent %pK handling for kptr_restrict =3D=3D=
 0")

Fixes tag

  Fixes: commit ef0010a30935de4e0211 ("vsprintf: don't use 'restricted_poin=
ter()' when not restricting")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/Yyontrw5S2VclYYMUmXe8cu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzBtokACgkQAVBC80lX
0GwzZAf+Kdqa0CTbOnVe/SKI3EepZ2UY9VNLICynylv8/TmjgE4Shi4G8jo2+1rm
z/tuNRhW+EluAMupigRBJHqfsgMJ74oSXaAfLudjXQW16dkWCJ8w6d4zqvb58YFL
LL7qvquL3bO2YSgxT9D/Mb42JFtx0RXvsMSzQ8ME81sEEw7nRfrTiAjiYhnH8aQv
R8Oii3VToXX78TuGfZTGbR10tezKlUzNcUhSaTVGzlN0wNzFM2VVt3PNpcf31P6u
nbYNrhZq5hw1XH2cB7te3TbwNm2wqqGyzSi42QJWtnqhkGLVcppo3UF8A4dONTbq
Dgg3LuAXY3EhnTJNgumRNHO0zIdU8Q==
=vlVq
-----END PGP SIGNATURE-----

--Sig_/Yyontrw5S2VclYYMUmXe8cu--
