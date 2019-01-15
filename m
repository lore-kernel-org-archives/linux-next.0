From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs work in the usb-gadget tree
Date: Wed, 16 Jan 2019 07:34:24 +1100
Message-ID: <20190116073424.1a091912@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/eMEQ0EwfU1dD=pZ8nReOXm/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Minas Harutyunyan <hminas@synopsys.com>, Greg KH <greg@kroah.com>, Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: linux-next.vger.kernel.org

--Sig_/eMEQ0EwfU1dD=pZ8nReOXm/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

[I am experimenting with checking the Fixes tags in commits in linux-next.
Please let me know if you think I am being too strict.]

Hi Felipe,

Commit

  4a995e3496de ("usb: dwc2: gadget: Fix Remote Wakeup interrupt bit clearing
Malformed Fixes tag")

has a malformed Fixes tag:

  Fixes: 187c5298a122 ("usb: dwc2: gadget: Add handler for WkupAlert
  interrupt")

It should not be split across to lines.

--=20
Cheers,
Stephen Rothwell

--Sig_/eMEQ0EwfU1dD=pZ8nReOXm/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw+Q9AACgkQAVBC80lX
0GxNlgf+OEabwCXDUWRTymZPTUSyHDCNkJo86L5nfdi5POO/NPaTYAVOB3L49Pa6
3MpLtWn+iG6Lgd+SpPKCDC4daAR3rKGk5JeJAnr0a8qFR0NKoi9xOr68D9vIs01t
3ilLOH0Rbi+Sa3515+ZWVraoYQhPEM39NRBGjwfE9Uopg0f+5a70tmSDUwhDIxDh
+3McxZ7vGg10HWPn6ugAWT0vBIoKiDEglOQu59VZtbjDo7SVZlUOD6vpnZxltyuQ
jdUTjDjnNbTKonsdQILAD9gA5W9MW0GKLQgqzJt977wHCc86dPkMgYPZgekmTCwv
CEHOCVUtLIo+1cy6JNIud/UMLLy1/w==
=2Orw
-----END PGP SIGNATURE-----

--Sig_/eMEQ0EwfU1dD=pZ8nReOXm/--
