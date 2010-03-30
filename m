From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH 14/17] input: update gfp/slab.h includes
Date: Wed, 31 Mar 2010 00:43:57 +1100
Message-ID: <20100331004357.570fd5f6.sfr@canb.auug.org.au>
References: <1269885165-18617-1-git-send-email-tj@kernel.org>
	<1269885165-18617-15-git-send-email-tj@kernel.org>
	<20100330142148.2ac3fc0e.sfr@canb.auug.org.au>
	<4BB1EBD4.9030707@kernel.org>
	<4BB1FCAF.6080409@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__31_Mar_2010_00_43_57_+1100_rnL+zUVpiL4lSMKy"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41035 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751985Ab0C3NoK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 30 Mar 2010 09:44:10 -0400
In-Reply-To: <4BB1FCAF.6080409@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <htejun@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>

--Signature=_Wed__31_Mar_2010_00_43_57_+1100_rnL+zUVpiL4lSMKy
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

On Tue, 30 Mar 2010 22:29:19 +0900 Tejun Heo <htejun@gmail.com> wrote:
>
> slabh updated such that...
>=20
> * kmemcheck fix patch is placed before the patch to break implicit
>   slab.h inclusion.
>=20
> * sysrq.c now includes slab.h instead of gfp.h.
>=20
> * Updated against the current mainline
>   9623e5a23724d09283c238960946ec6f65733afe.  Conversion script was run
>   again and outputs are compared.  No new dependency appeared since
>   the last round.
>=20
> So, it should now be safe to ignore this patch.

Great, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__31_Mar_2010_00_43_57_+1100_rnL+zUVpiL4lSMKy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuyAB0ACgkQjjKRsyhoI8zWAwCcCO4dCfUkOw1ApDtHqwThd21F
o+wAn2t1xUhPcqaA/T3rKy8c1VSpRayy
=hduo
-----END PGP SIGNATURE-----

--Signature=_Wed__31_Mar_2010_00_43_57_+1100_rnL+zUVpiL4lSMKy--
