From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: pcmcia tree build failure
Date: Sat, 23 Aug 2008 14:30:54 +1000
Message-ID: <20080823143054.43c7748c.sfr@canb.auug.org.au>
References: <20080822145231.d95b789b.sfr@canb.auug.org.au>
	<20080823004001.GA15344@isilmar.linta.de>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__23_Aug_2008_14_30_54_+1000_yfB4CnnGhxBtj0zW"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43033 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750751AbYHWEbD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 23 Aug 2008 00:31:03 -0400
In-Reply-To: <20080823004001.GA15344@isilmar.linta.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-next@vger.kernel.org

--Signature=_Sat__23_Aug_2008_14_30_54_+1000_yfB4CnnGhxBtj0zW
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dominik,

On Sat, 23 Aug 2008 02:40:01 +0200 Dominik Brodowski <linux@dominikbrodowsk=
i.net> wrote:
>
> On Fri, Aug 22, 2008 at 02:52:31PM +1000, Stephen Rothwell wrote:
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> >=20
> > ERROR: "cs_debug_level" [drivers/pcmcia/pcmcia_core.ko] undefined!
> >=20
> > Caused by commit e84d3a8fd37981178933e706432fa9f763f8ba6a ("pcmcia: fix
> > CONFIG_DEBUG and dev_debug in pcmcia_core.o") ?
>=20
> ooops
>=20
> > I added the following patch.
> Thanks. Squashed into the (much cleaned up) pcmcia git tree.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__23_Aug_2008_14_30_54_+1000_yfB4CnnGhxBtj0zW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkivkn4ACgkQjjKRsyhoI8xVxQCgl9qPRO73M11Ct3ApdnejAd9J
Ht4AnRDFQX808KY8f61FGHYEY8sbSW0G
=Sf8D
-----END PGP SIGNATURE-----

--Signature=_Sat__23_Aug_2008_14_30_54_+1000_yfB4CnnGhxBtj0zW--
