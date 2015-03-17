From: Felipe Balbi <balbi@ti.com>
Subject: Re: Build failure: -next 20150316
Date: Tue, 17 Mar 2015 12:50:19 -0500
Message-ID: <20150317175019.GG5001@saruman.tx.rr.com>
References: <20150316195904.620c48f4@www.etchedpixels.co.uk>
 <20150317035226.GA29805@saruman.tx.rr.com>
 <55086760.8060305@synopsys.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rV8arf8D5Dod9UkK"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:59120 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752668AbbCQRvM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Mar 2015 13:51:12 -0400
Content-Disposition: inline
In-Reply-To: <55086760.8060305@synopsys.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: John Youn <John.Youn@synopsys.com>
Cc: balbi@ti.com, Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-next <linux-next@vger.kernel.org>, linux-usb@vger.kernel.org

--rV8arf8D5Dod9UkK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2015 at 10:41:52AM -0700, John Youn wrote:
> On 3/16/2015 8:53 PM, Felipe Balbi wrote:
> > Hi,
> >=20
> > On Mon, Mar 16, 2015 at 07:59:04PM +0000, Alan Cox wrote:
> >> drivers/built-in.o: In function `dwc2_pci_remove':
> >> /rotating/Kernel/next/drivers/usb/dwc2/pci.c:70: undefined reference to
> >> `usb_phy_generic_unregister' drivers/built-in.o: In function
> >> `dwc2_pci_probe': /rotating/Kernel/next/drivers/usb/dwc2/pci.c:118:
> >> undefined reference to
> >> `usb_phy_generic_register' /rotating/Kernel/next/drivers/usb/dwc2/pci.=
c:141:
> >> undefined reference to `usb_phy_generic_unregister' Makefile:950: reci=
pe
> >> for target 'vmlinux' failed make: *** [vmlinux] Error 1
> >=20
> > I think I already a fix for this in my testing/next, just need to mergew
> > it into next after testing.
> >=20
> >=20
>=20
> Hi Felipe,
>=20
> I think it's different problem. I'll have a patch for you
> shortly.

Thanks

--=20
balbi

--rV8arf8D5Dod9UkK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVCGlbAAoJEIaOsuA1yqREwgEP/2gytlTQi6TUvhRyBE21/ZJH
+LJjz6Oq6cVC6fyORG06ZBcifv69icb21M7aQwGNdbQ4PeXuu/vlCYwRSHXIh4bF
H2oXvEgf7gzBWuCCS67h6nhS+3gC9hYOQZ9b9PfUF5jIx7HHmrWXePw9pmb8wnPH
biRWSwMULXtYTS9NbAmTAaDfbEWH/CpgtIXFl1aonvbp8ccqZFLwPzoEwJtR/OC1
xB7rHFmthr4/d4ZiS1T7RgNDR9xZ6l6TaCMGI4G1eoAEl7nFd7li1EpuNuVYBQlz
R1JO9D11If7Po2koK6ZE+mQYWT2svsp8rGU9iPGJqat2feVG/a1N1bZ42X6kXyT+
bAsPV9Pk2rouIIMgLE8chPm4KnmugFnUVVOdU8G8e8ZPe9NZdtLWk4ikh6bEOtbn
MV2qEIgSe0ZGyoNMK2xxpExG7h4ocr5Rwu186UeccG0WT6VfXCCWaVANYJVGcKAG
llim0jHQHyGEfQxrr/rI//000O558BkYIxW781QyK3yaq7JgidlpUP6Zh56ed9yJ
wwJl1GlpWY0TIFNoGGlU8nY1JyRb5YHYdWWqN6IYh5fQ2zP2eg4AGs6qdkfZc0r6
ebneZqFTy01Kx8xWBUx9KOZ/rGMh80GzcSL5sjM1yd5xfMPYRP1Ab8BkXLpHpSyh
W/E+BaV/JNu4pg3MJXgJ
=r0lq
-----END PGP SIGNATURE-----

--rV8arf8D5Dod9UkK--
