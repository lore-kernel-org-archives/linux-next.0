From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the final tree (tip
 tree related)
Date: Mon, 29 Nov 2010 13:50:23 +1100
Message-ID: <20101129135023.4a931f86.sfr@canb.auug.org.au>
References: <20101122133949.93201b15.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__29_Nov_2010_13_50_23_+1100_D+2vzFyl45FjNu4N"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20101122133949.93201b15.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Don Zickus <dzickus@redhat.com>, David Miller <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__29_Nov_2010_13_50_23_+1100_D+2vzFyl45FjNu4N
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 22 Nov 2010 13:39:49 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the final tree, today's linux-next build (sparc64 defconfig)
> failed like this:
>=20
> arch/sparc/kernel/nmi.c:54: error: redefinition of 'touch_nmi_watchdog'
> include/linux/nmi.h:21: note: previous definition of 'touch_nmi_watchdog'=
 was here
>=20
> Caused (or, at least exposed) by commit
> 5f2b0ba4d94b3ac23cbc4b7f675d98eb677a760a ("x86, nmi_watchdog: Remove the
> old nmi_watchdog").  Sparc appears to have a touch_nmi_watchdog() and
> defines ARCH_HAS_NMI_WATCHDOG but not CONFIG_HARDLOCKUP_DETECTOR.
>=20
> I have reverted that commit for today (as well as commit
> 072b198a4ad48bd722ec6d203d65422a4698eae7 "x86, nmi_watchdog: Remove all
> stub function calls from old nmi_watchdog" that depends on it).

This build failure is back, so I have reverted the above commits again.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__29_Nov_2010_13_50_23_+1100_D+2vzFyl45FjNu4N
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJM8xTvAAoJEDMEi1NhKgbs+WsIAKBwM0bdUMzLMed6lKEbEXVK
JT5Rk6Uj4RQVV3KFbI/Fce6q0v7YibYs+iByPgDIlL0XDae4pgKdjTQNtfuKVvY1
midlwas+5aK4KQUgTS0FXjvrKo4IgNKwsu9mvrjJJSCz5lvzPwtxzAv9RyCP0bDS
OWMo8C9fj9y+hN+3IXqluiEuWJExoo8laUV11gIjTdWvuQ493l7PT/HRJDp3VXbg
xKMkOfJAWL4UpdLaTCW8wYXSXOEVl5dtiWLAS9iSMM+mCqJpetuJFXKOLNk2WLpk
IcbVYjfAmOaADjY13AGZTEHdE275pIL2sxyHXTfJsEoNbcD0GAFovatAehNfXDg=
=2Out
-----END PGP SIGNATURE-----

--Signature=_Mon__29_Nov_2010_13_50_23_+1100_D+2vzFyl45FjNu4N--
