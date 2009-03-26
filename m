From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: pci tree build failure
Date: Thu, 26 Mar 2009 14:05:31 +1100
Message-ID: <20090326140531.cde0be37.sfr@canb.auug.org.au>
References: <20090323124948.fed84e3a.sfr@canb.auug.org.au>
	<20090325122121.225a0ccb.sfr@canb.auug.org.au>
	<20090324183800.6ba50715@hobbes.virtuouswap>
	<20090325144117.9c54ae5a.sfr@canb.auug.org.au>
	<20090325043001.GF20264@linux.intel.com>
	<20090325085550.3788540b@hobbes.virtuouswap>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__26_Mar_2009_14_05_31_+1100_wZbHPN/aGvW2DWT6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58955 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756018AbZCZDFl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Mar 2009 23:05:41 -0400
In-Reply-To: <20090325085550.3788540b@hobbes.virtuouswap>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: Matthew Wilcox <willy@linux.intel.com>, linux-next@vger.kernel.org

--Signature=_Thu__26_Mar_2009_14_05_31_+1100_wZbHPN/aGvW2DWT6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

On Wed, 25 Mar 2009 08:55:50 -0700 Jesse Barnes <jbarnes@virtuousgeek.org> =
wrote:
>
> Ok fix pushed.  Yeah it does seem weird.  This file clearly uses PCI
> defines...

Thanks.

Actually all that file required was a "forward" declaration of "struct
pci_dev".  It was not accessing the pci_dev in any way, just passing
pointers to them on to other routines.  I guess it got such a declaration
indirectly.

/me likes to understand ...
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__26_Mar_2009_14_05_31_+1100_wZbHPN/aGvW2DWT6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknK8PsACgkQjjKRsyhoI8yNywCfWzE1/rbH5tqdNt5lv5VeWErK
STMAoKKGV4j2t2mVNAZgN5VqNe2zGzYI
=G6dw
-----END PGP SIGNATURE-----

--Signature=_Thu__26_Mar_2009_14_05_31_+1100_wZbHPN/aGvW2DWT6--
