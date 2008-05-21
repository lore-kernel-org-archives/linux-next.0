From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: driver-core/pci merge failure
Date: Wed, 21 May 2008 10:25:35 +1000
Message-ID: <20080521102535.a2c6cd1c.sfr@canb.auug.org.au>
References: <20080519120328.40aa6d5d.sfr@canb.auug.org.au>
	<200805201408.44509.jbarnes@virtuousgeek.org>
	<20080520233113.GA5053@kroah.com>
	<200805201653.04543.jbarnes@virtuousgeek.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__21_May_2008_10_25_35_+1000_PxG3qJPq.kPGJv4="
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36851 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754989AbYEUAZn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 20 May 2008 20:25:43 -0400
In-Reply-To: <200805201653.04543.jbarnes@virtuousgeek.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: Greg KH <greg@kroah.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-next@vger.kernel.org

--Signature=_Wed__21_May_2008_10_25_35_+1000_PxG3qJPq.kPGJv4=
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 20 May 2008 16:53:04 -0700 Jesse Barnes <jbarnes@virtuousgeek.org> =
wrote:
>
> On Tuesday, May 20, 2008 4:31 pm Greg KH wrote:
>=20
> > Rafael, I'll be dropping the following patches from my tree:
> > 	driver-core/pm-introduce-new-top-level-suspend-and-hibernation-callbac=
ks.p
> >atch
> > driver-core/pm-new-suspend-and-hibernation-callbacks-for-platform-bus-t=
ype.
> >patch
> > driver-core/pm-new-suspend-and-hibernation-callbacks-for-pci-bus-type.p=
atch
> >
> > I'm guessing you want Jesse to also pick up the platform-bus one as
> > well, so that does not get lost.
> >
> > Is that ok?
>=20
> Sounds good, thanks Greg.

OK, so since Jesse put those three patches into the pci tree, I will
revert them from driver-core before I merge it into linux-next today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__21_May_2008_10_25_35_+1000_PxG3qJPq.kPGJv4=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIM2wDTgG2atn1QN8RAmtGAJ9o18V/thus79wrRLgtwECZe7BUFACgju/H
XVJ0GS92+5zyHROYcbxdBcE=
=SgFk
-----END PGP SIGNATURE-----

--Signature=_Wed__21_May_2008_10_25_35_+1000_PxG3qJPq.kPGJv4=--
