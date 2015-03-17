From: Felipe Balbi <balbi@ti.com>
Subject: Re: Build failure: -next 20150316
Date: Mon, 16 Mar 2015 22:52:26 -0500
Message-ID: <20150317035226.GA29805@saruman.tx.rr.com>
References: <20150316195904.620c48f4@www.etchedpixels.co.uk>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:54569 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750957AbbCQDxR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Mar 2015 23:53:17 -0400
Content-Disposition: inline
In-Reply-To: <20150316195904.620c48f4@www.etchedpixels.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next <linux-next@vger.kernel.org>, linux-usb@vger.kernel.org

--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 16, 2015 at 07:59:04PM +0000, Alan Cox wrote:
> drivers/built-in.o: In function `dwc2_pci_remove':
> /rotating/Kernel/next/drivers/usb/dwc2/pci.c:70: undefined reference to
> `usb_phy_generic_unregister' drivers/built-in.o: In function
> `dwc2_pci_probe': /rotating/Kernel/next/drivers/usb/dwc2/pci.c:118:
> undefined reference to
> `usb_phy_generic_register' /rotating/Kernel/next/drivers/usb/dwc2/pci.c:1=
41:
> undefined reference to `usb_phy_generic_unregister' Makefile:950: recipe
> for target 'vmlinux' failed make: *** [vmlinux] Error 1

I think I already a fix for this in my testing/next, just need to mergew
it into next after testing.


--=20
balbi

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVB6T6AAoJEIaOsuA1yqREtdgP/1hbISJI58UVHGY/qbAxxAe2
6puyKguEAfOjsysj8bewf0zQwNWHLs96VPughhIxJ6yx2YF5rdNn+/+4YSZKks+m
DtQ4GEACKzO4Ojjyh7tLzycYJ+CCYRAypMYD4+UFpZlqqHHRWyTFZC5yLq7qwLL3
RkzefJ2kCszgf2IlJwT+6t5ulmcqSTxtlwSTjEpskJCRSSTxdCzQ9Vv76xrfLv1g
fdM5b7AcBBrs+1U7T5XGqOOXZjKpWQDJRPG8Pla9VJ/LjHAnPHxY0bas1ErF/Bfg
PYVSzsH3Cu7mZQ7vyEXumXqQlWGKU329N8ji00GKN+nc1CL63jZwiHzDbV6z3vSI
f7aiUsXO05CGuxF+OIpI6OP59EFkXhn3w+m9BJ9EYKVa3QSlZT+D8mR5NhW//Fb9
dAdMRZhmcmAPIk3vgiG2XXbkzAa/Ta3j9s2vMl4UlObyYYx677eL38/vubSL4Jxc
e3gcg1vIgLjzhQcUEl2HC0rDNFYWHwa0MPy73/PIxoaYvxITRv7CyCTZx6USTPqe
ZJhTJNV9m+IgHBRKdw+ph8ldKeuDLvJ9keV0GzCGKbM1RhtlxRSUocrAmfMgr92B
AVZ7XVzpa71Z5Z2Lr1cl5SUCqnZ6Z0pcsfAib+kODz/MB+ph86jYFvrpOTcz8zIX
ME2iFlHpX8zkImemCW56
=aUE9
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
