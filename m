From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of pcmcia tree
Date: Mon, 16 Jun 2008 18:49:43 +1000
Message-ID: <20080616184943.e369cf84.sfr@canb.auug.org.au>
References: <20080616175126.e461b22b.sfr@canb.auug.org.au>
	<20080616081258.GA18142@isilmar.linta.de>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__16_Jun_2008_18_49_43_+1000_YgwjKkKD2qMlH5m6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40788 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752514AbYFPItu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Jun 2008 04:49:50 -0400
In-Reply-To: <20080616081258.GA18142@isilmar.linta.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Jonathan Corbet <corbet@lwn.net>, linux-next@vger.kernel.org

--Signature=_Mon__16_Jun_2008_18_49_43_+1000_YgwjKkKD2qMlH5m6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dominik,

On Mon, 16 Jun 2008 10:12:58 +0200 Dominik Brodowski <linux@dominikbrodowsk=
i.net> wrote:
>
> On Mon, Jun 16, 2008 at 05:51:26PM +1000, Stephen Rothwell wrote:
> > Today's linux-next merge of the pcmcia tree got a conflict in
> > drivers/char/pcmcia/cm4000_cs.c between commit
> > d30f1f9e1f5391a649a4e2ad442c0b76f4e44c32 ("cm40x0: cdev lock_kernel()
> > pushdown") from the bkl-removal tree and commit
> > 5316046340ca74e0d327a88aa719fa0b2481a7ff ("pcmcia: switch cm4000_cs.c to
> > unlocked_ioctl") from the pcmcia tree.
> >=20
> > It was just overlapping replacement of includes, so I did the obvious
> > fixup.
>=20
> @Stephen: many thanks!
>=20
> @Alan,@Jonathan: since this is the same patch, just a different title --
> shall it be removed from one of our trees?

Those patches are not identical ... the first does _open, the second does
_ioctl.  The only overlap in the includes at the top.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__16_Jun_2008_18_49_43_+1000_YgwjKkKD2qMlH5m6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhWKScACgkQTgG2atn1QN8NrgCeJwJucEmJJ+mH76aLYlNO122M
XpMAn0LBB0B5GHNgEp8LDB7ri5PkTGjh
=NF3w
-----END PGP SIGNATURE-----

--Signature=_Mon__16_Jun_2008_18_49_43_+1000_YgwjKkKD2qMlH5m6--
