From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the final tree (tip
 tree related)
Date: Thu, 24 Jun 2010 10:37:28 +1000
Message-ID: <20100624103728.88fb2a39.sfr@canb.auug.org.au>
References: <20100624023117.219953e4.sfr@canb.auug.org.au>
	<20100623165523.GG5242@nowhere>
	<20100624093103.35b56e0a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__24_Jun_2010_10_37_28_+1000_lIfQfp5mzB2Kiu0o"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33825 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753893Ab0FXAhi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 23 Jun 2010 20:37:38 -0400
In-Reply-To: <20100624093103.35b56e0a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Paul Mundt <lethal@linux-sh.org>

--Signature=_Thu__24_Jun_2010_10_37_28_+1000_lIfQfp5mzB2Kiu0o
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Frederic,

> On Wed, 23 Jun 2010 18:55:25 +0200 Frederic Weisbecker <fweisbec@gmail.co=
m> wrote:
> >
> > There is a pending fix:
> >=20
> > From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
> > [PATCH] perf: Fix argument of perf_arch_fetch_caller_regs
> >=20
> > I'm going to send a pull request to Ingo so that gets fixed soon.

In the mean time, I will apply that patch to linux-next today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__24_Jun_2010_10_37_28_+1000_lIfQfp5mzB2Kiu0o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkwiqMgACgkQjjKRsyhoI8wVngCeKq8DZhssx/MAMdHWAHOYOqfv
cBAAn3l5qQCZ/rwiv3xVej9d1Z0j9v/I
=LvZB
-----END PGP SIGNATURE-----

--Signature=_Thu__24_Jun_2010_10_37_28_+1000_lIfQfp5mzB2Kiu0o--
