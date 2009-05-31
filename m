From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: kmemcheck tree
Date: Sun, 31 May 2009 15:19:24 +1000
Message-ID: <20090531151924.e5b02b93.sfr@canb.auug.org.au>
References: <19f34abd0905300902g3e962867sa4fc9dbc40f4c2a2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sun__31_May_2009_15_19_24_+1000_/+0hOsX4nWa4XtYG"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54673 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751594AbZEaFTb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 31 May 2009 01:19:31 -0400
In-Reply-To: <19f34abd0905300902g3e962867sa4fc9dbc40f4c2a2@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: Ingo Molnar <mingo@elte.hu>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-next@vger.kernel.org

--Signature=_Sun__31_May_2009_15_19_24_+1000_/+0hOsX4nWa4XtYG
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Vegard,

On Sat, 30 May 2009 18:02:57 +0200 Vegard Nossum <vegard.nossum@gmail.com> =
wrote:
>
> It seems that we have fixed those syntax errors in the kmemcheck tree
> now, could you please add kmemcheck back into the mix?

Sure.  Do you want me to use the kmemcheck branch or the
auto-kmemcheck-next branch (which hasn't been updated yet)?  No desperate
hurry, I won't be building a linux-next tree until tomorrow morning
(about 18 hours from now).

> (I am not sure if perhaps it would be better to wait until the 2.6.30
> comes out, as I don't think we'll make it for that one, and it would
> only complicate things unnecessarily? Well, it's up to you :-))

If you intend for this stuff to be merged in 2.6.31, then it needs to get
back into linux-next as soon as possible.  A test merge (of the kmemcheck
branch) into Friday's linux-next showed several conflicts (hopefully mostly
simple) - I will report on these tomorrow.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sun__31_May_2009_15_19_24_+1000_/+0hOsX4nWa4XtYG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoiE1wACgkQjjKRsyhoI8zE1QCfQ8QbXqxQx8qoVp9Dwfhi/atY
JSsAnjTDnkxabz7htqa6/3ZrB3gBCyQP
=dIaA
-----END PGP SIGNATURE-----

--Signature=_Sun__31_May_2009_15_19_24_+1000_/+0hOsX4nWa4XtYG--
