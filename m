From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the usb-gadget tree
Date: Tue, 17 Dec 2013 15:27:04 +1100
Message-ID: <20131217152704.e4ce5fd1556402ed4da789b1@canb.auug.org.au>
References: <20131216154020.9d7f9dacf60e41b775d44223@canb.auug.org.au>
	<20131216194113.GA5258@saruman.home>
	<20131217101032.1f4d2ba671e6359fce0514cb@canb.auug.org.au>
	<20131216233815.GB29284@saruman.home>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__17_Dec_2013_15_27_04_+1100_ckHV8ffl4s+G31mx"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:54618 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751765Ab3LQE1L (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Dec 2013 23:27:11 -0500
In-Reply-To: <20131216233815.GB29284@saruman.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: balbi@ti.com
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, WingMan Kwok <w-kwok2@ti.com>, Roger Quadros <rogerq@ti.com>

--Signature=_Tue__17_Dec_2013_15_27_04_+1100_ckHV8ffl4s+G31mx
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Filipe,

On Mon, 16 Dec 2013 17:38:15 -0600 Felipe Balbi <balbi@ti.com> wrote:
>
> It's long, sorry, basically what I did was this:
>=20
> -      ret =3D usb_phy_gen_create_phy(dev, &k_phy->usb_phy_gen,
> -                      USB_PHY_TYPE_USB2, 0, false);
> +      ret =3D usb_phy_gen_create_phy(dev, &k_phy->usb_phy_gen, NULL);

OK, so I added that as a merge fix patch from today.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__17_Dec_2013_15_27_04_+1100_ckHV8ffl4s+G31mx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJSr9KcAAoJEMDTa8Ir7ZwVIxkP/R/DfWzqNKIVztMhttDJyw/Z
UKGa3Xzq5W59m36lEipekFZfR50mVEit5skt9l5AKFfePdSPe613nazDs/dYccOG
NssPISjCSSe2v6cfp3ZLtbCAHSQfelU7nABTQY5zEWjw6vsKFjJuT58CY03N87XK
Sh4rginwFjrIY0VknvZzqEG1cG+mspeYkW4hIcWz81o6NFHetlhFK0ZXPDuI9fLA
aoVnC0iRcRAyaNnqcbZJTAK/oyMA78bF5Rtbo5qW1oiexTlBq6mLNEJoVc13BMYP
uc2i1R5WXpRk4d2IXal/Qj6DOPQ4RV9tiHXyFC1dangg59eWmjLrVBsMC3gIO/pi
VUG5hplhI2C/z+2BHI9NSsSRBvlaWb43xPSag4sce9kiRdSA1K0JJJEiJ5UuovFu
CCY53uQ18Z58U0aUiFhzJG+/xkNyhjl1Gc5NukRybHbOZxTUnaR8L4f3d8fnlj0K
tc6CRFlGbTJjT7mI4v8XGOzhT3x+dl2T4zCcOTtHAS0/4g1sjKocJToSUGP/TX6B
19rnxdkC2LdOh4tF81TSz8si82Eardy8XL8ht1xYYP3P7JSJeJC0qGPM62ISwio0
aavBptcCMbC4Gy1MuKlE9CVB/OLj6Hxv2w5qBFyfSMiJpTT8aS1LT9OSmyZFEQov
X5Ua1ssFRj9gURhe50tN
=Hk2L
-----END PGP SIGNATURE-----

--Signature=_Tue__17_Dec_2013_15_27_04_+1100_ckHV8ffl4s+G31mx--
