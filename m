From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: linux-next: Tree for June 25
Date: Fri, 27 Jun 2008 00:21:00 +1000
Message-ID: <20080627002100.396d5cbb.sfr@canb.auug.org.au>
References: <20080626003554.b2623aba.sfr@canb.auug.org.au>
	<200806260859.26270.rjw@sisk.pl>
	<alpine.LRH.1.10.0806261201420.10290@twin.jikos.cz>
	<200806261249.24340.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__27_Jun_2008_00_21_00_+1000_JU3MZ7Lk=IY9NVDI"
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200806261249.24340.rjw-KKrjLPT3xs0@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>
Cc: Jiri Kosina <jkosina-AlSwsSmVLrQ@public.gmane.org>, kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__27_Jun_2008_00_21_00_+1000_JU3MZ7Lk=IY9NVDI
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Jun 2008 12:49:23 +0200 "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org> wrote:
>
> > I guess this got in through Rusty's tree, right?
> >=20
> > Does the patch below fix it please?
>=20
> Yes, it does.

I have applied this patch to today's linux-next tree.

Rusty can you put this in you tree (or amend the patch that needs this)?

> > From: Jiri Kosina <jkosina-AlSwsSmVLrQ@public.gmane.org>
> > Subject: [PATCH] module: fix NULL pointer dereference in find_symbol()
> >=20
> > The patch that introduces each_symbol() iterator forgets to
> > test the NULL value of the output parameters (which the original
> > code did).
> >=20
> > This patch restores the correct checks.
> >=20
> > Signed-off-by: Jiri Kosina <jkosina-AlSwsSmVLrQ@public.gmane.org>
> > ---
> >   kernel/module.c |    6 ++++--
> >   1 files changed, 4 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/kernel/module.c b/kernel/module.c
> > index 880409f..a3354ca 100644
> > --- a/kernel/module.c
> > +++ b/kernel/module.c
> > @@ -304,8 +304,10 @@ static unsigned long find_symbol(const char *name,
> >   	fsa.warn =3D warn;
> >=20
> >   	if (each_symbol(find_symbol_in_section, &fsa)) {
> > -		*owner =3D fsa.owner;
> > -		*crc =3D fsa.crc;
> > +		if (owner)
> > +			*owner =3D fsa.owner;
> > +		if (crc)
> > +			*crc =3D fsa.crc;
> >   		return fsa.value;
> >   	}

--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__27_Jun_2008_00_21_00_+1000_JU3MZ7Lk=IY9NVDI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhjpcwACgkQTgG2atn1QN8OQQCfR4bqleeGVlaCDfxcg8kl46z1
mHIAnjfbTaLwPOcVLZdclpHAAYhxL7xY
=+Jwq
-----END PGP SIGNATURE-----

--Signature=_Fri__27_Jun_2008_00_21_00_+1000_JU3MZ7Lk=IY9NVDI--
