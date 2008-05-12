From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure
Date: Mon, 12 May 2008 18:15:57 +1000
Message-ID: <20080512181557.62cc3e36.sfr@canb.auug.org.au>
References: <20080512154717.2d0947f0.sfr@canb.auug.org.au>
	<20080512.005454.31875425.davem@davemloft.net>
	<20080512180903.c512397f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__12_May_2008_18_15_57_+1000_COtXPHWIyOZCJEpm"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55618 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751221AbYELIQM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 May 2008 04:16:12 -0400
In-Reply-To: <20080512180903.c512397f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: greg@kroah.com, linux-next@vger.kernel.org, kay.sievers@vrfy.org

--Signature=_Mon__12_May_2008_18_15_57_+1000_COtXPHWIyOZCJEpm
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Mon, 12 May 2008 18:09:03 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 12 May 2008 00:54:54 -0700 (PDT) David Miller <davem@davemloft.ne=
t> wrote:
> >
> > There is identical code in arch/powerpc/kernel/pci_64.c, it doesn't
> > break the build there becuase powerpc doesn't use -Werror (yet) :-)
>=20
> OK, I will look for your fix and copy it over, thanks.

That should have had a smiley :-)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__12_May_2008_18_15_57_+1000_COtXPHWIyOZCJEpm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIJ/zKTgG2atn1QN8RAr4TAJ9PawFJoW1+zf2y5jND4giWqKsqMgCeOIj9
mm2A9ok6i4CVJsB298U1zVc=
=ABCT
-----END PGP SIGNATURE-----

--Signature=_Mon__12_May_2008_18_15_57_+1000_COtXPHWIyOZCJEpm--
