From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: input tree build failure
Date: Mon, 25 Jan 2010 16:52:19 +1100
Message-ID: <20100125165219.cd0b869d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__25_Jan_2010_16_52_19_+1100_q6.2x4s0_YdtIP/1"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51678 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751104Ab0AYFwh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Jan 2010 00:52:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tobias Klauser <tklauser@distanz.ch>, John Linn <john.linn@xilinx.com>

--Signature=_Mon__25_Jan_2010_16_52_19_+1100_q6.2x4s0_YdtIP/1
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Today's linux-next build (powerpc ppc44x_defconfig) failed like this:

drivers/input/serio/xilinx_ps2.c: In function 'xps2_of_probe':
drivers/input/serio/xilinx_ps2.c:273: error: incompatible type for argument=
 1 of 'resource_size'
include/linux/ioport.h:132: note: expected 'const struct resource *' but ar=
gument is of type 'struct resource'
drivers/input/serio/xilinx_ps2.c: In function 'xps2_of_remove':
drivers/input/serio/xilinx_ps2.c:347: error: incompatible type for argument=
 1 of 'resource_size'
include/linux/ioport.h:132: note: expected 'const struct resource *' but ar=
gument is of type 'struct resource'

Please at least build test this stuff ...

Caused by commit cc7bbfa322b48be82b1c86a104433d4ac349da79 ("Input:
xilinx_ps2 - use resource_size").

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__25_Jan_2010_16_52_19_+1100_q6.2x4s0_YdtIP/1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktdMZMACgkQjjKRsyhoI8w7OgCguZPDU0meR46hLlrIsdgGExfy
qRMAniEtAb2AK3xfvPhydY3R3RiOAiRQ
=ywmw
-----END PGP SIGNATURE-----

--Signature=_Mon__25_Jan_2010_16_52_19_+1100_q6.2x4s0_YdtIP/1--
