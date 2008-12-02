From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: v4l-dvb tree build failure
Date: Wed, 3 Dec 2008 09:23:54 +1100
Message-ID: <20081203092354.b3727f05.sfr@canb.auug.org.au>
References: <20081202103741.9b234e49.sfr@canb.auug.org.au>
	<20081202080302.2f1180e8@pedra.chehab.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__3_Dec_2008_09_23_54_+1100_PFk4FelE4CbeHZrU"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59584 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752376AbYLBWYG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Dec 2008 17:24:06 -0500
In-Reply-To: <20081202080302.2f1180e8@pedra.chehab.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__3_Dec_2008_09_23_54_+1100_PFk4FelE4CbeHZrU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

On Tue, 2 Dec 2008 08:03:02 -0200 Mauro Carvalho Chehab <mchehab@infradead.=
org> wrote:
>
> I suspect you've pulled from my tree while I was testing it, or before my=
 last
> update yesterday night. Anyway, I've re-merged my patches at my linux-nex=
t and
> tested. Everything seems to be ok now.

You should do things in this order:
	write, and test your own patches
	gather patches form other people
	make sure all the patches have been posted on some appropriate
		mailing list for review
	put all the patches in a private tree
	test
	publish the tree for linux-next (and others)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__3_Dec_2008_09_23_54_+1100_PFk4FelE4CbeHZrU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk1tXoACgkQjjKRsyhoI8wL3QCcDaS6HvqQ6PGfq/LcC2WWbfrL
we4AoJ5fWP4W/bvWEMCG/fg9zDAILYm3
=MFaU
-----END PGP SIGNATURE-----

--Signature=_Wed__3_Dec_2008_09_23_54_+1100_PFk4FelE4CbeHZrU--
