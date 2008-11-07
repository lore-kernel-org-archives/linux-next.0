From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: arm build failure
Date: Fri, 7 Nov 2008 13:11:28 +1100
Message-ID: <20081107131128.1cf9feb2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__7_Nov_2008_13_11_28_+1100_AturZOem=n5iu1KD"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55315 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750757AbYKGCLk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 6 Nov 2008 21:11:40 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__7_Nov_2008_13_11_28_+1100_AturZOem=n5iu1KD
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

An arm rpc_defconfig build of next-20081106 produced these errors:

arch/arm/mm/copypage-v3.c:37: error: 'from' undeclared (first use in this f=
unction)
arch/arm/mm/copypage-v3.c:37: error: 'to' undeclared (first use in this fun=
ction)

Caused by commit dbe92c825b7b9be950135da97f6f293caaeaa083 ("[ARM]
copypage: convert assembly files to C").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__7_Nov_2008_13_11_28_+1100_AturZOem=n5iu1KD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkTo9AACgkQjjKRsyhoI8x2oQCeOdST8oLBefbOZLkXfBMecXnc
P50Anjl5kA8ak2HAuLxwDBhuYYaqmn5E
=SJcu
-----END PGP SIGNATURE-----

--Signature=_Fri__7_Nov_2008_13_11_28_+1100_AturZOem=n5iu1KD--
