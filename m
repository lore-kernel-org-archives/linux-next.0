From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: frimware build failure
Date: Thu, 5 Jun 2008 17:59:41 +1000
Message-ID: <20080605175941.5520add5.sfr@canb.auug.org.au>
References: <20080605172512.e000ddc5.sfr@canb.auug.org.au>
	<1212652090.32207.159.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__5_Jun_2008_17_59_41_+1000__cKbrwlBX0=AxLJe"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35857 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751756AbYFEH7u (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Jun 2008 03:59:50 -0400
In-Reply-To: <1212652090.32207.159.camel@pmac.infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Russell King <rmk@arm.linux.org.uk>, linux-next@vger.kernel.org

--Signature=_Thu__5_Jun_2008_17_59_41_+1000__cKbrwlBX0=AxLJe
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, 05 Jun 2008 08:48:10 +0100 David Woodhouse <dwmw2@infradead.org> wr=
ote:
>
> I did it like this so I could keep it in 80 columns:

Looks just as good.

I am a little worried that this may be broken the same way on other
platforms ...  The gas manual said something like "On platforms where @
is the comment character (like ARM) another character is used instead.
For example, the ARM port uses the % character."

A grep through the kernel sources shows only @ except on arm, so it
should be ok.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__5_Jun_2008_17_59_41_+1000__cKbrwlBX0=AxLJe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhHnO0ACgkQTgG2atn1QN+zVQCeJPXIdNGEfKJkKljq323SVYl/
ua4An1lHIvbGtWs9ZYyvxSvukNB6fbJj
=P5Og
-----END PGP SIGNATURE-----

--Signature=_Thu__5_Jun_2008_17_59_41_+1000__cKbrwlBX0=AxLJe--
