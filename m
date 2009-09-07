From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: slab tree build failure
Date: Mon, 7 Sep 2009 18:29:05 +1000
Message-ID: <20090907182905.30c8dffd.sfr@canb.auug.org.au>
References: <20090907153723.0c984c83.sfr@canb.auug.org.au>
	<84144f020909062310u37ecdddfw31c6cc9a22ccabd9@mail.gmail.com>
	<20090907173108.3c0148d7.sfr@canb.auug.org.au>
	<1252309426.4964.3.camel@penberg-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Sep_2009_18_29_05_+1000_mfp==fP+KY5fscA_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58087 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751718AbZIGI3O (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Sep 2009 04:29:14 -0400
In-Reply-To: <1252309426.4964.3.camel@penberg-laptop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Luis R. Rodriguez" <lrodriguez@atheros.com>, "John W. Linville" <linville@tuxdriver.com>, Catalin Marinas <catalin.marinas@arm.com>, npiggin@suse.de

--Signature=_Mon__7_Sep_2009_18_29_05_+1000_mfp==fP+KY5fscA_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Pekka,

On Mon, 07 Sep 2009 10:43:46 +0300 Pekka Enberg <penberg@cs.helsinki.fi> wr=
ote:
>
> Aah, let me guess, CONFIG_SLQB? I guess I'll just rebase the damn tree

That would be my guess.

> and make it non-default. We need that anyway if we want to merge it to
> 2.6.32. I'll take a stab at it later this evening (my time zone).

OK.  This breakage still needs to be fixed in the wireless tree, though.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Sep_2009_18_29_05_+1000_mfp==fP+KY5fscA_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqkxFEACgkQjjKRsyhoI8wH4ACgjCwi+SlqTLKcKEztjW8Dq2x4
4WMAoLPOCom0uFL2lN2rGSVVA9LoGjCK
=8Jo7
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Sep_2009_18_29_05_+1000_mfp==fP+KY5fscA_--
