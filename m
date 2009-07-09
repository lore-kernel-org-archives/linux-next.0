From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Merge request for the Thumb-2 branch
Date: Thu, 9 Jul 2009 19:30:24 +1000
Message-ID: <20090709193024.7025bf44.sfr@canb.auug.org.au>
References: <1246035591.30717.54.camel@pc1117.cambridge.arm.com>
	<1247067269.6595.44.camel@pc1117.cambridge.arm.com>
	<20090709100626.1e40912d.sfr@canb.auug.org.au>
	<1247129875.11409.8.camel@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__9_Jul_2009_19_30_24_+1000_9nlPpoQYhJD0Hv/W"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33299 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754661AbZGIJaa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Jul 2009 05:30:30 -0400
In-Reply-To: <1247129875.11409.8.camel@pc1117.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-next <linux-next@vger.kernel.org>

--Signature=_Thu__9_Jul_2009_19_30_24_+1000_9nlPpoQYhJD0Hv/W
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Catalin,

On Thu, 09 Jul 2009 09:57:55 +0100 Catalin Marinas <catalin.marinas@arm.com=
> wrote:
>
> That's not a new ARM platform, it is affecting the core

My mistake (I must learn to read sometime :-))

> arch/arm/kernel/, arch/arm/mm/ etc. files so that they can be compiled
> to an alternative instruction set (mostly 16-bit instructions). So it
> should eventually be merged via Russell's tree (or get his ack and push
> directly)
>=20
> My intention is indeed to merge this in the upcoming window (unless
> Russell has any more comments to the code).

OK, then it will stay in linux-next unless Russell desires otherwise.   I
can even cope if he decides to merges it into his tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__9_Jul_2009_19_30_24_+1000_9nlPpoQYhJD0Hv/W
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpVuLAACgkQjjKRsyhoI8yQngCgsk68lx0fHDkv5RWKwmKrQiPl
xuAAnj69JaCsHUGg9Z2Rhhjh+FLMkYiq
=YP1x
-----END PGP SIGNATURE-----

--Signature=_Thu__9_Jul_2009_19_30_24_+1000_9nlPpoQYhJD0Hv/W--
