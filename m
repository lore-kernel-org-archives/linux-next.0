From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: ftrace tree build failure
Date: Fri, 15 Aug 2008 18:29:34 +1000
Message-ID: <20080815182934.40bf771a.sfr@canb.auug.org.au>
References: <20080815122743.9715a5e1.sfr@canb.auug.org.au>
	<20080815075614.GA3010@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__15_Aug_2008_18_29_34_+1000_aDsfyU7zQSKZJBT4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55246 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753410AbYHOI3o (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Aug 2008 04:29:44 -0400
In-Reply-To: <20080815075614.GA3010@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>

--Signature=_Fri__15_Aug_2008_18_29_34_+1000_aDsfyU7zQSKZJBT4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Fri, 15 Aug 2008 09:56:14 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> hm, it's present in my tree and has been there for a long time:
>=20
> | commit 0d84b78a606f1562532cd576ee8733caf5a4aed3
> | Author: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
> | Date:   Mon May 12 21:21:07 2008 +0200
> |
> |    x86 NMI-safe INT3 and Page Fault
>=20
> what happened is that i restructured the integration branches yesterday=20
> and moved the tracing/nmisafe from auto-ftrace-next to auto-latest -=20
> without realizing the dependency. I fixed that now and pushed out the=20
> updated auto-ftrace-next branch.

OK, thanks.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__15_Aug_2008_18_29_34_+1000_aDsfyU7zQSKZJBT4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkilPm4ACgkQjjKRsyhoI8x8XACgsRl+8SqabQEAoslKkFnBg/AZ
L2EAn1fL8bRSKjffIow8a0Zy/l+4mJGp
=Le9s
-----END PGP SIGNATURE-----

--Signature=_Fri__15_Aug_2008_18_29_34_+1000_aDsfyU7zQSKZJBT4--
