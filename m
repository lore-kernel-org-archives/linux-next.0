From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: How to debug linux-next? (was: Re: xorg problems with
 v2.6.27-rc1-2457-gdcb80fd)
Date: Thu, 31 Jul 2008 23:35:58 +1000
Message-ID: <20080731233558.ba613f33.sfr@canb.auug.org.au>
References: <20080731125630.GB4201@denkbrett.schottelius.org>
	<20080731132344.GC4201@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__31_Jul_2008_23_35_58_+1000_pEzO4yK+MZSo4JF5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40338 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751577AbYGaNgH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Jul 2008 09:36:07 -0400
In-Reply-To: <20080731132344.GC4201@denkbrett.schottelius.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__31_Jul_2008_23_35_58_+1000_pEzO4yK+MZSo4JF5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 31 Jul 2008 15:23:44 +0200 Nico -telmich- Schottelius <nico-linux-n=
ext@schottelius.org> wrote:
>
> Some questions about using and debugging linux-next:
>=20
> - Where to report errors? to this ml? cc-ing the related subsystem
>   maintainer(s)?

Yes.

> - What's the normal way of finding out the source for a problem, if you k=
now
>   a good commit (9bead9ae16728973cd31d9fd60c496e0e2fabbd1) and a
>   bad commit (dcb80fdb8cffd3fa06cd322b3e8227632ec23597)?

It is much easier to use "git bisect" within a single linux-next release
than between releases.  The latter should work some of the time but is
complicated by the fact that linux-next is effectively rebased every
day.  So it is sensible to see if the "stable" branch of linux-next works
(as that is just Linus' tree) and use that as a "good" starting point if
so.  If that doesn't work, then the problem is in Linus' tree already.

> - As far as I can see, you are doing rebase on linux-next. Why don't you
>   continue to do git-merge?

Because some of the trees that are merged into linux-next are rebased
fairly often as well.

> - And would a non-rebased tree not make life much easier for debugging
>   purposes?

I don't know.  What it would do is produce a lot more merge conflicts as
patches are moved around, changed, removed etc on a daily basis.

> My motivation is to find out the reason why xorg crashes now together
> with the xorg guys. But currently it seems to be impossible for me to
> detect which commits have been between to snapshots of the master
> branch of linux-next.

Yeah, that is a pain.  Does Linus' tree work?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__31_Jul_2008_23_35_58_+1000_pEzO4yK+MZSo4JF5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiRv74ACgkQjjKRsyhoI8wo8ACeJtJRXhtpeLfk9D2UEg5Kz0CO
nz8AnRXs3kdf5UEsZoXldJQ3AlKsSjct
=2q7k
-----END PGP SIGNATURE-----

--Signature=_Thu__31_Jul_2008_23_35_58_+1000_pEzO4yK+MZSo4JF5--
