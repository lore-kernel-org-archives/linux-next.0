From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sparc/firmware build failure
Date: Thu, 6 Nov 2008 13:44:44 +1100
Message-ID: <20081106134444.c6b6ca5f.sfr@canb.auug.org.au>
References: <20080901191019.5df57434.sfr@canb.auug.org.au>
	<20081028214559.c6715cc0.sfr@canb.auug.org.au>
	<1225194154.18031.185.camel@macbook.infradead.org>
	<20081103145542.498447c6.sfr@canb.auug.org.au>
	<20081105170256.5fef7e93.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__6_Nov_2008_13_44_44_+1100_0gu/io2cxPkFxQ09"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45049 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751870AbYKFCpC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 5 Nov 2008 21:45:02 -0500
In-Reply-To: <20081105170256.5fef7e93.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Jaswinder Singh <jaswinder@infradead.org>, David Miller <davem@davemloft.net>

--Signature=_Thu__6_Nov_2008_13_44_44_+1100_0gu/io2cxPkFxQ09
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Wed, 5 Nov 2008 17:02:56 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> I have reverted commit 229d9a03273684dc2175821be4104dbaa52f3ce0
> ("qlogicpti: use request_firmware") because the above build fix has not
> been applied.

And today I have dropped the firmware tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__6_Nov_2008_13_44_44_+1100_0gu/io2cxPkFxQ09
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkSWhwACgkQjjKRsyhoI8wmqQCeNHbcI6fTDzThGWuz/5WDvfNK
eB4AmgOS9gEAcD4AcYUVX5HsyXQ8IuwT
=4K1w
-----END PGP SIGNATURE-----

--Signature=_Thu__6_Nov_2008_13_44_44_+1100_0gu/io2cxPkFxQ09--
