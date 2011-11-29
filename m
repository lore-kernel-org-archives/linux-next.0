From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: git tag expiry?
Date: Wed, 30 Nov 2011 08:27:11 +1100
Message-ID: <20111130082711.9282d7e4b8a9a2eb201ee365@canb.auug.org.au>
References: <1322590972.15134.5.camel@Joe-Laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__30_Nov_2011_08_27_11_+1100_QWI=mPc0YhkX23bK"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:51927 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752781Ab1K2V1V (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 29 Nov 2011 16:27:21 -0500
In-Reply-To: <1322590972.15134.5.camel@Joe-Laptop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: linux-next <linux-next@vger.kernel.org>

--Signature=_Wed__30_Nov_2011_08_27_11_+1100_QWI=mPc0YhkX23bK
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Joe,

On Tue, 29 Nov 2011 10:22:52 -0800 Joe Perches <joe@perches.com> wrote:
>
> In order to keep the next git repository size down,
> are you going to continue to expire and delete older
> next-<date> tags after some number of months/days/weeks?
>=20
> I think it'd be sensible to keep a maximum of 2 months
> of tags and once a month expire out the oldest tags
> followed by a repack.

Currently, there should be 90 tags in the linux-next tree.  This should
easily cover a whole release cycle (and a bit extra). Each day, I remove
the oldest one.  Apparently "git gc" is run automatically on kernel.org
every so often.  I don;t think that the "git gc" should affect how much
is downloaded (very much), though.

Also, if you fetch the tree, you should only get the latest version as I
also removed the "history" branch that was stiching all the tags
together.   So to get an older tag, you need to explicitly fetch it (or
use --tags on the fetch - unless you mirror the tree, in which case you
will get the whole lot).  If you fetch each day, you should only be
downloading a few MB ...

The linux-next history tree has all the tags just in case anyone wants an
older one.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__30_Nov_2011_08_27_11_+1100_QWI=mPc0YhkX23bK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJO1U4vAAoJEECxmPOUX5FELKUP/00e8vQbedrS3HYLMMsfq2PY
kZaL7Su6JYE6RULhm7K0KKyt1vneOs14wd/xv14h2NfIyEtP6eBrX/irH4pJpwna
HirtvIJ/1vcSwzS6ez54g2IDXqbDHWA0wkke2oxMog6pEzrUMnZ4ui4VXVIoXfLD
Hrwnn0eq0WaBZ43OrDKVcSS+MEizazZmkIvhluNRvKhGZB1eBzi2co+XYJQ+xGLd
I/vSeUdgel1uQuzFfN9GoxGF1mLy0Vg4m43eECDLpQFgU3SKkIGww2OR9NCYoX5H
v8GAz/rpz2nybokQ51B06JjdCmfjQmNpZTzyMEfzCVxAP3HAHQYhBQqzgqcL2iQw
oNdV5lo74PGgNLqFfFXaztMr4Zaun1SbHao3YvytmrBregiQboV5ZlUy6QZnP0qm
rr13YBVc3qVy6X7vp7TT9He5BRJJi81N09UGaFHQjgTMsBKHsmDbJkCaO15hty13
qLZEY8K3anKIZfoOK4bm6IyXIDuhBAYASeRAzNGkkqJ61ocFKvHmzqvBv2HgSNow
05ZzCeiI/zTkfhiYGGKqExOjaw2v9PU9wBsoD3aqWMOK28j9y+jtpk+1Vi+LLIoP
Fa8KCBCBqyGJ2cGWfA/x2VEEifzRlVixmxXOt9VlM4m5nZBgiY4qZijDbaRS49zt
k51D1B1ECtZzEytdaCU8
=qb8q
-----END PGP SIGNATURE-----

--Signature=_Wed__30_Nov_2011_08_27_11_+1100_QWI=mPc0YhkX23bK--
