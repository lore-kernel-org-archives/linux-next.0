From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] perf: Also export the weak version of
 perf_arch_fetch_caller_regs
Date: Fri, 12 Mar 2010 17:20:43 +1100
Message-ID: <20100312172043.aa034ede.sfr@canb.auug.org.au>
References: <20100312150003.afd9b59a.sfr@canb.auug.org.au>
	<20100312055043.GB5014@nowhere>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__12_Mar_2010_17_20_43_+1100_IAFj4Vxo/Hfc3fXG"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33737 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753110Ab0CLGUu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Mar 2010 01:20:50 -0500
In-Reply-To: <20100312055043.GB5014@nowhere>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Fri__12_Mar_2010_17_20_43_+1100_IAFj4Vxo/Hfc3fXG
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Frederic,

On Fri, 12 Mar 2010 06:50:44 +0100 Frederic Weisbecker <fweisbec@gmail.com>=
 wrote:
>
> Does that fixes the issue? Sorry I can not test for now...

I can't test it right now, sorry, but I have heard that EXPORT_SYMBOL's
for weak symbols must be in a different file from the actual symbol
definition.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__12_Mar_2010_17_20_43_+1100_IAFj4Vxo/Hfc3fXG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuZ3TsACgkQjjKRsyhoI8xDvQCeLSlUTlelHntXFYNIDrHf+tNj
tgsAoJ8pSI1n8z93eWXL8hOi7X878fLM
=0AnT
-----END PGP SIGNATURE-----

--Signature=_Fri__12_Mar_2010_17_20_43_+1100_IAFj4Vxo/Hfc3fXG--
