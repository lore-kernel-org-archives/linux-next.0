From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: ftrace tree build failure
Date: Mon, 25 Aug 2008 16:31:02 +1000
Message-ID: <20080825163102.f32cdc73.sfr@canb.auug.org.au>
References: <20080825130844.4d3a4399.sfr@canb.auug.org.au>
	<20080825060529.GA14993@elte.hu>
	<20080825061101.GA22790@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__25_Aug_2008_16_31_02_+1000_s6qZaghtLvtryY_h"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46488 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751395AbYHYGbN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 02:31:13 -0400
In-Reply-To: <20080825061101.GA22790@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>

--Signature=_Mon__25_Aug_2008_16_31_02_+1000_s6qZaghtLvtryY_h
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Mon, 25 Aug 2008 08:11:01 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> * Ingo Molnar <mingo@elte.hu> wrote:
>=20
> > > kernel/trace/ftrace.c:416: error: incompatible type for argument 1 of=
 '_spin_lock_irqsave'
> > > kernel/trace/ftrace.c:433: error: incompatible type for argument 1 of=
 '_spin_lock_irqsave'
> > >=20
> > > (This is after I have disabled CONFIG_FTRACE_MCOUNT_RECORD)
> >=20
> > hm, how have you disabled it? It's not an interactive option and it's=20
> > always enabled when CONFIG_DYNAMIC_FTRACE is enabled. (that's how that=
=20
> > build failure never got discovered)
>=20
> ah, i see the other thread now, about binutils version dependency. I've=20
> applied your fix as per the commit below.

I knew you would work it out :-)

Looks good, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__25_Aug_2008_16_31_02_+1000_s6qZaghtLvtryY_h
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiyUaYACgkQjjKRsyhoI8xhAgCfWXIQMrtBwSuJj9IdCxVH3X5/
ZDMAn00AwQk6YQ/EA8Gbb3WCNBTPXv7F
=ottt
-----END PGP SIGNATURE-----

--Signature=_Mon__25_Aug_2008_16_31_02_+1000_s6qZaghtLvtryY_h--
