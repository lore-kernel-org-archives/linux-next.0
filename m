From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: usb.current tree build failure
Date: Thu, 7 Aug 2008 16:25:14 +1000
Message-ID: <20080807162514.1cbe3e5d.sfr@canb.auug.org.au>
References: <20080807105321.5aad96a4.sfr@canb.auug.org.au>
	<20080807042353.GB25803@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__7_Aug_2008_16_25_14_+1000_Zih3lp7ztj5=8BCW"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56476 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754306AbYHGGZZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Aug 2008 02:25:25 -0400
In-Reply-To: <20080807042353.GB25803@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Kevin Lloyd <klloyd@sierrawireless.com>

--Signature=_Thu__7_Aug_2008_16_25_14_+1000_Zih3lp7ztj5=8BCW
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Wed, 6 Aug 2008 21:23:53 -0700 Greg KH <greg@kroah.com> wrote:
>
> On Thu, Aug 07, 2008 at 10:53:21AM +1000, Stephen Rothwell wrote:
> >=20
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> >=20
> > In file included from drivers/usb/storage/usb.c:177:
> > drivers/usb/storage/unusual_devs.h:1577: error: 'sierra_ms_init' undecl=
ared here (not in a function)
> >=20
> > Caused by commit ff28a24426410aa193b47a5e9ec091d46eaa66d1 ("USB Storage
> > Sierra: TRU-Install feature update").
> >=20
> > I applied the following patch.
>=20
> Thanks, now merged in.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__7_Aug_2008_16_25_14_+1000_Zih3lp7ztj5=8BCW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkialUoACgkQjjKRsyhoI8zgAQCgrh52G2l6jLMwjzfDQKUqUheT
63kAn1vaDdY+dNkJSRl3n9+1ofgO66Sl
=y8gm
-----END PGP SIGNATURE-----

--Signature=_Thu__7_Aug_2008_16_25_14_+1000_Zih3lp7ztj5=8BCW--
