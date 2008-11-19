From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: driver-core tree build failure
Date: Wed, 19 Nov 2008 16:43:17 +1100
Message-ID: <20081119164317.9bfff78d.sfr@canb.auug.org.au>
References: <20081119113031.28e2ae68.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__19_Nov_2008_16_43_17_+1100_7f3+CnXHjFp2JX87"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40349 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750707AbYKSFne (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Nov 2008 00:43:34 -0500
In-Reply-To: <20081119113031.28e2ae68.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>

--Signature=_Wed__19_Nov_2008_16_43_17_+1100_7f3+CnXHjFp2JX87
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Wed, 19 Nov 2008 11:30:31 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> I have dropped the driver-core tree (and the usb tree that depends on it)
> from linux-next for today.

I had to drop the staging tree as well (since it depends on the usb
tree), of course.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__19_Nov_2008_16_43_17_+1100_7f3+CnXHjFp2JX87
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkjp3UACgkQjjKRsyhoI8xeUQCgkMA6S9IZeoCBNFWIIQgosKP9
2vcAniZCvCf4M76B2YjnpVYw3mc6S0FG
=UaaW
-----END PGP SIGNATURE-----

--Signature=_Wed__19_Nov_2008_16_43_17_+1100_7f3+CnXHjFp2JX87--
