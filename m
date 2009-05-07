From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the kmemleak tree with the x86 tree
Date: Thu, 7 May 2009 21:22:41 +1000
Message-ID: <20090507212241.84664509.sfr@canb.auug.org.au>
References: <20090507155444.47dd74ea.sfr@canb.auug.org.au>
	<20090507092310.GA27707@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__7_May_2009_21_22_41_+1000_ugFFc3ljeda+u=wv"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58210 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754480AbZEGLWo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 May 2009 07:22:44 -0400
In-Reply-To: <20090507092310.GA27707@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

--Signature=_Thu__7_May_2009_21_22_41_+1000_ugFFc3ljeda+u=wv
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Thu, 7 May 2009 11:23:10 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.ld=
s.S
> > index 4c85b2e..0bbb2d1 100644
> > --- a/arch/x86/kernel/vmlinux.lds.S
> > +++ b/arch/x86/kernel/vmlinux.lds.S
> > @@ -107,6 +107,7 @@ SECTIONS
> > =20
> >  	/* Data */
> >  	. =3D ALIGN(PAGE_SIZE);
> > +	_sdata =3D .;			/* Start of data section */
> >  	.data : AT(ADDR(.data) - LOAD_OFFSET) {
> >  		DATA_DATA
> >  		CONSTRUCTORS
>=20
> At a quick glance, that line should be moved a line further down, to=20
> avoid a boot crash of linux-next with CONFIG_RELOCATABLE=3Dy (which=20
> most distros ship with).

Thanks, Sam pointed that out as well. This is, of course, why I publish
these "fixups" - so that those with more knowledge can correct them.
I'll correct my fixup for tomorrow.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__7_May_2009_21_22_41_+1000_ugFFc3ljeda+u=wv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoCxIEACgkQjjKRsyhoI8w3ZwCglRoA8ioFmGu7sin2B8yhIAow
HlIAoIw/6LaGgjhAFR/EjFvjAlSpZEjh
=qewv
-----END PGP SIGNATURE-----

--Signature=_Thu__7_May_2009_21_22_41_+1000_ugFFc3ljeda+u=wv--
