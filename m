From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: dev_name, dev_set_name conversions
Date: Thu, 3 Jul 2008 15:07:11 +1000
Message-ID: <20080703150711.bcbb7a77.sfr@canb.auug.org.au>
References: <20080626160328.8ec34a28.sfr@canb.auug.org.au>
	<20080702155214.GB29583@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__3_Jul_2008_15_07_11_+1000_ANlaq9b4Iavm5u4V"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41691 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754836AbYGCFji (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Jul 2008 01:39:38 -0400
In-Reply-To: <20080702155214.GB29583@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Kay Sievers <kay.sievers@vrfy.org>, Cornelia Huck <cornelia.huck@de.ibm.com>, linux-next@vger.kernel.org

--Signature=_Thu__3_Jul_2008_15_07_11_+1000_ANlaq9b4Iavm5u4V
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Wed, 2 Jul 2008 08:52:14 -0700 Greg KH <greg@kroah.com> wrote:
>
> On Thu, Jun 26, 2008 at 04:03:28PM +1000, Stephen Rothwell wrote:
> >=20
> > Given that simple implementations of dev_name and dev_set_name now exist
> > in Linus' tree, is there any reason that these conversion patches cannot
> > go via the respective subsystem trees?  This would reduce the number of
> > conflicts in the linux-next tree (and presumably in the next merge wind=
ow
> > for Linus).
> >=20
> > Even if they were in both your tree and the subsystem trees, I think the
> > conflicts would be less.
>=20
> I agree, I've just now sent all of the ones that I had left in my tree
> to the respective subsystem maintainers.

Excellent, I look forward to lots of nice merges from now on. :-)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__3_Jul_2008_15_07_11_+1000_ANlaq9b4Iavm5u4V
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhsXn8ACgkQjjKRsyhoI8xe8QCgvZCH1ePMUgNSvUSG1v5l6aBf
2L4AoK20Im12yOWWpUWpsfg4/ZlNqPyh
=vtMC
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Jul_2008_15_07_11_+1000_ANlaq9b4Iavm5u4V--
