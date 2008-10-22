From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linuxt-next: nfsd strange commit
Date: Thu, 23 Oct 2008 09:30:04 +1100
Message-ID: <20081023093004.b061d357.sfr@canb.auug.org.au>
References: <20081021141357.ab15406f.sfr@canb.auug.org.au>
	<20081021132059.GA8029@fieldses.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__23_Oct_2008_09_30_04_+1100_yDdDU9AJbwQEN5Hc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37566 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753783AbYJVWaO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Oct 2008 18:30:14 -0400
In-Reply-To: <20081021132059.GA8029@fieldses.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Thu__23_Oct_2008_09_30_04_+1100_yDdDU9AJbwQEN5Hc
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

On Tue, 21 Oct 2008 09:20:59 -0400 "J. Bruce Fields" <bfields@fieldses.org>=
 wrote:
>
> I've also been acting as a (somewhat inconsistent) locks.c maintainer.
>=20
> Would it make it any easier if I kept a locks-next branch that you could
> pull separately?  Or should I try to get that stuff into some other
> tree?

A separate branch is possible, but if it is only one or two commits it is
hardly worth it.  Lets see how it goes.

However (I don't mean to pick on you, really :-)) your current tree has a
merge that says "Merge branch 'for-2.6.29' into for-mm".  I (and Andrew)
really don't want any 2.6.29 stuff in linux-next until after 2.6.28-rc1 -
it just muddies the conflicts.  So can you remove that merge for now (its
only a few days) and I will revert that merge in linux-next today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__23_Oct_2008_09_30_04_+1100_yDdDU9AJbwQEN5Hc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj/qWwACgkQjjKRsyhoI8yKNwCgr/uo+32fSOjvfFoBWDJAtTBX
xu0An1dk5HroJJ6DWqnHc2jYd7y5/97F
=7IkY
-----END PGP SIGNATURE-----

--Signature=_Thu__23_Oct_2008_09_30_04_+1100_yDdDU9AJbwQEN5Hc--
