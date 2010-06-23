From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the final tree (tip
 tree related)
Date: Thu, 24 Jun 2010 09:31:03 +1000
Message-ID: <20100624093103.35b56e0a.sfr@canb.auug.org.au>
References: <20100624023117.219953e4.sfr@canb.auug.org.au>
	<20100623165523.GG5242@nowhere>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__24_Jun_2010_09_31_03_+1000_evR7eHMFri_HmG=x"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43932 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753933Ab0FWXbL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 23 Jun 2010 19:31:11 -0400
In-Reply-To: <20100623165523.GG5242@nowhere>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Paul Mundt <lethal@linux-sh.org>

--Signature=_Thu__24_Jun_2010_09_31_03_+1000_evR7eHMFri_HmG=x
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Frederic,

On Wed, 23 Jun 2010 18:55:25 +0200 Frederic Weisbecker <fweisbec@gmail.com>=
 wrote:
>
> There is a pending fix:
>=20
> From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
> [PATCH] perf: Fix argument of perf_arch_fetch_caller_regs
>=20
> I'm going to send a pull request to Ingo so that gets fixed soon.

Excellent, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__24_Jun_2010_09_31_03_+1000_evR7eHMFri_HmG=x
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkwimTcACgkQjjKRsyhoI8yVkgCgkzumpBjMxpZImOjgpUqeGaGV
fsMAn1nX0ljVgQOWtJH7kH1ncsxc8BQY
=8/fU
-----END PGP SIGNATURE-----

--Signature=_Thu__24_Jun_2010_09_31_03_+1000_evR7eHMFri_HmG=x--
