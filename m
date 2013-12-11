From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: getting fixmap patches in linux-next
Date: Thu, 12 Dec 2013 07:37:37 +1100
Message-ID: <20131212073737.7801b6254322be9b12671e88@canb.auug.org.au>
References: <1386775505.1979.105.camel@deneb.redhat.com>
	<20131211154021.GA11208@gmail.com>
	<1386777359.1979.106.camel@deneb.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__12_Dec_2013_07_37_37_+1100_3TbgXfeiZaqMJTeb"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:54070 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750996Ab3LKUhn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Dec 2013 15:37:43 -0500
In-Reply-To: <1386777359.1979.106.camel@deneb.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Salter <msalter@redhat.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-next <linux-next@vger.kernel.org>, mingo <mingo@redhat.com>, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Thu__12_Dec_2013_07_37_37_+1100_3TbgXfeiZaqMJTeb
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Wed, 11 Dec 2013 10:55:59 -0500 Mark Salter <msalter@redhat.com> wrote:
>
> On Wed, 2013-12-11 at 16:40 +0100, Ingo Molnar wrote:
> > * Mark Salter <msalter@redhat.com> wrote:
> >=20
> > > Hi, I have cleanup of fixmap.h here:
> > >=20
> > >  http://lkml.org/lkml/2013/11/25/474
> > >=20
> > > Most of the series has been ack'd with the notable exception
> > > of the arch/x86 part. [...]
> >=20
> > It didn't look controversial to me:
> >=20
> >   Acked-by: Ingo Molnar <mingo@kernel.org>
> >=20
> > > [...] I'd like to get this series into linux-next but I'm not sure=20
> > > of the best way. I could put it in the c6x tree but it doesn't=20
> > > belong there and I don't want to put the x86 patch in there without=20
> > > any acks. I've cc'd Ingo thinking the tip tree may be the place it=20
> > > should go.
> >=20
> > I think akpm is usually collecting such generic arch and kmap patches=20
> > - mind pinging him whether he'd like to take it into -mm?
>=20
> Thanks, will do.

If this is available as a git tree and is pretty stable (i.e. ready for
inclusion by Linus), I could just include that tree into linux-next now
and you could send it to Linus directly when the next merge window opens.

I often have short lived project trees in linux-next.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Thu__12_Dec_2013_07_37_37_+1100_3TbgXfeiZaqMJTeb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJSqM0VAAoJEMDTa8Ir7ZwVB0cP+weLDtIxgdx8hgNtadY23thp
GCfwsESYA1g4KL7PFMwPsuNbQz1fG4BhGpymgclnMddby8Zqvh/Lo6WM44Gg2jFe
gN9d4YW3M5Dqq0Vjtpdowa0fO9RnODnvD8vl39pKJ6ZA8Hm6HXPe2HOCfpztvmVw
VzACd01TU7K1/m5IDJdu29LnAUEWR+xwJL08D30xLx+nCATGEThYLIWG455rMRX9
Qokgmg51EDmLQvV3AsrzPy3Jy6o6l+bAw0ZwrvHxpMNME8TJ0AQF6ZfiRpDTKH0U
rQ5ztgo691QH3UkseAgCz7/eZavk+2qUXHbrht+2DU5B5pJAus6kcjy8FvQ73d4H
YwnpMvYCIQAAb6QzQ+N3GjK3zNdd8e6j62MGVMer1aOnbvnSU2nncK6BNE+PB9ix
pLT4CiYh4q5J3wXpZkzZmxATvfkDCcYd3eXHmV5nDbGCmScLbnUEWR4ClKucJzn0
uYli6Tf4Db2acD5dZ8YnMtyFLlZKqQ1Os/Md8bg0CjSHtUBoHF7XacCA1ELzjDET
We44+B5CN9ZbEnco3bm1t7HknL2+9NXtqDJV5YZEsnmeqdQ/TED8FBt3eBjv33F3
yMiHxYdyNxV//bhFf+8g2+4T0HJLwp3PEnUAXyVW+3JaBIxoku0Hwg5G/Uj7h7uZ
x93SvQLUwTI6gSwOGIb9
=I1qt
-----END PGP SIGNATURE-----

--Signature=_Thu__12_Dec_2013_07_37_37_+1100_3TbgXfeiZaqMJTeb--
