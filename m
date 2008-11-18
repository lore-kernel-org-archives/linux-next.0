From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: procedures
Date: Wed, 19 Nov 2008 07:24:55 +1100
Message-ID: <20081119072455.e341b8e3.sfr@canb.auug.org.au>
References: <20081112173807.05cfadf0.sfr@canb.auug.org.au>
	<20081118084757.5c92c878.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__19_Nov_2008_07_24_55_+1100_1eoMh+txK0YCl76_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45828 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752506AbYKRUZH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 18 Nov 2008 15:25:07 -0500
In-Reply-To: <20081118084757.5c92c878.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>

--Signature=_Wed__19_Nov_2008_07_24_55_+1100_1eoMh+txK0YCl76_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Tue, 18 Nov 2008 08:47:57 -0800 Randy Dunlap <randy.dunlap@oracle.com> w=
rote:
>
> > The following will cause a tree to be temporarily dropped from linux-ne=
xt:
> > 	- non-trivial conflicts with Linus' tree
> > 	- build failures
>=20
> One clarification, please.
>=20
> Does this mean build failures that _you_ see/experience during tree mergi=
ng
> and not other reported build failures?

Build failures I see during merging will cause the tree to be dropped
immediately (this forces me to not spend time trying to fix others
problems), other build failures may take a day or two before the
offending tree gets identified and dropped (but hopefully it will be
fixed before that happens).

A tree being dropped during merging does not imply fault - it may well be
a combination of trees that is the problem and I am always open to people
explaining things to me.  As long as we come up with a solution that I
can carry along.  However, most of the build failures I have seen so far
have been unexpected impact on other architectures/configs (than those
tested by the author), procedures gone wrong or carelessness ...

Trees do get picked up again at the next opportunity i.e. I still
fetch, inspect and attempt to merge "dropped" trees just in case people
don't get around to telling me they are fixed.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__19_Nov_2008_07_24_55_+1100_1eoMh+txK0YCl76_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkjJJcACgkQjjKRsyhoI8yT6wCeIdYRNDEoTftqK8XIxgv4rU5Y
nloAn00D9fNrMdtNEj0zGiwndgQMxWnr
=ABYq
-----END PGP SIGNATURE-----

--Signature=_Wed__19_Nov_2008_07_24_55_+1100_1eoMh+txK0YCl76_--
