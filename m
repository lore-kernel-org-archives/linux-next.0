From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: usb/sparc build failure
Date: Wed, 28 May 2008 09:19:59 +1000
Message-ID: <20080528091959.1d527095.sfr@canb.auug.org.au>
References: <20080527202630.6352736d.sfr@canb.auug.org.au>
	<20080527165019.GB3699@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__28_May_2008_09_19_59_+1000_M_BhlPPEv0b5jHla"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49102 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751253AbYE0XUY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 27 May 2008 19:20:24 -0400
In-Reply-To: <20080527165019.GB3699@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, David Vrabel <david.vrabel@csr.com>, "David S. Miller" <davem@davemloft.net>

--Signature=_Wed__28_May_2008_09_19_59_+1000_M_BhlPPEv0b5jHla
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Tue, 27 May 2008 09:50:19 -0700 Greg KH <greg@kroah.com> wrote:
>
> On Tue, May 27, 2008 at 08:26:30PM +1000, Stephen Rothwell wrote:
> >=20
> > drivers/uwb/whci.c:166: error: `DMA_64BIT_MASK' undeclared (first use i=
n this function)
> > drivers/uwb/whci.c:166: error: (Each undeclared identifier is reported =
only once
> > drivers/uwb/whci.c:166: error: for each function it appears in.)
> > drivers/uwb/whci.c:168: error: `DMA_32BIT_MASK' undeclared (first use i=
n this function)
>=20
> Is this sparc64 or sparc32?  I don't seem to get these errors using the
> sparc64 cross compiler tool chain.

http://kisskb.ellerman.id.au/kisskb/buildresult/29187/ (that's from the
day before yesterday, but it happened again yesterday). sparc32 build
using a biarch sparc64 cross compiler.

But it shouldn't matter.  If you use something from a header file,
include it (or something that is guaranteed to include it on all
architecture using all configs).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__28_May_2008_09_19_59_+1000_M_BhlPPEv0b5jHla
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIPJcjTgG2atn1QN8RAnH8AJ4kDypeYrugOJ71P8Og4tUOsW7gpgCfbjZu
s01alEkdMREeF8UkQyegKGk=
=4yFR
-----END PGP SIGNATURE-----

--Signature=_Wed__28_May_2008_09_19_59_+1000_M_BhlPPEv0b5jHla--
