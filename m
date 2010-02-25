From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: fetch of tmio-mmc tree failed
Date: Fri, 26 Feb 2010 10:55:12 +1100
Message-ID: <20100226105512.d6c3b818.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__26_Feb_2010_10_55_12_+1100_LA/nMbsCpHLAJ5d4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58593 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754171Ab0BYXzU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 25 Feb 2010 18:55:20 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ian Molton <ian@mnementh.co.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__26_Feb_2010_10_55_12_+1100_LA/nMbsCpHLAJ5d4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ian,

Today's linux-next fetch of the tmio-mmc tree failed like this:

git.mnementh.co.uk[0: 173.45.232.4]: errno=3DConnection refused

I will use the version of the tree from next-20100225 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__26_Feb_2010_10_55_12_+1100_LA/nMbsCpHLAJ5d4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuHDeAACgkQjjKRsyhoI8z7RwCglGCdCUY5Ny8b9D+Q9DDEAX3/
HwIAn1SeikBwrOujuUoYibpoQbqX7zPi
=OpeM
-----END PGP SIGNATURE-----

--Signature=_Fri__26_Feb_2010_10_55_12_+1100_LA/nMbsCpHLAJ5d4--
