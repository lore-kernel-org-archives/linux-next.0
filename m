From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: upstream tree build warnings
Date: Thu, 23 Apr 2009 22:51:08 +1000
Message-ID: <20090423225108.600a6e8e.sfr@canb.auug.org.au>
References: <20090423163847.200f227e.sfr@canb.auug.org.au>
	<20090423.002403.74400050.davem@davemloft.net>
	<20090423215533.157df0e0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__23_Apr_2009_22_51_08_+1000_dIKc+_d2IlRzBhI+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54481 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753225AbZDWMvP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Apr 2009 08:51:15 -0400
In-Reply-To: <20090423215533.157df0e0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, alex.williamson@hp.com, rusty@rustcorp.com.au, linux-kernel@vger.kernel.org

--Signature=_Thu__23_Apr_2009_22_51_08_+1000_dIKc+_d2IlRzBhI+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Thu, 23 Apr 2009 21:55:33 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> The callers came in throught commit
> 0bde95690d65653e420d04856c5d5783155c747c ("virtio_net: Add support for
> VLAN filtering in the hypervisor") which I assume came in throught the
> net tree (it has you SOB on it). Committed Feb 5, 2009, went into Linus'
> tree before 2.6.30-rc1.
>=20
> scatterlist.h hasn't changed since July, 2008.

In other words, I think the bug has always been there and just never hit
(yet).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__23_Apr_2009_22_51_08_+1000_dIKc+_d2IlRzBhI+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknwZDwACgkQjjKRsyhoI8wQpACfWPh2VUWYnccUuqYdN3/CfBpi
Wi0Anj9z96KxIKwMPKeAyIctgUVw/DLy
=lg08
-----END PGP SIGNATURE-----

--Signature=_Thu__23_Apr_2009_22_51_08_+1000_dIKc+_d2IlRzBhI+--
