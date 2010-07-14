From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for July 7
Date: Thu, 15 Jul 2010 09:45:13 +1000
Message-ID: <20100715094513.8941fa25.sfr@canb.auug.org.au>
References: <20100707165539.957e7d1c.sfr@canb.auug.org.au>
	<20100707172136.3658fb17.akpm@linux-foundation.org>
	<20100714152042.5b83f03b.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__15_Jul_2010_09_45_13_+1000_dtNoq4SyapQFUwo8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45063 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757145Ab0GNXpV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 14 Jul 2010 19:45:21 -0400
In-Reply-To: <20100714152042.5b83f03b.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Al Viro <viro@zeniv.linux.org.uk>

--Signature=_Thu__15_Jul_2010_09_45_13_+1000_dtNoq4SyapQFUwo8
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew, Al,

On Wed, 14 Jul 2010 15:20:42 -0700 Andrew Morton <akpm@linux-foundation.org=
> wrote:
>
> Bug is still there.  Reverting ""Make ->drop_inode() just return
> whether inode needs to be dropped" makes it go away.
>=20
> Al, please don't just dump crap in linux-next and then ignore bug reports=
.=20
> People are trying to get work done here.

I will revert that commit in linux-next today if it is still there (and
not fixed).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__15_Jul_2010_09_45_13_+1000_dtNoq4SyapQFUwo8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMPkwJAAoJEDMEi1NhKgbsd/kIAKKEiM/7cDbY6Ar9Vgtu97JK
5sC09DKXONeed97oEn9hpg5PICUZkF1f7z5920k+eUG6PEJBzfPWgQlZ7i/XOL2v
N1ZTZFhbWNbKe5E+WUMc/yKoiEQdaWbf4EhccJq5hs7z22MSYi/ozH6ib3g8juyk
bbOw5E83BtDLFCDSKtQ2enoR1GPLel30lG6avmNEFDzeoaGtV3P2hq6ZChXLlh16
BriZKTMvLWSqhPdPZxLDVXGXxvyHOYrTxQZyrih/WfUkQD5gRISel85t/xJwxWS5
L9BtCkQ/zQe+tqsqpO5vFsamcoZDyGReD11GkRLFJZDN5VJKFR22VHNdajXCvok=
=LItD
-----END PGP SIGNATURE-----

--Signature=_Thu__15_Jul_2010_09_45_13_+1000_dtNoq4SyapQFUwo8--
