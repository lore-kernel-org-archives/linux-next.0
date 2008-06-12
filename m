From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: mtd/avr32 merge conflict
Date: Fri, 13 Jun 2008 09:46:21 +1000
Message-ID: <20080613094621.d302febc.sfr@canb.auug.org.au>
References: <20080612145538.0835c0b8.sfr@canb.auug.org.au>
	<20080612222403.18755932@siona.local>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__13_Jun_2008_09_46_21_+1000_/+8=Bd=h71z_wACh"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58754 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757028AbYFLXqa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Jun 2008 19:46:30 -0400
In-Reply-To: <20080612222403.18755932@siona.local>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-next@vger.kernel.org, Hans-Christian Egtvedt <hcegtvedt@atmel.com>

--Signature=_Fri__13_Jun_2008_09_46_21_+1000_/+8=Bd=h71z_wACh
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Haavard,

On Thu, 12 Jun 2008 22:24:03 +0200 Haavard Skinnemoen <haavard.skinnemoen@a=
tmel.com> wrote:
>
> On Thu, 12 Jun 2008 14:55:38 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > Hi David,
> >=20
> > Today's linux-next merge of the mtd tree got a trivial conflict in
> > include/asm-avr32/arch-at32ap/board.h between commit
> > f01fb51fc0e2b77c8bbf4d41adfd74c367173b02 ("avr32: Add PSIF platform
> > devices") from the avr32 tree and commit
> > 62090a08aba579e6c69319fac4d4a1f806f26400 ("[MTD] [NAND] avr32: atmel_na=
nd
> > platform code for AT32AP700x") from the mtd tree.
> >=20
> > It was just a case of overlapping additions.
>=20
> I moved the at32_add_device_psif() prototype a bit up. I think that
> took care of the conflict.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__13_Jun_2008_09_46_21_+1000_/+8=Bd=h71z_wACh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhRtU0ACgkQTgG2atn1QN/OAwCgkozpgTGnBw5aq+04hOWQOF+w
gyMAoJJdVFmXFbvQrtXV6/n+yGiWQYmf
=TqKs
-----END PGP SIGNATURE-----

--Signature=_Fri__13_Jun_2008_09_46_21_+1000_/+8=Bd=h71z_wACh--
