From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb.current tree
Date: Fri, 8 Aug 2008 11:26:46 +1000
Message-ID: <20080808112646.b5502bf1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__8_Aug_2008_11_26_46_+1000_bznTJa3r2Q5jih6F"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55372 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751017AbYHHB05 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Aug 2008 21:26:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Dmitry Baryshkov <dbaryshkov@gmail.com>, Russell King <rmk@arm.linux.org.uk>

--Signature=_Fri__8_Aug_2008_11_26_46_+1000_bznTJa3r2Q5jih6F
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the usb.current tree got a conflict in
drivers/usb/gadget/omap_udc.c between commit
a09e64fbc0094e3073dbb09c3b4bfe4ab669244b ("[ARM] Move
include/asm-arm/arch-* to arch/arm/*/include/mach") from the arm-current
tree and commit b7eff3b991784964df1e7eeffd944032ccc3e11f ("USB: omap_udc:
fix compilation with debug enabled") from the usb.current tree.

Some of the arm header files have moved.  I think I fixed it up right (I
changed asm/arch/control.h to mach/control.h) and will carry the fix
while necessary.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__8_Aug_2008_11_26_46_+1000_bznTJa3r2Q5jih6F
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiboNYACgkQjjKRsyhoI8zY/ACbBiEle4v9Jg2utXI9c/Bywy09
TVYAoIlW2EcRoiHsLw3W++C0z70snw0A
=1OLg
-----END PGP SIGNATURE-----

--Signature=_Fri__8_Aug_2008_11_26_46_+1000_bznTJa3r2Q5jih6F--
