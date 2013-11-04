From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: linux-next fixes
Date: Mon, 4 Nov 2013 09:38:28 +0100
Message-ID: <20131104083827.GB27445@ulmo.nvidia.com>
References: <20131101093638.GE27864@ulmo.nvidia.com>
 <5273C445.7060900@infradead.org>
 <CAOesGMivU0rz+HgA7HjJ4trdJ5QMu2mbHSpLJQ0PvGOtQR6iNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E39vaYmALEf/7YXx"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f44.google.com ([209.85.214.44]:61894 "EHLO
	mail-bk0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751984Ab3KDIib (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Nov 2013 03:38:31 -0500
Received: by mail-bk0-f44.google.com with SMTP id mx11so197428bkb.31
        for <linux-next@vger.kernel.org>; Mon, 04 Nov 2013 00:38:30 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAOesGMivU0rz+HgA7HjJ4trdJ5QMu2mbHSpLJQ0PvGOtQR6iNQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>


--E39vaYmALEf/7YXx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 01, 2013 at 09:15:12AM -0700, Olof Johansson wrote:
> On Nov 1, 2013 8:10 AM, "Randy Dunlap" <rdunlap@infradead.org> wrote:
> >
> > On 11/01/13 02:36, Thierry Reding wrote:
> > > Hi Stephen,
> > >
> > > There have been some discussions lately revolving around the topic of
> > > linux-next fixes. That is, commits that people come up with over the
> > > course of a day to fix issues found in the latest linux-next trees.
> > >
> > > It's a fact that many people rely on linux-next for everyday work, so
> > > whenever things break in linux-next a lot of people end up chasing the
> > > same bugs and posting the same patches (or not posting them for that
> > > matter).
> > >
> > > A lot of developer time is wasted that way, so I originally proposed
> > > that we could set up a separate linux-next-fixes tree where we collect
> > > patches of interest. I volunteer to do that, since, well, I'm doing it
> > > anyway as part of my daily routine. Timezone-wise it also fits pretty
> > > well, since I usually start my day sometime around when you publish
> > > linux-next.
> > >
> > > If we can establish a canonical location where such fixes are
> > > accumulated, people could fetch those at the same time they fetch the
> > > linux-next tree and automatically get fixes.
> >
> > Stephen has had a location for linux-next fixes for quite some time now=
 --
> > in the linux-next tree itself.
> >
> > Apparently Olof objected to this and you agreed with him.
> > and I object to not having the fixes in the linux-next tree.
> > Maybe Stephen can work it out.  :)
>=20
> My main concern was that they stacked up quickly for a while and had no
> patch descriptions in -next. It does make sense to carry some if these
> patches somewhere. Normally we haven't needed many though, and if we do
> then that's a pretty strong indication that people are adding code to the=
ir
> for-next that is not yet ready and that should be addressed.

Oh, it would certainly be desirable for such patches to be unnecessary,
but the reality is that this will happen every now and then. Sometimes
this will not even be detectable as build failures. A lot of patches
recently haven't broken the build but instead caused a random board
(that the commit author didn't have access to, or was just too lazy to
test) to no longer boot.

One of the purposes of linux-next is to get early and broad testing,
isn't it? So I don't expect code to be rock-stable when it hits -next.

Thierry

--E39vaYmALEf/7YXx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSd10DAAoJEN0jrNd/PrOhXZ0P/19ifhr1AlC387/dGNPo2ATt
bC+bx94FoJrr7VUHfjFks07GtPFwdwud00oAHqlHjmLqkyGSaQwxPR9NSnB9xkZM
j6mB00dMXS5kEcJlMTHV0e1MCQZfz1ywbqqvLO456/zo9ETF+QPkgZnfPZHQvCc8
REyWMdvecrSZQRiiAtqp31pawFcsb/eNTUadj1290HciVnHksrcevTUcVogs6sfW
XQjNxiZBR8RfwrZampzT9QgHZAzG0bj4j8qRsqzHpJuOZSpPZN82DvEzv+zeJVvi
d0IraIZrt2Oz6pTP9DupPt/iZA6JTRBuLvY5a510hANaNLIKghFhIpl1I1EvfazO
leN8yXyrNNugUQiKmyfl/wsu0zjBMV3RJlxGsdDLpMA8XNLc6ctbcv5ogzfm61Qn
vCI3hxR+fwLeQiksLAWFaeNNycisBi4sLNp67UKubyJPU+Dtd5nMDFFVP56UkY3M
F0+3YC62uRbZVXuZx6jkojbfvwgv/o1KA5n5PQwBqG8QPBRdeFldKNBTHqceKJpa
5UvM5V355ukqT1A+SJFVEDhayKMMj1N9nHKwstk7deJnp0fZ6nE/s5CrsfGje7EN
WcJJof+m0ycR/Y5SYvenupf52g99oNE1i7bDchJARhhedUC2t2EyIPKisEuU7pXg
lwGe8dwzjpo576VH2GdF
=uPWT
-----END PGP SIGNATURE-----

--E39vaYmALEf/7YXx--
