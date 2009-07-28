From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: wireless tree build warning
Date: Tue, 28 Jul 2009 14:31:41 +1000
Message-ID: <20090728143141.5d6108ff.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__28_Jul_2009_14_31_41_+1000_bDEsJwCZH9_yMtEz"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751364AbZG1Ebs@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vivek Natarajan <vivek.natraj@gmail.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__28_Jul_2009_14_31_41_+1000_bDEsJwCZH9_yMtEz
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

drivers/net/wireless/ath/ath9k/eeprom.c: In function 'ath9k_hw_AR9287_check=
_eeprom':
drivers/net/wireless/ath/ath9k/eeprom.c:2866: warning: comparison of distin=
ct pointer types lacks a cast

Introduced by commit ac88b6ecdfa629fd1261dab1504d78a56fd4cabf ("ath9k:
Add support for AR9287 based chipsets").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__28_Jul_2009_14_31_41_+1000_bDEsJwCZH9_yMtEz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpufy0ACgkQjjKRsyhoI8w6jACgkK+lBi/2z+UOWqzrSUD/sUbo
waAAoI32MeaJbMZ8tTBbHYf/G+BYEjo2
=4G/g
-----END PGP SIGNATURE-----

--Signature=_Tue__28_Jul_2009_14_31_41_+1000_bDEsJwCZH9_yMtEz--
