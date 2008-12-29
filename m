From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [xfs-masters] linux-next: xfs tree build warnings
Date: Mon, 29 Dec 2008 19:51:24 +1100
Message-ID: <20081229195124.59bfbc75.sfr@canb.auug.org.au>
References: <20081229192649.7099188b.sfr@canb.auug.org.au>
	<20081229083650.GA14699@lst.de>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__29_Dec_2008_19_51_24_+1100_fqe=PaTARA/HMEWp"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55012 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752689AbYL2Ivc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 03:51:32 -0500
In-Reply-To: <20081229083650.GA14699@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: David Chinner <david@fromorbit.com>, xfs-masters@oss.sgi.com, linux-next@vger.kernel.org

--Signature=_Mon__29_Dec_2008_19_51_24_+1100_fqe=PaTARA/HMEWp
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Mon, 29 Dec 2008 09:36:50 +0100 Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Dec 29, 2008 at 07:26:49PM +1100, Stephen Rothwell wrote:
> > Hi David,
> >=20
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>=20
> Yeah, just noticed when doing my first ppc64 build after a while.  For
> now I threw a patch in to always make xfs_ino and unsigned long long
> and it works so far.  I'll make sure this or another fix goes in through
> the usual ways.

Thanks.  We do seem to be actually getting somewhere towards making u64
unsigned long long everywhere ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__29_Dec_2008_19_51_24_+1100_fqe=PaTARA/HMEWp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklYj4wACgkQjjKRsyhoI8yv+gCeJh3U/UqnKM6qg0ipIfdtb+P0
LZQAn0dg7sUG8BB8GTDih0euGTzF4xIP
=B6w6
-----END PGP SIGNATURE-----

--Signature=_Mon__29_Dec_2008_19_51_24_+1100_fqe=PaTARA/HMEWp--
