From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sparc tree build failure
Date: Sat, 7 Nov 2009 13:35:56 +1100
Message-ID: <20091107133556.3731592c.sfr@canb.auug.org.au>
References: <20091106180248.7a6aa9ba.sfr@canb.auug.org.au>
	<20091106.001930.121210402.davem@davemloft.net>
	<20091106.002651.21006753.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__7_Nov_2009_13_35_56_+1100_aNRvTbHYo9ssllKm"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44922 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750883AbZKGCf4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Nov 2009 21:35:56 -0500
In-Reply-To: <20091106.002651.21006753.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, kristoffer@gaisler.com

--Signature=_Sat__7_Nov_2009_13_35_56_+1100_aNRvTbHYo9ssllKm
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Fri, 06 Nov 2009 00:26:51 -0800 (PST) David Miller <davem@davemloft.net>=
 wrote:
>
> Stephen, can you let me know if this takes care of everything?

Sorry, sleep intervened :-)

That patch fixes the build of the .o (I didn't do the link).

Thanks.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__7_Nov_2009_13_35_56_+1100_aNRvTbHYo9ssllKm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkr03QwACgkQjjKRsyhoI8ztXQCfT6FcNMmQUhKxqAEEO6A9OVa1
Cs8An0Vt6FrRET4V5jCKkyrlaruW7QFC
=MM69
-----END PGP SIGNATURE-----

--Signature=_Sat__7_Nov_2009_13_35_56_+1100_aNRvTbHYo9ssllKm--
