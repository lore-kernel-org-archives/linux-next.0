From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: tip tree build warning
Date: Thu, 31 Dec 2009 10:45:05 +1100
Message-ID: <20091231104505.7cb8a241.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__31_Dec_2009_10_45_05_+1100_0+o1s1Wk2Sh.PVT7"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752211AbZL3XpV@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, stable@kernel.org, Shaun Ruffell <sruffell@digium.com>, Joerg Roedel <joerg.roedel@amd.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__31_Dec_2009_10_45_05_+1100_0+o1s1Wk2Sh.PVT7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's (and the previous few) linux-next build (powerpc allyesconfig)
produced this warning:

lib/dma-debug.c: In function 'dma_debug_device_change':
lib/dma-debug.c:680: warning: 'return' with no value, in function returning=
 non-void

Introduced by commit f797d9881b62c2ddb1d2e7bd80d87141949c84aa
("dma-debug: Do not add notifier when dma debugging is disabled").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__31_Dec_2009_10_45_05_+1100_0+o1s1Wk2Sh.PVT7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAks75gEACgkQjjKRsyhoI8x7VQCgm3TZZdO49kQ9bnLVoZU+f03H
CdEAnjwfYFGMK7z9esJ8woesR6tSI33E
=4rZo
-----END PGP SIGNATURE-----

--Signature=_Thu__31_Dec_2009_10_45_05_+1100_0+o1s1Wk2Sh.PVT7--
