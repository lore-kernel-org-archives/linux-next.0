From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the slab tree with the ftrace tree
Date: Sat, 21 Feb 2009 10:07:31 +1100
Message-ID: <20090221100731.c2af97b0.sfr@canb.auug.org.au>
References: <20090220165728.7f2cec61.sfr@canb.auug.org.au>
	<20090220195911.3bff30fb.sfr@canb.auug.org.au>
	<20090220093734.GI24555@elte.hu>
	<1235122897.29813.28.camel@penberg-laptop>
	<20090220095355.GL24555@elte.hu>
	<1235128361.29813.32.camel@penberg-laptop>
	<20090220111651.GJ28581@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__21_Feb_2009_10_07_31_+1100_1yCCP7KnwMI0VP0S"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36975 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754899AbZBTXHi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Feb 2009 18:07:38 -0500
In-Reply-To: <20090220111651.GJ28581@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Sat__21_Feb_2009_10_07_31_+1100_1yCCP7KnwMI0VP0S
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Feb 2009 12:16:51 +0100 Ingo Molnar <mingo@elte.hu> wrote:
>
> > Aye, aye, cap'n:
> >=20
> >   git pull git://git.kernel.org/pub/scm/linux/kernel/git/penberg/slab-2=
.6.git for-ingo
> >=20
> > the commit is here in case someone wants to take a look at it:
> >=20
> > http://git.kernel.org/?p=3Dlinux/kernel/git/penberg/slab-2.6.git;a=3Dco=
mmitdiff;h=3Dfe1200b63d158b28eef6d4de1e5b5f99c681ba2f
>=20
> Pulled into tip:tracing/kmemtrace, thanks Pekka!
>=20
> Below is the conflict resolution i did. Will push out a new=20
> tip:auto-ftrace-next tree once it got a bit of testing.

[I should read more of my mail before replying]

Thanks all - every little bit make my life easier.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__21_Feb_2009_10_07_31_+1100_1yCCP7KnwMI0VP0S
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmfN7MACgkQjjKRsyhoI8w62QCgm7LhGtSFgtQFg2Bepi2TEXm1
8pwAoKmmxD0e9dVfJfR3E3t3Y/VFYkgP
=6jam
-----END PGP SIGNATURE-----

--Signature=_Sat__21_Feb_2009_10_07_31_+1100_1yCCP7KnwMI0VP0S--
