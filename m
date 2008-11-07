From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: xfs tree build failure
Date: Fri, 7 Nov 2008 16:06:11 +1100
Message-ID: <20081107160611.d6f64fdd.sfr@canb.auug.org.au>
References: <20081030132324.0d619fdd.sfr@canb.auug.org.au>
	<20081030090832.GQ17077@disturbed>
	<20081105132000.4e560cad.sfr@canb.auug.org.au>
	<20081105204754.GO4985@disturbed>
	<20081106152753.GA9161@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__7_Nov_2008_16_06_11_+1100_ehd__sgsmNLIkJDC"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60219 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750745AbYKGFGX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Nov 2008 00:06:23 -0500
In-Reply-To: <20081106152753.GA9161@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Chinner <david@fromorbit.com>
Cc: Christoph Hellwig <hch@infradead.org>, xfs-masters@oss.sgi.com, linux-next@vger.kernel.org, Lachlan McIlroy <lachlan@sgi.com>, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk

--Signature=_Fri__7_Nov_2008_16_06_11_+1100_ehd__sgsmNLIkJDC
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 6 Nov 2008 10:27:53 -0500 Christoph Hellwig <hch@infradead.org> wro=
te:
>
> On Thu, Nov 06, 2008 at 07:47:54AM +1100, Dave Chinner wrote:
> > > > I think it's probably the only solution - we need to wait until
> > > > the I_LOCK bit is cleared from the inode and AFAICT wait_on_inode()
> > > > is the only way to do it.
> > >=20
> > > Any resolution?
> >=20
> > I was waiting on a comment from Christoph. I'll cc him directly this
> > time ;)
>=20
> What comment do you expect from me?  The fix looks correct, but at some
> point you should probably run all these exports past Al to get another
> review.  Especially as he's doing major work in this area currently.

OK, I have dropped the xfs tree for today.  Let me know when it is sorted
out.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__7_Nov_2008_16_06_11_+1100_ehd__sgsmNLIkJDC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkTzMMACgkQjjKRsyhoI8wdDgCgtivkhIXGsx44NuXsHhSerZx+
3pgAoLaKjh23uSdqh0JuDUSrgadB6fHH
=VYG/
-----END PGP SIGNATURE-----

--Signature=_Fri__7_Nov_2008_16_06_11_+1100_ehd__sgsmNLIkJDC--
