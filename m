From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the ceph tree
Date: Mon, 20 Sep 2010 11:41:36 +1000
Message-ID: <20100920114136.33d75323.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__20_Sep_2010_11_41_36_+1000_Ak/QqNnY6Ce6vTKk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sage Weil <sage@newdream.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Farnum <gregf@hq.newdream.net>
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__20_Sep_2010_11_41_36_+1000_Ak/QqNnY6Ce6vTKk
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sage,

After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

net/ceph/pagelist.c: In function 'ceph_pagelist_truncate':
net/ceph/pagelist.c:136: error: implicit declaration of function 'pagelist_=
unmap_tail'

Caused by commit d73f8eefea20406cba00b80a65747844df120559 ("ceph: add pagel=
ist_reserve, pagelist_truncate, pagelist_set_cursor").

I have used the version of the ceph tree from next-20100917 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__20_Sep_2010_11_41_36_+1000_Ak/QqNnY6Ce6vTKk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMlrvQAAoJEDMEi1NhKgbscLYH/A7SSIAisAXAnxTJ+KzUA7IJ
ZYCorW/KqzJhuvbFSEP3n+WdUOMLzSCXEhlnNVpMjQv1wCSL34SCmyLAe5cgIItJ
UqlAHL3ywS2Flkv73FvuliG2KSaJelR/p6SFpNmKuTn15i6xX62jRqvNKXiy5Kag
OXdxCuuB4V3CuY0leEx874SXl8oWLul/OLHW6/rnkaQzyzY2HU9iZQuOZMojevNe
LuAfGWH3Mfk0K4MKGnZdaUe8YMhPnVos81XJpldi1VG7SpKcXVOfWN9ZBqvDwCEp
mNJXoXuOvFBASR6wOCeWueA5l64w7+bUnjESH71Tt0RtEXe+xuNMFckcRAir1lE=
=jU+P
-----END PGP SIGNATURE-----

--Signature=_Mon__20_Sep_2010_11_41_36_+1000_Ak/QqNnY6Ce6vTKk--
