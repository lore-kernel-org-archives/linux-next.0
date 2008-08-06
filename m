From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: md tree not fetchable
Date: Wed, 6 Aug 2008 14:25:24 +1000
Message-ID: <20080806142524.73ce19ca.sfr@canb.auug.org.au>
References: <20080806131745.f5d377e6.sfr@canb.auug.org.au>
	<d6381929b46c13d0da2e7bccee566ac4.squirrel@neil.brown.name>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__6_Aug_2008_14_25_24_+1000_rJK+UNHFsY2WTMLB"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34952 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752833AbYHFEZd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 Aug 2008 00:25:33 -0400
In-Reply-To: <d6381929b46c13d0da2e7bccee566ac4.squirrel@neil.brown.name>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: NeilBrown <neilb@suse.de>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__6_Aug_2008_14_25_24_+1000_rJK+UNHFsY2WTMLB
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Neil,

On Wed, 6 Aug 2008 13:44:56 +1000 (EST) "NeilBrown" <neilb@suse.de> wrote:
>
> That's what you get for running "apt-get upgrade" and not testing things
> :-)
>=20
> Fixed now.

Thanks.

> BTW, there is only the one tree that you need to pull: "for-next".
> I think the other one (md-current??) was for-linus.  That will
> always be included in for-next so does not need to be pulled separately.

I like to fetch them separately because I merge the for-linus stuff early
and then if there is a severe problem with the for-next part, I only have
to drop that and I still get the benefit of any bug fixes in the
for-linus part.  Also, later in the cycle (rc7 or 8 or so) I stop doing
separate builds for the -current tree merges on the (hopefully accurate)
assumption that bugs fixes that Linus has been asked to take will not
cause any problems (and actually may solve some on Linus' tree).

That said, I do like the fact the the for-next part is always a superset
of the for-linus part.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__6_Aug_2008_14_25_24_+1000_rJK+UNHFsY2WTMLB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiZJ7QACgkQjjKRsyhoI8wbNgCfQijpz2B73Zg3suGfqdn7AgZ4
qQAAn2n1aEXr4UUoabp7uH917jjtE+Js
=ulCg
-----END PGP SIGNATURE-----

--Signature=_Wed__6_Aug_2008_14_25_24_+1000_rJK+UNHFsY2WTMLB--
