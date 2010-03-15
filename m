From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v2] perf: Fix unexported generic
 perf_arch_fetch_caller_regs
Date: Tue, 16 Mar 2010 09:33:55 +1100
Message-ID: <20100316093355.071fde51.sfr@canb.auug.org.au>
References: <1268686806-7286-1-git-send-regression-fweisbec@gmail.com>
	<1268691442-8300-1-git-send-regression-fweisbec@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__16_Mar_2010_09_33_55_+1100_p7_wCx_WonIxv6Np"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1268691442-8300-1-git-send-regression-fweisbec@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Ingo Molnar <mingo@elte.hu>, LKML <linux-kernel@vger.kernel.org>, "\\ \" H . Peter Anvin \\ \"" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Linux Next <linux-next@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Xiao Guangrong <xiaoguangrong@cn.fujitsu.com>, Paul Mackerras <paulus@samba.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__16_Mar_2010_09_33_55_+1100_p7_wCx_WonIxv6Np
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Frederic,

On Mon, 15 Mar 2010 23:17:22 +0100 Frederic Weisbecker <fweisbec@gmail.com>=
 wrote:
>
> perf_arch_fetch_caller_regs() is exported for the overriden x86
> version, but not for the generic weak version.
> As a general rule, weak functions should have their symbol exported
                                          ^
"not"

> in the same file they are defined.
>=20
> So let's export it on trace_event_perf.c as it is used by trace
> events only.

Otherwise, looks good (though I haven't tested it).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__16_Mar_2010_09_33_55_+1100_p7_wCx_WonIxv6Np
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuetdMACgkQjjKRsyhoI8w7VgCglSfwgZB2ZWCVgNinzl987ayI
tcYAniWINO7SIJquimGQPhYXvVkOtr2q
=kKv0
-----END PGP SIGNATURE-----

--Signature=_Tue__16_Mar_2010_09_33_55_+1100_p7_wCx_WonIxv6Np--
