From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: ubifs tree build failure
Date: Wed, 13 Aug 2008 21:20:54 +1000
Message-ID: <20080813212054.0963ae83.sfr@canb.auug.org.au>
References: <20080812162409.91834486.sfr@canb.auug.org.au>
	<20080812182416.GA14420@lst.de>
	<20080812213933.GA25538@lst.de>
	<48A2B02E.8020601@nokia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__13_Aug_2008_21_20_54_+1000_+ZL.2mxU7K/3odmF"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36994 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752747AbYHMLVD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Aug 2008 07:21:03 -0400
In-Reply-To: <48A2B02E.8020601@nokia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Artem.Bityutskiy@nokia.com
Cc: Christoph Hellwig <hch@lst.de>, linux-next@vger.kernel.org

--Signature=_Wed__13_Aug_2008_21_20_54_+1000_+ZL.2mxU7K/3odmF
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Artem,

On Wed, 13 Aug 2008 12:58:06 +0300 Artem Bityutskiy <Artem.Bityutskiy@nokia=
.com> wrote:
>
> OK, it is probably best if UBIFS NFS support goes via VFS git tree
> just like JFFS2. I'll send a patch to fsdevel later.
>=20
> Thus,  I'll remove NFS support from my tree and the conflict will
> be solved.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__13_Aug_2008_21_20_54_+1000_+ZL.2mxU7K/3odmF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiiw5YACgkQjjKRsyhoI8wPGQCgjdaPubYLaMTGbQvbjzeLtBhS
bDYAn1/Q6VPJegvB+IAxLxx3ALSTTwDj
=CHUm
-----END PGP SIGNATURE-----

--Signature=_Wed__13_Aug_2008_21_20_54_+1000_+ZL.2mxU7K/3odmF--
