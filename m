From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the arm tree
Date: Wed, 27 Aug 2008 09:43:49 +1000
Message-ID: <20080827094349.2f3faf89.sfr@canb.auug.org.au>
References: <20080825110348.9f5485ec.sfr@canb.auug.org.au>
	<20080826222044.GA17277@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__27_Aug_2008_09_43_49_+1000_oTUynl_4netENCXn"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50503 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750945AbYHZXoS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Aug 2008 19:44:18 -0400
In-Reply-To: <20080826222044.GA17277@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, Ian Molton <spyro@f2s.com>

--Signature=_Wed__27_Aug_2008_09_43_49_+1000_oTUynl_4netENCXn
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Tue, 26 Aug 2008 23:20:44 +0100 Russell King <rmk@arm.linux.org.uk> wrot=
e:
>
> On Mon, Aug 25, 2008 at 11:03:48AM +1000, Stephen Rothwell wrote:
> > Today's linux-next merge of the arm tree got a conflict in
> > arch/arm/mach-pxa/include/mach/irqs.h between commit
> > dec5abe9219aebf6d65e9af95de1c031d7039bdb ("[ARM] Fix eseries IRQ limit")
> > from Linus' tree and commit 44b6deaa10e0b62fc6d6db0b673f8bfa61b745d1
> > ("[ARM] pxa: introduce PXA_HAVE_BOARD_IRQS") from the arm tree.
>=20
> I think you're seeing that because of my devel branch having multiple
> common ancestors.  I've rebased most of the work in there so it doesn't
> suffer from that problem, and it should resolve your problem.

Ok, thanks for that.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__27_Aug_2008_09_43_49_+1000_oTUynl_4netENCXn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki0lTUACgkQjjKRsyhoI8zX4gCgnmhTlBAVuGU3b6d/3y6XHPNY
AL4An3cLcCUcRzqfotaHjcrlT6m5G8vY
=3IeW
-----END PGP SIGNATURE-----

--Signature=_Wed__27_Aug_2008_09_43_49_+1000_oTUynl_4netENCXn--
