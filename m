From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next 20080526 build failure with CONFIG_BLOCK=y and
 CONFIG_PROC_FS is not set
Date: Wed, 28 May 2008 12:34:16 +1000
Message-ID: <20080528123416.c0bf2a0a.sfr@canb.auug.org.au>
References: <1211794094.4408.3.camel@localhost>
	<20080526092224.83555d09.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__28_May_2008_12_34_16_+1000_SDdrSeHSW3TiCoSH"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59342 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751381AbYE1CeX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 27 May 2008 22:34:23 -0400
In-Reply-To: <20080526092224.83555d09.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Philippe Roussel <p.o.roussel@free.fr>, linux-next@vger.kernel.org, Randy Dunlap <randy.dunlap@oracle.com>

--Signature=_Wed__28_May_2008_12_34_16_+1000_SDdrSeHSW3TiCoSH
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, 26 May 2008 09:22:24 -0700 Randy Dunlap <randy.dunlap@oracle.com> w=
rote:
>
> On Mon, 26 May 2008 11:28:14 +0200 Philippe Roussel wrote:
>=20
> > I got this
> >=20
> >   CC      block/genhd.o
> > block/genhd.c: In function 'diskstats_start':
> > block/genhd.c:555: error: 'find_start' undeclared (first use in this
> > function)
> > block/genhd.c:555: error: (Each undeclared identifier is reported only
> > once
> > block/genhd.c:555: error: for each function it appears in.)
> >=20
> > while building the following config
>=20
> I sent a patch for this last Friday:
>   http://lkml.org/lkml/2008/5/23/255

Did you see this?
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__28_May_2008_12_34_16_+1000_SDdrSeHSW3TiCoSH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIPMStTgG2atn1QN8RAszFAJ9/EoTSWTgzoESPZnV8At67HWF9kACfbivb
tOwoWUUDODU8DoBmzVeOGSI=
=kejk
-----END PGP SIGNATURE-----

--Signature=_Wed__28_May_2008_12_34_16_+1000_SDdrSeHSW3TiCoSH--
