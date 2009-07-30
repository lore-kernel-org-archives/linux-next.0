From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: kmemleak tree build failure
Date: Thu, 30 Jul 2009 16:00:12 +1000
Message-ID: <20090730160012.5814e251.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__30_Jul_2009_16_00_12_+1000_rNIFNMyaApnbNZFD"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751758AbZG3GAU@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__30_Jul_2009_16_00_12_+1000_rNIFNMyaApnbNZFD
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Catalin,

Today's linux-next build (x86_64 allmodconfig) failed like this:

arch/x86/kernel/process.c: In function 'free_thread_info':
arch/x86/kernel/process.c:58: error: implicit declaration of function 'kmem=
leak_free'

Caused by commit 3d898087320a732ec853c98f244253892616840f ("kmemleak:
Inform kmemleak about kernel stack allocation") from the kmemleak tree.
Probably a missing include of linux/kmemleak.h.

I have dropped the kmemleak tree for today.  (It accidentally did not
get included yesterday.)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__30_Jul_2009_16_00_12_+1000_rNIFNMyaApnbNZFD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpxNuwACgkQjjKRsyhoI8wG+gCgh8FppJqsXDkcIW5v7sgmDbd7
NWoAn0NSjbfxL6c7wvCtFDoQKMdM5bNL
=unLw
-----END PGP SIGNATURE-----

--Signature=_Thu__30_Jul_2009_16_00_12_+1000_rNIFNMyaApnbNZFD--
