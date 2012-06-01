From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (signal
 tree related)
Date: Fri, 1 Jun 2012 15:36:45 +1000
Message-ID: <20120601153645.c0d168bf7fd757bb3d89b959@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__1_Jun_2012_15_36_45_+1000_RZrAnoLZH=ZlUBRM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__1_Jun_2012_15_36_45_+1000_RZrAnoLZH=ZlUBRM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (s390 allyesconfig)
failed like this:

arch/s390/kernel/signal.c:437:50: error: expected ';' before ')' token
arch/s390/kernel/signal.c:437:50: error: expected statement before ')' token

Caused by commit 00d847ee4738 ("pull clearing RESTORE_SIGMASK into block_si=
gmask()").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__1_Jun_2012_15_36_45_+1000_RZrAnoLZH=ZlUBRM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPyFTuAAoJEECxmPOUX5FEakgP/0gv2imQ37dXWVsA38+Q9R3u
coXsbmj+gAFJ8oME84hw3SmbMpfdoJV/85FjN04oSnffikL8wRjIB45aIH4XPXJW
0RyG/YRp7wdy77Nuahs6QO9XnhP3i7qiRu+KI4reakvLggp+/4m+s4d/fh0KlZwx
MrZBEZqhVy5fPTte4rgLBErYRwCAoTai3MDgmJ5Npfi3yLwqLHOwkxIFaJ3Mlb2p
hbMxyh0b+5AlsGQPFB2k59OsgrLGUikeEvOcDouoYHTUAVXuLzz7lpTjgAJVS6Rm
LZqVRUOFbijYdGaDKupErqI56eC0RIOobUTNT+78rtRFo5sWkLCf1IMd44WsaAZP
sQD4qalnfvi2g5+pZDWng0sQ71vhxxkLZmd5lvVJgr0WraQbINGRb5cVFRTkq8me
pOTJz8RhBCE7WJnx1pk5j639R7nD0FODbK0SPi7p1vCJJGU3rSUV9BkmUIkgJMt0
QFTEpzO8l/ugNjP8X6mke6nFRzlD5CvglheSn408mK9wdAHaod0vnBcPxJEAGqt6
LnZ1TA65URT/6aaSsSF+zFGp278iGC3/m+dnEEBp1aYiBa1wwnbh7SpFFrL+8cpY
oVkL64T/Nhxv944GAvcNRJeNoLUG69CgfeZ8jKjCXkmJ1F+3lDB7Motu82Pzpm58
WeueF626GXYzEV2Nj5la
=/YJh
-----END PGP SIGNATURE-----

--Signature=_Fri__1_Jun_2012_15_36_45_+1000_RZrAnoLZH=ZlUBRM--
