From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: wireless tree build failure
Date: Mon, 23 Mar 2009 16:48:18 +1100
Message-ID: <20090323164818.7a02178f.sfr@canb.auug.org.au>
References: <20090323153954.95094b80.sfr@canb.auug.org.au>
	<20090322.215541.205935147.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__23_Mar_2009_16_48_18_+1100_11+7dKlQsQ/Wx0nP"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38399 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750983AbZCWFs1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Mar 2009 01:48:27 -0400
In-Reply-To: <20090322.215541.205935147.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, yanghy@cn.fujitsu.com

--Signature=_Mon__23_Mar_2009_16_48_18_+1100_11+7dKlQsQ/Wx0nP
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Sun, 22 Mar 2009 21:55:41 -0700 (PDT) David Miller <davem@davemloft.net>=
 wrote:
>
> Stephen does this fix the build for you?

It fixes that build failure, yes (I just built that one file before and
after applying your patch).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__23_Mar_2009_16_48_18_+1100_11+7dKlQsQ/Wx0nP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknHIqIACgkQjjKRsyhoI8zz7gCfRb+wQozDDg7c0be1bNATYqVX
+JQAnixQI0sO+1tpECWaG9jewksu3AcH
=EVxf
-----END PGP SIGNATURE-----

--Signature=_Mon__23_Mar_2009_16_48_18_+1100_11+7dKlQsQ/Wx0nP--
