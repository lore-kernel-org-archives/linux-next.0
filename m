From: Michael Ellerman <michael@ellerman.id.au>
Subject: Re: [BUILD FAILURE 09/12] Next April 21 : PPC64 randconfig
 [drivers/staging/comedi/drivers.o]
Date: Wed, 22 Apr 2009 10:08:30 +1000
Message-ID: <1240358910.6571.6.camel@localhost>
References: <1240340029.9110.142.camel@subratamodak.linux.ibm.com>
Reply-To: michael@ellerman.id.au
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-fsbRXAJSe7ZbxPhZ/EMg"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bilbo.ozlabs.org ([203.10.76.25]:43113 "EHLO bilbo.ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752668AbZDVAIc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Apr 2009 20:08:32 -0400
In-Reply-To: <1240340029.9110.142.camel@subratamodak.linux.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: subrata@linux.vnet.ibm.com
Cc: Greg KH <greg@kroah.com>, sachinp <sachinp@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "David A. Schleef" <ds@schleef.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linuxppc-dev <Linuxppc-dev@ozlabs.org>, linux-next <linux-next@vger.kernel.org>, Alexander Beregalov <a.beregalov@gmail.com>


--=-fsbRXAJSe7ZbxPhZ/EMg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2009-04-22 at 00:23 +0530, Subrata Modak wrote:
> Reported this error on 14th April:
> http://lkml.org/lkml/2009/4/14/488,
>=20
> CC [M]  drivers/staging/comedi/drivers.o=20
> drivers/staging/comedi/drivers.c: In function =E2=80=98comedi_buf_alloc=
=E2=80=99:
> drivers/staging/comedi/drivers.c:496: error: =E2=80=98PAGE_KERNEL_NOCACHE=
=E2=80=99
> undeclared (first use in this function)
> drivers/staging/comedi/drivers.c:496: error: (Each undeclared identifier
> is reported only once
> drivers/staging/comedi/drivers.c:496: error: for each function it
> appears in.)
> make[3]: *** [drivers/staging/comedi/drivers.o] Error 1
> make[2]: *** [drivers/staging/comedi] Error 2
> make[1]: *** [drivers/staging] Error 2
> make: *** [drivers] Error 2

Subrata, unless someone says otherwise, please do not send randconfig
failures for drivers in staging - those drivers have bigger problems
than randconfig failures.

To avoid them, do this:

# make randconfig
# sed -i -e 's/^\(CONFIG_STAGING\)=3Dy/# \1 is not set/' .config
# make oldconfig


cheers

--=-fsbRXAJSe7ZbxPhZ/EMg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAknuX/4ACgkQdSjSd0sB4dKu4gCfZw6nAa8ivt9INhaXkp02EzBf
CWoAoKc5KyXSjF42dOaF0aHGWR2NDshS
=+1dW
-----END PGP SIGNATURE-----

--=-fsbRXAJSe7ZbxPhZ/EMg--
