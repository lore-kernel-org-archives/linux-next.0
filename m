From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: origin tree build warning
Date: Fri, 1 Jan 2010 12:02:28 +1100
Message-ID: <20100101120228.04a21224.sfr@canb.auug.org.au>
References: <20100101112914.41bc5f77.sfr@canb.auug.org.au>
	<alpine.LFD.2.00.0912311634110.3630@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__1_Jan_2010_12_02_28_+1100_2hUlPYhqA0syZYQ."
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41954 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751284Ab0AABCe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Dec 2009 20:02:34 -0500
In-Reply-To: <alpine.LFD.2.00.0912311634110.3630@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>

--Signature=_Fri__1_Jan_2010_12_02_28_+1100_2hUlPYhqA0syZYQ.
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Thu, 31 Dec 2009 16:34:37 -0800 (PST) Linus Torvalds <torvalds@linux-fou=
ndation.org> wrote:
> On Fri, 1 Jan 2010, Stephen Rothwell wrote:
> >
> > Today's linux-next build (powerpc allnoconfig) produced this warning:
>
> Does this trivial patch get rid of it?

Yep.

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>

I did actually get this warning for all sorts of configs/architectures,
obviously, I just reported it against the first that popped up.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__1_Jan_2010_12_02_28_+1100_2hUlPYhqA0syZYQ.
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAks9SaQACgkQjjKRsyhoI8yV+QCeLJ6qIAd9T68DCmXC6w4usoxs
L8MAn0KMnmv9lVzJJuaiA5xWNfNtYXLV
=0o6O
-----END PGP SIGNATURE-----

--Signature=_Fri__1_Jan_2010_12_02_28_+1100_2hUlPYhqA0syZYQ.--
