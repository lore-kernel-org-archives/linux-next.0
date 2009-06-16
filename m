From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Linus/powerpc tree build warning
Date: Tue, 16 Jun 2009 16:24:29 +1000
Message-ID: <20090616162429.07e74e75.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__16_Jun_2009_16_24_29_+1000_Gzb9ylIXEpZRoNmE"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42441 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934719AbZFPGYc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Jun 2009 02:24:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, John Linn <john.linn@xilinx.com>, Grant Likely <grant.likely@secretlab.ca>, Stephen Neuendorffer <stephen.neuendorffer@xilinx.com>, Suneel <suneelg@xilinx.com>, linuxppc-dev@ozlabs.org

--Signature=_Tue__16_Jun_2009_16_24_29_+1000_Gzb9ylIXEpZRoNmE
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ben,

Today's linux-next build (powerpc ppc44x_defconfig) produced this warning:

drivers/video/xilinxfb.c: In function 'xilinxfb_assign':
drivers/video/xilinxfb.c:328: warning: cast to pointer from integer of diff=
erent size

Introduced by commit dac4ccfb64bcdd5b4c248ccc22903d67486573cd ("fbdev:
Add PLB support and cleanup DCR in xilinxfb driver").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__16_Jun_2009_16_24_29_+1000_Gzb9ylIXEpZRoNmE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAko3Op0ACgkQjjKRsyhoI8xNuQCcCiGOrayc+L+RtYU6REBuV+wG
C3YAoL9iKmfOpSROt9JiW9vsKu3CHC25
=9WL2
-----END PGP SIGNATURE-----

--Signature=_Tue__16_Jun_2009_16_24_29_+1000_Gzb9ylIXEpZRoNmE--
