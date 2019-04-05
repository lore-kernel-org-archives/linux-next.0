From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the net-next tree
Date: Fri, 5 Apr 2019 16:58:24 +1100
Message-ID: <20190405165824.534c5c39@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7Qhfn2+Z5Gc5MXkc92/xL=A"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hoang Le <hoang.h.le@dektech.com.au>
List-Id: linux-next.vger.kernel.org

--Sig_/7Qhfn2+Z5Gc5MXkc92/xL=A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  e1279ff7aec1 ("tipc: add NULL pointer check")

Fixes tag

  Fixes: c55c8edafa9 ("tipc: smooth change between replicast and broadcast")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/7Qhfn2+Z5Gc5MXkc92/xL=A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlym7oAACgkQAVBC80lX
0GxNnAf/a4zGB5NFR0St3lnvtnIYoqb/NqjlLhC15g8GSZqBleyouduaOCOVEOT5
+fFd1+inRH4uIi1uuoO1i6qnuSuRap9r7jN6BktugbT3kiI2W72eANUgQI885SUg
Q5+ki+vpH0sVRH5J++LtkMpGVexNgervBH/zvnz+FUa8hTM8U8B/GWdhtGtmpLZF
lLESEF5lRztLjW7YDeEkgEnhIIxmAAS5p0BdfEpdpQorERxW3uepFbm+m3TW1BFH
ZwHxZRFFiSNQbkXsMNapMaJ0D24avxzpYFQlYotKsZqmsEHRI/DFt3xKGB6vCAz2
s3iHJH2lIIODX/ei1nGztEnzseElRw==
=cPma
-----END PGP SIGNATURE-----

--Sig_/7Qhfn2+Z5Gc5MXkc92/xL=A--
