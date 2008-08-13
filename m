From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the usb.current tree
Date: Wed, 13 Aug 2008 10:53:56 +1000
Message-ID: <20080813105356.4cac9153.sfr@canb.auug.org.au>
References: <20080808112646.b5502bf1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__13_Aug_2008_10_53_56_+1000_2KVLfNSI7IiK4oH0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53243 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751040AbYHMAyG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Aug 2008 20:54:06 -0400
In-Reply-To: <20080808112646.b5502bf1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Dmitry Baryshkov <dbaryshkov@gmail.com>, Russell King <rmk@arm.linux.org.uk>

--Signature=_Wed__13_Aug_2008_10_53_56_+1000_2KVLfNSI7IiK4oH0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg, Dmitry,

On Fri, 8 Aug 2008 11:26:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the usb.current tree got a conflict in
> drivers/usb/gadget/omap_udc.c between commit
> a09e64fbc0094e3073dbb09c3b4bfe4ab669244b ("[ARM] Move
> include/asm-arm/arch-* to arch/arm/*/include/mach") from the arm-current
> tree and commit b7eff3b991784964df1e7eeffd944032ccc3e11f ("USB: omap_udc:
> fix compilation with debug enabled") from the usb.current tree.
>=20
> Some of the arm header files have moved.  I think I fixed it up right (I
> changed asm/arch/control.h to mach/control.h) and will carry the fix
> while necessary.

The arm changes here are now in Linus' tree, so this could be fixed up in
your patch.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__13_Aug_2008_10_53_56_+1000_2KVLfNSI7IiK4oH0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiiMKQACgkQjjKRsyhoI8wCXgCgs0Mfy65scS7/hkjgfOeU21yt
Df4AoIM4CODll+rENYfD54yhJ36xSrXh
=8F7u
-----END PGP SIGNATURE-----

--Signature=_Wed__13_Aug_2008_10_53_56_+1000_2KVLfNSI7IiK4oH0--
