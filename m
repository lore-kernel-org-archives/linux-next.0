From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: net tree build failure
Date: Mon, 24 Nov 2008 16:22:29 +1100
Message-ID: <20081124162229.f0a10414.sfr@canb.auug.org.au>
References: <20081124152550.6a06efa4.sfr@canb.auug.org.au>
	<20081123.202847.85900696.davem@davemloft.net>
	<20081124154938.bac22cd5.sfr@canb.auug.org.au>
	<20081123.210452.160784844.davem@davemloft.net>
	<20081124162044.f3333fcf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__24_Nov_2008_16_22_29_+1100_8eIpHWCu4QdMivrG"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33339 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750701AbYKXFWp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 00:22:45 -0500
In-Reply-To: <20081124162044.f3333fcf.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, shemminger@vyatta.com, Sam Ravnborg <sam@ravnborg.org>

--Signature=_Mon__24_Nov_2008_16_22_29_+1100_8eIpHWCu4QdMivrG
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Mon, 24 Nov 2008 16:20:44 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Yeah, and including it does turn CONFIG_PCMCIA on. But I am genuinely
> curious as there is a CONFIG_PCMCIA entry (with a really ancient comment)
> in arch/sparc64/Kconfig, so why is that not sufficient to get
> CONFIG_PCMCIA turned on?  There is clearly something lacking in my
> understanding ...

(Light dawns) I guess it is the lack of a prompt ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__24_Nov_2008_16_22_29_+1100_8eIpHWCu4QdMivrG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkqOhUACgkQjjKRsyhoI8yyIQCfU3F7ZgxFaFtIxRg9yCiMeHF3
ZrIAoKaLl38cdtjRqN4AcHfrQqjFLgll
=5WO0
-----END PGP SIGNATURE-----

--Signature=_Mon__24_Nov_2008_16_22_29_+1100_8eIpHWCu4QdMivrG--
