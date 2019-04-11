From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the net tree
Date: Fri, 12 Apr 2019 07:12:57 +1000
Message-ID: <20190412071257.6938724c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/UZUhTazmj94X+MvEKmN=W.h"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Karsten Graul <kgraul@linux.ibm.com>, Ursula Braun <ubraun@linux.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/UZUhTazmj94X+MvEKmN=W.h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8ef659f1a840 ("net/smc: fix return code from FLUSH command")

Fixes tag

  Fixes: a9d8b0b1e3d6 ("net/smc: add pnet table namespace support")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: 64e28b52c7a6 ("net/smc: add pnet table namespace support")

--=20
Cheers,
Stephen Rothwell

--Sig_/UZUhTazmj94X+MvEKmN=W.h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyvrdkACgkQAVBC80lX
0GxSiQf8DinySrDzTx9Ich9P/QxAn+gvzs+VRuXVnYI2tgPNPp7WyhcOyW1/BQ+g
lz/2L107TmrnZuGgryboNJP/Mvr2j1O4AbgeBfi1rnb8c535CaJaizd53EXSGeJK
jhgMhLwdioAy8GMrbnxE9Zrf7x/buT0VOdkeu4gHEn2VDV/5J5hwn1qQFtLVfqqs
yol6oUhHvUD1YlCDtT87prtArMJFYolQAeufXdcCS2LktG97j8VSukxNb08m46Eo
mt3H4IBG799Iyt+YgAYgQbH88fHwr4Ikk/CrdlwVo3VrHy7qkwyaBr6tCl259rJ2
lzPVIkIQeGLx8I6G7SSzo3HmZ4c9pg==
=4GTJ
-----END PGP SIGNATURE-----

--Sig_/UZUhTazmj94X+MvEKmN=W.h--
