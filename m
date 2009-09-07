From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: security-testing tree build failure
Date: Mon, 7 Sep 2009 23:40:28 +1000
Message-ID: <20090907234028.6728eb5e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Sep_2009_23_40_28_+1000__K6R2Fr27PxQkgBT"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753317AbZIGNkh@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Russell King <rmk@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__7_Sep_2009_23_40_28_+1000__K6R2Fr27PxQkgBT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next build (arm lots of configs) failed like this:

arch/arm/kernel/signal.c: In function 'do_notify_resume':
arch/arm/kernel/signal.c:701: error: implicit declaration of function 'trac=
ehook_notify_resume'

Caused by commit d0420c83f39f79afb82010c2d2cafd150eef651b ("KEYS: Extend
TIF_NOTIFY_RESUME to (almost) all architectures [try #6]").  Presumably
the include of linux/tracehook.h is missing.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Sep_2009_23_40_28_+1000__K6R2Fr27PxQkgBT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqlDUwACgkQjjKRsyhoI8zcbgCfZuQSkWVYRZ122OZZstfjDdCQ
wCIAni74E1f1x+gOHg8i5lF1njKBQQjO
=zIXq
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Sep_2009_23_40_28_+1000__K6R2Fr27PxQkgBT--
