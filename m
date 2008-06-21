From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of pcmcia tree
Date: Sat, 21 Jun 2008 13:37:32 +1000
Message-ID: <20080621133732.df617d2a.sfr@canb.auug.org.au>
References: <20080616175126.e461b22b.sfr@canb.auug.org.au>
	<20080616081258.GA18142@isilmar.linta.de>
	<20080619143441.3ab03fcf@bike.lwn.net>
	<20080620174321.GA22861@comet.dominikbrodowski.net>
	<20080620135327.2c4e5ce5@bike.lwn.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__21_Jun_2008_13_37_32_+1000_jygFAwF.n8=CCa6_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36485 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753987AbYFUDhi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Jun 2008 23:37:38 -0400
In-Reply-To: <20080620135327.2c4e5ce5@bike.lwn.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>, Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-next@vger.kernel.org

--Signature=_Sat__21_Jun_2008_13_37_32_+1000_jygFAwF.n8=CCa6_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Jun 2008 13:53:27 -0600 Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Fri, 20 Jun 2008 19:43:21 +0200
> Dominik Brodowski <linux@dominikbrodowski.net> wrote:
>=20
> > Well, when do you intend to push that patch? I hope Linus will apply
> > the pcmcia tree soon after 2.6.26 is released.
>=20
> Similar for bkl-removal - it's targeted at 2.6.27.
>=20
> > > Here's the patch; if you take it let me know and I'll remove it from
> > > the bkl-removal tree.
> >=20
> > I've applied it to pcmcia-2.6.git and just pushed that to kernel.org.
>=20
> OK, I'll pull it from bkl-removal.

Thanks, guys - one conflict down (hopefully) :-)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__21_Jun_2008_13_37_32_+1000_jygFAwF.n8=CCa6_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhcd3wACgkQTgG2atn1QN/f1wCggyM3bcphugEv/JIlYoY/GZ/t
udAAn3NN5Krcftr9/gc8RXEQcETxM63j
=W8yd
-----END PGP SIGNATURE-----

--Signature=_Sat__21_Jun_2008_13_37_32_+1000_jygFAwF.n8=CCa6_--
