From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: spi tree build failure
Date: Thu, 21 Jan 2010 14:57:57 +1100
Message-ID: <20100121145757.f9d76da7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__21_Jan_2010_14_57_57_+1100_6RHufuf9dxMnQ=/A"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42261 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751418Ab0AUD6G (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Jan 2010 22:58:06 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Feng Tang <feng.tang@intel.com>

--Signature=_Thu__21_Jan_2010_14_57_57_+1100_6RHufuf9dxMnQ=/A
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

Today's linux-next build (x86_64 allmodconfig) failed like this:

ERROR: "dw_spi_remove_host" [drivers/spi/dw_spi_pci.ko] undefined!

Caused by commit 51f921c1eb1124fb99ab0728c19e8e14c82c81be ("spi/dw_spi:
add a missed dw_spi_remove_host() in exit sequence").

I have used the spi tree from next-20100120 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__21_Jan_2010_14_57_57_+1100_6RHufuf9dxMnQ=/A
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktX0MUACgkQjjKRsyhoI8z/ZACdGnmnTORybG6JzE71mma0LACv
ijUAn16U3jLC80P8024VofQNlze6pSWN
=JF3c
-----END PGP SIGNATURE-----

--Signature=_Thu__21_Jan_2010_14_57_57_+1100_6RHufuf9dxMnQ=/A--
