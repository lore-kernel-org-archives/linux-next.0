From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: pci tree build failure
Date: Tue, 5 Jan 2010 14:41:50 +1100
Message-ID: <20100105144150.434f9626.sfr@canb.auug.org.au>
References: <20100105095543.8c446cb7.sfr@canb.auug.org.au>
	<20100104231001.GF9882@parisc-linux.org>
	<20100104154843.294c06ff@jbarnes-piketon>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__5_Jan_2010_14_41_50_+1100_ScczRLF1yUMHtSHh"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37279 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754154Ab0AEDlz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 4 Jan 2010 22:41:55 -0500
In-Reply-To: <20100104154843.294c06ff@jbarnes-piketon>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: Matthew Wilcox <matthew@wil.cx>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__5_Jan_2010_14_41_50_+1100_ScczRLF1yUMHtSHh
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

On Mon, 4 Jan 2010 15:48:43 -0800 Jesse Barnes <jbarnes@virtuousgeek.org> w=
rote:
>
> > Doh, sorry.  I don't have a handy powerpc environment around to test
> > with. Can you try just deleting line 433?  (this should actually be
> > the correct fix).
>=20
> I just pushed that into my linux-next tree.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__5_Jan_2010_14_41_50_+1100_ScczRLF1yUMHtSHh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktCtP4ACgkQjjKRsyhoI8zFjgCePkEyFSIv+zX0Qmvpzj7q21SE
dswAn1S8OrMUwuU+TMMTwgUdqrqoBPLo
=8GcF
-----END PGP SIGNATURE-----

--Signature=_Tue__5_Jan_2010_14_41_50_+1100_ScczRLF1yUMHtSHh--
