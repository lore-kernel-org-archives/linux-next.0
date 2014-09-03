From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: New platform-drivers-x86 tree
Date: Wed, 3 Sep 2014 20:18:07 +0100
Message-ID: <20140903191807.GE29327@sirena.org.uk>
References: <20140903052120.GA39165@vmdeb7>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dds9jO4idXToq0wP"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:48701 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753305AbaICTS3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Sep 2014 15:18:29 -0400
Content-Disposition: inline
In-Reply-To: <20140903052120.GA39165@vmdeb7>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org


--dds9jO4idXToq0wP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 02, 2014 at 10:21:20PM -0700, Darren Hart wrote:
> Hi Stephen,
>=20
> I searched the documentation (development-process/*) but found the linux-=
next
> wiki to be down (for a while now it seems). Apologies if I'm missing some=
thing
> documented there.

This is pretty much the process.  Stephen's on holiday this week, I've
updated the configuration for the trees I'm building this week but you
might want to check that this gets carried over when he's back on
Monday.

> I have subscribed to the linux-next mailing list. Is there more I need to=
 be
> doing? Do I need to send you pull requests, or do you pull a list of bran=
ches
> automatically?

It's all done automatically - for-next will be fetched for each -next
build.  Stephen's form letter for this can be found in the archives, the
main rule is that you should only be putting code there intended to go
in during the merge window.

--dds9jO4idXToq0wP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUB2lsAAoJELSic+t+oim9gssQAJzGK6nQgOmuf/7BpHD1aZPy
CaDTibTA8YD3T3q3ZFgv6dLNKg+ODc+twXojmZLd+sEsZ9puVCZKN1yFn5hGLvnj
8sDmuXdvd6Gm/5xyBWCIJvq+iJ/Zn5WHAoYAAXk+BRESX2SrK/49bi07cUV7hnOi
xadAdLNQ79JYAC6hQY4W7HSgqmGXcL6NhrfXS1F1/D+GR41EaeTme07gIstne2xX
R5B4xQd0pd8Yh+hyYfqMq4X0kc8YfqkXBDivxMfuMCMcWM2wSz6DBB+pfkHHFLy0
W62fJi5oVdaBu+6I4F0waCmPCYJ4SFHyR25yHlO6m+4ZHO2Mr4Ky10IbwZ3Q2DPH
IPJOnFLAv1SP++aF867ojJc5RIMuamdHVr2SdmDnKUtpclz/Ux18rIAXmTgl9nTi
LSLxvEQJ7hKp8FFmTIMc1NA9tiMyPnB8OiQ88dNYmjehC9zRAb30183LQKJ/PE8g
PM/UhFTo0+GQPX1K0Me8mv2zV9ko/Ug2UBb73lEfB//l42/G6stHEUpBsct7UVYp
68jbG9rbzQdi5NsI8RQxpdqQlipXS86bRdC5zA4ERtToy73hhCi0AmgAAJY9Fbm5
HNRgEib0zU2vfs8reFF9KLPy9bAaDP2zT3EaKWJD9m2QHk2kGsXEBH6daBlpnh0t
V3mY5QF2el1/q14FQFaD
=zk3t
-----END PGP SIGNATURE-----

--dds9jO4idXToq0wP--
