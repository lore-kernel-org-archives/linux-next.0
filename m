From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: arm build failure
Date: Tue, 17 Jun 2008 14:52:33 +1000
Message-ID: <20080617145233.224e3b0a.sfr@canb.auug.org.au>
References: <20080616160747.27909f11.sfr@canb.auug.org.au>
	<20080616215237.GA9755@doriath.ww600.siemens.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__17_Jun_2008_14_52_33_+1000_tiNUuEZXDpGgu=g0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47494 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751353AbYFQEwl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Jun 2008 00:52:41 -0400
In-Reply-To: <20080616215237.GA9755@doriath.ww600.siemens.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: Russell King <rmk@arm.linux.org.uk>, linux-next@vger.kernel.org

--Signature=_Tue__17_Jun_2008_14_52_33_+1000_tiNUuEZXDpGgu=g0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Tue, 17 Jun 2008 01:52:37 +0400 Dmitry Baryshkov <dbaryshkov@gmail.com> =
wrote:
>
> Yup. I forgot that not all platforms do have gpiolib. Please use the
> following patch.

Thanks, I will apply it to today's build.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__17_Jun_2008_14_52_33_+1000_tiNUuEZXDpGgu=g0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhXQxEACgkQTgG2atn1QN8d8QCfcGPLRcGHyewJ5hUG+rZzmLbK
kcoAnjDbBse6f/cENHvDzbnb5MIwDOoD
=p+IY
-----END PGP SIGNATURE-----

--Signature=_Tue__17_Jun_2008_14_52_33_+1000_tiNUuEZXDpGgu=g0--
