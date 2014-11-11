From: Felipe Balbi <balbi@ti.com>
Subject: Re: linux-next: manual merge of the usb-gadget tree with the
 usb-gadget-fixes tree
Date: Tue, 11 Nov 2014 08:53:44 -0600
Message-ID: <20141111145344.GD25615@saruman>
References: <20141111162322.7be1fade@canb.auug.org.au>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zS7rBR6csb6tI2e1"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:45116 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751976AbaKKOxW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 11 Nov 2014 09:53:22 -0500
Content-Disposition: inline
In-Reply-To: <20141111162322.7be1fade@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Felipe Balbi <balbi@ti.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--zS7rBR6csb6tI2e1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2014 at 04:23:22PM +1100, Stephen Rothwell wrote:
> Hi Felipe,
>=20
> Today's linux-next merge of the usb-gadget tree got a conflict in
> drivers/usb/dwc3/ep0.c between commit 520fe7633692 ("usb: dwc3: ep0:
> fix for dead code") from the usb-gadget-fixes tree and commit
> ccb072de5702 ("usb: dwc3: ep0: trace ep0 TRBs too") from the usb-gadget
> tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

resolution looks good to me. Thank you

--=20
balbi

--zS7rBR6csb6tI2e1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUYiL4AAoJEIaOsuA1yqREPs4QAIhTlCU9MdbiPPB6KEFoKHS9
5+gg2uvD3rtQHdPZEs0huwANaFdy6YEVr6qEI125aKJBriJ9GgfTJM95wdAECHxL
mCrfpLNnugl93JvgA9c8vDCHu9kOJ3xUoxIzGEKjeERdgYszGfhDSIf/IBoTp255
QSzj07axhH9lF5Tut/sFxrn/UfwV8P244uCgUmEorlpFOHACuehZ5cdrZtCXvdOx
CO4pdR0gLWkGTxF/7NQv/05ZKxvH2TTsgrOM3xyw3fcTFvxrSx4oNx6nVoHLBg9z
qVVVw03bgRiaf/xdOSRsv1n4qvvZoYyKh+v52Twd+2yIiW8mqi4EETWogYjNHaKq
FSbPt43rcP4oMm+Xp+tX71BNFmXux9Bf/kD2kIcMBgt3/EtnNV7do8WCIFq02GS2
kx+4EqXZ82cRBOLEWXtVqXu4G1vxbTWNIShgV8O8F8FAiFIxj3qkVuDYp3eIjq3w
ogqqVoFWrQ6Dl30aTZE1q1eHh1ZxScR7xaeGjZpGd8/78lz6sX0JUJGPw8IAsN4U
l2EgNKMuU/DCBDhBVVdlDdxyv6JwUhrCDs1L38th+Rwn6yFnDX15Fx8ZPJ3uJRDR
ZJjOGjknld43ZidBiv9mlmNoSUEbsqdJpETw+6RPW2mhR3wR2kSEDUrUFvVutcuQ
j3KUvDxuVjprEx5yLD7r
=iO5M
-----END PGP SIGNATURE-----

--zS7rBR6csb6tI2e1--
