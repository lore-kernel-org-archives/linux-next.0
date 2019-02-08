From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the apparmor tree
Date: Fri, 8 Feb 2019 18:33:32 +1100
Message-ID: <20190208183332.47dc655a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/uS4PLsnuHLrdg_ZH0=xgX/4"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Johansen <john.johansen@canonical.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chris Coulson <chris.coulson@canonical.com>
List-Id: linux-next.vger.kernel.org

--Sig_/uS4PLsnuHLrdg_ZH0=xgX/4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the apparmor tree, today's linux-next build (powerpc
allyesconfig) failed like this:

security/apparmor/policy_unpack.c: In function 'deflate_compress':
security/apparmor/policy_unpack.c:1064:4: error: implicit declaration of fu=
nction 'vfree'; did you mean 'kfree'? [-Werror=3Dimplicit-function-declarat=
ion]
    vfree(stgbuf);
    ^~~~~
    kfree

Caused by commit

  876dd866c084 ("apparmor: Initial implementation of raw policy blob compre=
ssion")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/uS4PLsnuHLrdg_ZH0=xgX/4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxdMMwACgkQAVBC80lX
0Gwzjwf/ZCSuAYz/zQuV2+5MzeQ2oW0vmlnjdR3sRRRm9e+HoGeD3//cFeKWsNPL
JWus6w8GoJ+SifTg5Pplgc0uhHHPuNcTCEO0dxvRwf4jSWw46VSEv92BST2q9BV6
BnfxXx0x5NIDGIVspOiLtbwQ+hn/7P7jF+F0nmGSnwxxHJEfaDIWCruOYGGrrSso
NhsUCxpMMJQUSS27YSzmHMzR07ypgQRqTDyRV6h/vQJb5m1+3J5mGLE9EdPuerMe
FZYR5FKugUcnvrLySbnZuxCrJfb1Re53sew5dESyrPcveiUgBq9a1OK7uz5AQcfi
5QLxH6WAbBBi8fG7LGARuFBOsEQiUA==
=efXZ
-----END PGP SIGNATURE-----

--Sig_/uS4PLsnuHLrdg_ZH0=xgX/4--
