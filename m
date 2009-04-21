From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sched tree build warning
Date: Tue, 21 Apr 2009 13:28:22 +1000
Message-ID: <20090421132822.4d947570.sfr@canb.auug.org.au>
References: <20090421102706.e19240a0.sfr@canb.auug.org.au>
	<20090421031049.GA4140@in.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__21_Apr_2009_13_28_22_+1000_WVtEHi2MHnSwHaOY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49670 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753748AbZDUD2a (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Apr 2009 23:28:30 -0400
In-Reply-To: <20090421031049.GA4140@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ego@in.ibm.com
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>

--Signature=_Tue__21_Apr_2009_13_28_22_+1000_WVtEHi2MHnSwHaOY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Gautham,

On Tue, 21 Apr 2009 08:40:49 +0530 Gautham R Shenoy <ego@in.ibm.com> wrote:
>
> Yes, it should be cpumask_first. Patch appended.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__21_Apr_2009_13_28_22_+1000_WVtEHi2MHnSwHaOY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkntPVYACgkQjjKRsyhoI8zgZwCgs+5krOtnvA+XdU/RXzOw3hlt
Z2YAn3Ok6OU6PGSzLQBZFifVRtpMUglm
=5Nxa
-----END PGP SIGNATURE-----

--Signature=_Tue__21_Apr_2009_13_28_22_+1000_WVtEHi2MHnSwHaOY--
