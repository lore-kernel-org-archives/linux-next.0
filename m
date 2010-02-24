From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: IBFT and SWIOTLB tree.
Date: Wed, 24 Feb 2010 19:39:31 +1100
Message-ID: <20100224193931.89bb7e87.sfr@canb.auug.org.au>
References: <20100223160034.GC28966@phenom.dumpdata.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__24_Feb_2010_19_39_31_+1100_7Y2qgiEYrZQ4lQi0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34540 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753400Ab0BXIjh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 24 Feb 2010 03:39:37 -0500
In-Reply-To: <20100223160034.GC28966@phenom.dumpdata.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__24_Feb_2010_19_39_31_+1100_7Y2qgiEYrZQ4lQi0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Konrad,

On Tue, 23 Feb 2010 11:00:34 -0500 Konrad Rzeszutek Wilk <konrad.wilk@oracl=
e.com> wrote:
>
> I was wondering if it would be possible to include these two trees in
> the automatic merge/build process:

I would need a bit a background for these trees since you are not listed
as a maintainer in the MAINTAINERS file.

> git://git.kernel.org/pub/scm/linux/kernel/git/konrad/ibft-2.6.git
>=20
> and
> git://git.kernel.org/pub/scm/linux/kernel/git/konrad/swiotlb-2.6.git

The master branch of both these trees is empty relative to Linus' tree ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__24_Feb_2010_19_39_31_+1100_7Y2qgiEYrZQ4lQi0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuE5cMACgkQjjKRsyhoI8y3HgCfWvV/1XXfU+AgGHz8hkMs1eqv
FcQAoJX2rr66YY1Cws4yQ6a6IqBcoo7G
=KAYT
-----END PGP SIGNATURE-----

--Signature=_Wed__24_Feb_2010_19_39_31_+1100_7Y2qgiEYrZQ4lQi0--
