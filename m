From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: driver-core tree build failure
Date: Mon, 29 Dec 2008 17:34:44 +1100
Message-ID: <20081229173444.f6309a51.sfr@canb.auug.org.au>
References: <20081222235936.5971ad15.sfr@canb.auug.org.au>
	<1229957446.19474.19.camel@localhost.localdomain>
	<20081223042932.GD1928@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__29_Dec_2008_17_34_44_+1100_sSlxEfnSSYE5ZWhn"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42169 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752300AbYL2Gev (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 01:34:51 -0500
In-Reply-To: <20081223042932.GD1928@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Mark McLoughlin <markmc@redhat.com>, linux-next@vger.kernel.org

--Signature=_Mon__29_Dec_2008_17_34_44_+1100_sSlxEfnSSYE5ZWhn
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, 22 Dec 2008 20:29:32 -0800 Greg KH <greg@kroah.com> wrote:
>
> On Mon, Dec 22, 2008 at 02:50:46PM +0000, Mark McLoughlin wrote:
> > On Mon, 2008-12-22 at 23:59 +1100, Stephen Rothwell wrote:
> > > Hi Greg,
> > >=20
> > > Today's linux-next build (powerpc allnoconfig) failed like this:
> > >=20
> > > drivers/base/core.c: In function '__root_device_register':
> > > drivers/base/core.c:1277: error: dereferencing pointer to incomplete =
type
> > >=20
> > > Caused by bf86dbd2451d1012c2c968a960470e485b869f5b ("driver core: add
> > > root_device_register()").  This needs to cope with !CONFIG_MODULES (w=
here
> > > struct module is not defined).
> >=20
> > Ouch, my bad.
> >=20
> > > I applied the following patch but only for today because it is too ha=
rd
> > > to revert the above patch ...
> > >=20
> > > --=20
> > > Cheers,
> > > Stephen Rothwell                    sfr@canb.auug.org.au
> > > http://www.canb.auug.org.au/~sfr/
> > >=20
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Mon, 22 Dec 2008 23:50:56 +1100
> > > Subject: [PATCH] driver core: fix root_device_register for not CONFIG=
_MODULES
> > >=20
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > ---
> > >  drivers/base/core.c |    2 ++
> > >  1 files changed, 2 insertions(+), 0 deletions(-)
> > >=20
> > > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > > index 6fbdd8b..aa93980 100644
> > > --- a/drivers/base/core.c
> > > +++ b/drivers/base/core.c
> > > @@ -1273,6 +1273,7 @@ struct device *__root_device_register(const cha=
r *name, struct module *owner)
> > >  		return ERR_PTR(err);
> > >  	}
> > > =20
> > > +#ifdef CONFIG_MODULE
> > >  	if (owner) {
> > >  		struct module_kobject *mk =3D &owner->mkobj;
> > > =20
> > > @@ -1283,6 +1284,7 @@ struct device *__root_device_register(const cha=
r *name, struct module *owner)
> > >  		}
> > >  		root->owner =3D owner;
> > >  	}
> > > +#endif
> >=20
> > Yep, looks correct to me ...
>=20
> Ick, I hate ifdefs...  I'll go fix this up.

Its still there today.  Lucky for you I didn't notice early enough to
drop the driver-core tree :-).  I will reapply my patch.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__29_Dec_2008_17_34_44_+1100_sSlxEfnSSYE5ZWhn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklYb4QACgkQjjKRsyhoI8ytlwCfdR7UVP00aaWqsWeOEkQC9Z2k
MYQAoJttvu9evcsZ9jzX3l8Pj371xVZA
=sp79
-----END PGP SIGNATURE-----

--Signature=_Mon__29_Dec_2008_17_34_44_+1100_sSlxEfnSSYE5ZWhn--
