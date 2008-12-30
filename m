From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: driver-core tree build failure
Date: Wed, 31 Dec 2008 02:28:03 +1100
Message-ID: <20081231022803.49de507e.sfr@canb.auug.org.au>
References: <20081222235936.5971ad15.sfr@canb.auug.org.au>
	<1229957446.19474.19.camel@localhost.localdomain>
	<20081223042932.GD1928@kroah.com>
	<20081229173444.f6309a51.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__31_Dec_2008_02_28_03_+1100_SbQ9pM93QGBy+JYJ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41531 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750722AbYL3P2M (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 30 Dec 2008 10:28:12 -0500
In-Reply-To: <20081229173444.f6309a51.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Mark McLoughlin <markmc@redhat.com>, linux-next@vger.kernel.org

--Signature=_Wed__31_Dec_2008_02_28_03_+1100_SbQ9pM93QGBy+JYJ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, 29 Dec 2008 17:34:44 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 22 Dec 2008 20:29:32 -0800 Greg KH <greg@kroah.com> wrote:
> >
> > On Mon, Dec 22, 2008 at 02:50:46PM +0000, Mark McLoughlin wrote:
> > > On Mon, 2008-12-22 at 23:59 +1100, Stephen Rothwell wrote:
> > > > Hi Greg,
> > > >=20
> > > > Today's linux-next build (powerpc allnoconfig) failed like this:
> > > >=20
> > > > drivers/base/core.c: In function '__root_device_register':
> > > > drivers/base/core.c:1277: error: dereferencing pointer to incomplet=
e type
> > > >=20
> > > > Caused by bf86dbd2451d1012c2c968a960470e485b869f5b ("driver core: a=
dd
> > > > root_device_register()").  This needs to cope with !CONFIG_MODULES =
(where
> > > > struct module is not defined).
> > >=20
> > > Ouch, my bad.
> > >=20
> > > > I applied the following patch but only for today because it is too =
hard
> > > > to revert the above patch ...
> > > >=20
> >=20
> > Ick, I hate ifdefs...  I'll go fix this up.
>=20
> Its still there today.  Lucky for you I didn't notice early enough to
> drop the driver-core tree :-).  I will reapply my patch.

Today I dropped the driver-core tree (and the usb and staging trees that
depend on it).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__31_Dec_2008_02_28_03_+1100_SbQ9pM93QGBy+JYJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklaPgMACgkQjjKRsyhoI8zZ+QCgrci1kTH770nPNC+5ge+uiZ+4
L/gAn0SGzpmqN6Exl9KddSYfRfsQYN5O
=vgmM
-----END PGP SIGNATURE-----

--Signature=_Wed__31_Dec_2008_02_28_03_+1100_SbQ9pM93QGBy+JYJ--
