From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the usb-gadget-fixes
 tree
Date: Wed, 11 Mar 2015 13:41:50 +1100
Message-ID: <20150311134150.2cd9464c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/xsYE8YGVAag10wy+kJmZmlQ"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49006 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750920AbbCKCl5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Mar 2015 22:41:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Felipe Balbi <balbi@ti.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Valentin Rothberg <Valentin.Rothberg@lip6.fr>, Valentin Rothberg <valentinrothberg@gmail.com>

--Sig_/xsYE8YGVAag10wy+kJmZmlQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in
drivers/usb/isp1760/isp1760-core.c between commit 80b4a0f8feeb ("usb:
isp1760: set IRQ flags properly") from the usb-gadget-fixes tree and
commit d8bf368d0631 ("genirq: Remove the deprecated 'IRQF_DISABLED'
request_irq() flag entirely") from the tip tree.

I fixed it up (the latter is a subset of the former) and can carry the
fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/xsYE8YGVAag10wy+kJmZmlQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU/6tyAAoJEMDTa8Ir7ZwVeh0P/1mmCHMvEhWT0iKHKI/PquCi
wNYVhGtphNdwgz37h4kMs/QmE2doBQw/OR0BaJdHkulxdfJuP1K3Y3fgBOYb2Jfi
SyTP1imMmswH8gjdFRS+/L1wLarZs+lof622lRr++lsyTFr4ygehmD58vvgU9UCg
vh4jjd1WNUJakWQ70VQYyEBELGBF7CUUT49OV9iQPi6FdUxtudqF36PMqSWgfkwU
NeWohKI4z7kAi1sxZY/fUdtFruYsFVA/K+4CiZOwJ9NkmaG3LhWGuK8RGdDk6uIE
7QsLQLBeSB1rnhsHHwQOPzyHIpp12/PUkfUBtIfXQN2QEULhpUlQ0oHg8b2YxXW4
Nq7dZAjLPO9SWmonqH945rMMiRlJPy4aRXk7nvWUb1KYGpL6BUo6OfAdGMTC/EvZ
srrzX3PzPeXxLdjzbLnX5luV4dLHoSjIvTs76o3FC2/5sUOBugHVV30OwofeNg18
RxKev4VHg+l7QYLI6Y5CBdLK+fhlNgpOv1tPitQEEAYDLFs41/bP5pqAnsK3AYV8
DOBVJcBD1IQzqGcPfp5o634mJa7J9TQ2MeLZebVqNMsTFBgCzGliqv3WcBRxJMph
FwwA9Ofso7v+nPEKQNZ21w0M0TtLzUQI0XCjiGGrAlJ0K2WMkz7cR9xHlvomw0K1
IJQoUjEr6DYHk+57SOS3
=14oB
-----END PGP SIGNATURE-----

--Sig_/xsYE8YGVAag10wy+kJmZmlQ--
