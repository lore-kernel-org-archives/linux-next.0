From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: arm/mer-current merge conflict
Date: Fri, 6 Jun 2008 21:19:32 +1000
Message-ID: <20080606211932.9d0319e9.sfr@canb.auug.org.au>
References: <20080603140421.183cefe5.sfr@canb.auug.org.au>
	<20080606101012.GA18231@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__6_Jun_2008_21_19_32_+1000_DDASHbZnAlJeC3hQ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37430 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752639AbYFFLTj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Jun 2008 07:19:39 -0400
In-Reply-To: <20080606101012.GA18231@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, Dmitry Baryshkov <dbaryshkov@gmail.com>

--Signature=_Fri__6_Jun_2008_21_19_32_+1000_DDASHbZnAlJeC3hQ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Fri, 6 Jun 2008 11:10:12 +0100 Russell King <rmk@arm.linux.org.uk> wrote:
>
> Yes, I'm aware of there being two fixes in my tree for that.  One is
> the fix suitable for -rc kernels, the other is the proper fix, which
> has a higher impact.

Which is fair enough.

> The merge conflict will be resolved probably around merge window time -
> I hope this doesn't cause you too much of a problem?

Once I have the correct resolution, "git rerere" remembers and reapplies
it for me automatically, so its not much of a problem.

Now that the -rc fix has gone into Linus' tree, I assume you will
rebase/merge with his tree at some point at which time the conflict will
vanish for me.  No hurry.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__6_Jun_2008_21_19_32_+1000_DDASHbZnAlJeC3hQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhJHUQACgkQTgG2atn1QN/hnACfWi5xd+/zQTQ/z34WLWAbFWku
fzsAn2X2CWijuS+iNOYNBjeCOBdUad++
=xugT
-----END PGP SIGNATURE-----

--Signature=_Fri__6_Jun_2008_21_19_32_+1000_DDASHbZnAlJeC3hQ--
