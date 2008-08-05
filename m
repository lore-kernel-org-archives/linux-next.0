From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: mfd tree build failure
Date: Wed, 6 Aug 2008 02:05:40 +1000
Message-ID: <20080806020540.c22b1fa0.sfr@canb.auug.org.au>
References: <20080806000856.a5609577.sfr@canb.auug.org.au>
	<1217950794.18866.32.camel@wirenth>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__6_Aug_2008_02_05_40_+1000_u2MEiaundiWwzvrL"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37151 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760335AbYHEQFq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Aug 2008 12:05:46 -0400
In-Reply-To: <1217950794.18866.32.camel@wirenth>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ian <spyro@f2s.com>
Cc: Samuel Ortiz <sameo@openedhand.com>, linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

--Signature=_Wed__6_Aug_2008_02_05_40_+1000_u2MEiaundiWwzvrL
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ian,

On Tue, 05 Aug 2008 16:39:54 +0100 ian <spyro@f2s.com> wrote:
>
> I'd have expected the other TMIO drivers to fail too.
>=20
> get_irq_data is defined in linux/irq.h only if=20
>=20
> CONFIG_GENERIC_HARDIRQs is set and you arent on S390 (so why doesnt S390
> fail?)
>=20
> I dont see this as a big problem. As far as Im concerned, all the TMIO
> drivers can depend on CONFIG_ARM.
>=20
> It may not be a bad idea to add CONFIG_MFD_TMIO_SUBDEVICE so that TMIO
> sub device drivers can only be selected when TMIO cores are selected.
> This would neatly fix the earlier problem, rather than making al lthe
> subdevices CONFIG_ARM.

It'd be real nice if someone did a patch to that effect :-)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__6_Aug_2008_02_05_40_+1000_u2MEiaundiWwzvrL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiYelQACgkQjjKRsyhoI8ye5ACfXB94Ghb5Z9GkH51Us1CVJJsr
MacAoKs59oF5um53lE0VZUddBGI9pkL/
=0KyT
-----END PGP SIGNATURE-----

--Signature=_Wed__6_Aug_2008_02_05_40_+1000_u2MEiaundiWwzvrL--
