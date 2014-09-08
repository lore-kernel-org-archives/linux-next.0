From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: New platform-drivers-x86 tree
Date: Mon, 8 Sep 2014 10:46:57 +1000
Message-ID: <20140908104657.0743df3a@canb.auug.org.au>
References: <20140903052120.GA39165@vmdeb7>
	<20140903191807.GE29327@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/i84YPwHWiQndb9tH+OxoCqW"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50000 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750911AbaIHArG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 7 Sep 2014 20:47:06 -0400
In-Reply-To: <20140903191807.GE29327@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org

--Sig_/i84YPwHWiQndb9tH+OxoCqW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Darren,

On Wed, 3 Sep 2014 20:18:07 +0100 Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Sep 02, 2014 at 10:21:20PM -0700, Darren Hart wrote:
> >=20
> > I searched the documentation (development-process/*) but found the linu=
x-next
> > wiki to be down (for a while now it seems). Apologies if I'm missing so=
mething
> > documented there.
>=20
> This is pretty much the process.  Stephen's on holiday this week, I've
> updated the configuration for the trees I'm building this week but you
> might want to check that this gets carried over when he's back on
> Monday.

I have updated my config files as well.

> > I have subscribed to the linux-next mailing list. Is there more I need =
to be
> > doing? Do I need to send you pull requests, or do you pull a list of br=
anches
> > automatically?
>=20
> It's all done automatically - for-next will be fetched for each -next
> build.  Stephen's form letter for this can be found in the archives, the
> main rule is that you should only be putting code there intended to go
> in during the merge window.

What Mark said :-)

The only other thing is the following legalese:

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/i84YPwHWiQndb9tH+OxoCqW
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUDPyFAAoJEMDTa8Ir7ZwVLV4QAIfpz7o9bvgTMUnivL59bvJC
SrgPh9zAJn4ha4RKpjYdMNM63wJnW/J2DXHW8gcVVXVkyh+4/8uD3D+OoBObi9U4
8jaIreeLFMl7sVPUL0FZZhm5FaDq/r2Fd24fxAPWMStHheDG2b6km+6N85iJEIFY
doy27R3gXN2LeL0KelQojrQgTch2Vs6YZ/BIPcncAAo3rzd4Cq/BlMHOIjPzIqHk
1UEboZFtMDb0LFMyZvkwRHeh7x5ZSlnNm+GObUtPQUgItuqrFcB2t6OwBukNXrY/
Sx9oopBKHo+zWaf/Ndp8IPsc2XdI+wln3yL0bfG1pAxSHWaFtWPTEScyecMcJQSc
LvIUNLaeVkhVxuOzUpao0UhjSo/dPlsU2xOc6P8mZi+FKdIKWk01+wB6CEIkZU5i
USzYPpuhRjg01D1BO6btmqWCRac1GU9zYg4k24SurPwjGoYNdMfo5nbSHlr+F2V4
j4pvvjIYKQbjP0VbH9ywdp0jJ7sIulX5ETSsG6koa8n6onASKbs+QVEDrkuhmena
9W2tKErEr2wATxR6GTyK8xm65IEfdM2d+PZBEwINEPQnXfV/eGiO7SeTMsL0H3/3
vVAqNgnMbfHvdonxfY9a9EY/Xt7byL/YlC/cvFYFK4TTZJGq41uLy21cUmo4NqTf
0zCHwZZ8Hftf4zQffq4u
=Bj54
-----END PGP SIGNATURE-----

--Sig_/i84YPwHWiQndb9tH+OxoCqW--
