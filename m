From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the sparseirq tree
Date: Tue, 26 Aug 2008 09:48:16 +1000
Message-ID: <20080826094816.4920906c.sfr@canb.auug.org.au>
References: <20080825193243.fdf24fcc.sfr@canb.auug.org.au>
	<48B309F7.20606@goop.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__26_Aug_2008_09_48_16_+1000_HJ3chZI7y9tFWyCb"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56202 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753066AbYHYXs1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 19:48:27 -0400
In-Reply-To: <48B309F7.20606@goop.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, Yinghai Lu <yhlu.kernel@gmail.com>

--Signature=_Tue__26_Aug_2008_09_48_16_+1000_HJ3chZI7y9tFWyCb
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jeremy,

On Mon, 25 Aug 2008 12:37:27 -0700 Jeremy Fitzhardinge <jeremy@goop.org> wr=
ote:
>
> This is a diff-diff?  The change:

Its from "git diff" of the merge itself (which implies the -cc option of
git diff).

>=20
> - 	kstat_this_cpu.irqs[irq]++;
>  -	/* block until irq becomes pending */
>  -	xen_poll_irq(irq);
> + 	kstat_irqs_this_cpu(irq_to_desc(irq))++;
>=20
>=20
> looks fine.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__26_Aug_2008_09_48_16_+1000_HJ3chZI7y9tFWyCb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkizRMAACgkQjjKRsyhoI8yF8QCeOtyMqSUs5kKgol7FFCfnRbHN
IVIAn19w/N6yhXGnB4FoOedsg00HK+do
=EnP8
-----END PGP SIGNATURE-----

--Signature=_Tue__26_Aug_2008_09_48_16_+1000_HJ3chZI7y9tFWyCb--
