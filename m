From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: i2c tree build warning
Date: Thu, 26 Nov 2009 19:50:25 +1100
Message-ID: <20091126195025.d8bf50d2.sfr@canb.auug.org.au>
References: <20091126140600.2f55ab0e.sfr@canb.auug.org.au>
	<20091126091829.74d3b7ce@hyperion.delvare>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__26_Nov_2009_19_50_25_+1100_TJ.nCH47.7+WEr47"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51242 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760042AbZKZIuY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Nov 2009 03:50:24 -0500
In-Reply-To: <20091126091829.74d3b7ce@hyperion.delvare>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wolfram Sang <w.sang@pengutronix.de>

--Signature=_Thu__26_Nov_2009_19_50_25_+1100_TJ.nCH47.7+WEr47
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean,

On Thu, 26 Nov 2009 09:18:29 +0100 Jean Delvare <khali@linux-fr.org> wrote:
>
> Thanks for reporting. The warning did not show on my 32-bit x86 system,
> and I guess it did not show on Wolfram's system either, otherwise we'd
> have fixed it.
>=20
> Does the following patch fix the warning for you?

Yes.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__26_Nov_2009_19_50_25_+1100_TJ.nCH47.7+WEr47
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksOQVEACgkQjjKRsyhoI8xztgCfVq2lsLKNHEsPGsggBV7DRmPL
KncAoJZQFGb/SBYNv+Pfv6E2jfng56zD
=2v90
-----END PGP SIGNATURE-----

--Signature=_Thu__26_Nov_2009_19_50_25_+1100_TJ.nCH47.7+WEr47--
