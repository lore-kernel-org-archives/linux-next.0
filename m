From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the avr32 tree
Date: Fri, 8 Aug 2008 13:51:45 +1000
Message-ID: <20080808135145.e77b8b4c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__8_Aug_2008_13_51_45_+1000_Pwa_pSbMYIQjt6/y"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50984 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752665AbYHHDvx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Aug 2008 23:51:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Haavard Skinnemoen <hskinnemoen@atmel.com>
Cc: linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

--Signature=_Fri__8_Aug_2008_13_51_45_+1000_Pwa_pSbMYIQjt6/y
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Haavard,

Today's linux-next merge of the avr32 tree got conflicts in arch/avr32/mach=
-at32ap/at32ap700x.c and arch/avr32/mach-at32ap/pm.c between commit 3663b73=
6a5083b3bce74520b637f630f01f66a7f ("avr32: Use <mach/foo.h> instead of <asm=
/arch/foo.h>") from the arm-current tree and the avr32 tree.

The include files seem to have moved around quite a bit, so I didn't
apply the avr32 tree for today.  Hopefully, the arm-current tree will
migrate to Linus' tree soon and then the avr32 tree can be updated to
reflect the changes.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__8_Aug_2008_13_51_45_+1000_Pwa_pSbMYIQjt6/y
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkibwtEACgkQjjKRsyhoI8z8RQCgvC+Zn7JhTZOMAs/hOsYIAI6x
XVQAoLCnSELdyaC+lb7IDbETTdjucqvP
=M53E
-----END PGP SIGNATURE-----

--Signature=_Fri__8_Aug_2008_13_51_45_+1000_Pwa_pSbMYIQjt6/y--
