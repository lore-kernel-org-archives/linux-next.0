From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: wireless tree build failure
Date: Mon, 15 Jun 2009 22:21:07 +1000
Message-ID: <20090615222107.0b836111.sfr@canb.auug.org.au>
References: <20090422115738.524272c8.sfr@canb.auug.org.au>
	<1240390746.17388.64.camel@johannes.local>
	<20090422230333.e1f7d3db.sfr@canb.auug.org.au>
	<20090422130612.GB3288@tuxdriver.com>
	<1240407191.21978.17.camel@johannes.local>
	<20090422133601.GA25039@srcf.ucam.org>
	<20090603125202.d507e59f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__15_Jun_2009_22_21_07_+1000_k.6nL/NRgG5K10pt"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34140 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752077AbZFOMVO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Jun 2009 08:21:14 -0400
In-Reply-To: <20090603125202.d507e59f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, "David S. Miller" <davem@davemloft.net>

--Signature=_Mon__15_Jun_2009_22_21_07_+1000_k.6nL/NRgG5K10pt
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

On Wed, 3 Jun 2009 12:52:02 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Wed, 22 Apr 2009 14:36:01 +0100 Matthew Garrett <mjg59@srcf.ucam.org> =
wrote:
> >
> > On Wed, Apr 22, 2009 at 03:33:11PM +0200, Johannes Berg wrote:
> > > But that's not the interesting part -- the thing is the rfkill rewrit=
e.
> > > I don't know how to handle that w/o breaking all users. I had hoped to
> > > finish this very soon to be ready early in .31, but I'm still waiting
> > > for Thinkpad and Toshiba conversions (and I forgot who wanted to look=
 at
> > > Toshiba), but if new users are being added in other trees then that's=
 a
> > > problem.
> >=20
> > oqo-wmi can be ignored for the moment - Len, can you drop it from your=
=20
> > tree for now? I'll clean that bit up as well.
>=20
> So the rfkill rewrite has now hit the wireless tree, so today's build
> (x86_64_allmodconfig) failure looks like this:

So I have been dropping the oqo-wmi driver since April 22 ... Dave has
now sent the pull request to Linus for the net tree (which contains the
wireless tree) so after Linus merges it, the acpi tree will be broken
when merged with Linus' tree.  Can this be fixed, please?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__15_Jun_2009_22_21_07_+1000_k.6nL/NRgG5K10pt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAko2PLMACgkQjjKRsyhoI8xTYACdFoDfN+X2c9PirwRld+CgIe/M
VaUAn17+kzJLT/gFJqCyv0Ezac3cpdqh
=aUV0
-----END PGP SIGNATURE-----

--Signature=_Mon__15_Jun_2009_22_21_07_+1000_k.6nL/NRgG5K10pt--
