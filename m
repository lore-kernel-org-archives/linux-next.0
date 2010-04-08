From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the irda tree with Linus' tree
Date: Thu, 8 Apr 2010 13:59:03 +1000
Message-ID: <20100408135903.546d3cfe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__8_Apr_2010_13_59_03_+1000_Sho1+z3yLFLItvRX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45948 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755945Ab0DHD7J (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 7 Apr 2010 23:59:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Samuel Ortiz <samuel@sortiz.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Roel Kluin <roel.kluin@gmail.com>

--Signature=_Thu__8_Apr_2010_13_59_03_+1000_Sho1+z3yLFLItvRX
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

Today's linux-next merge of the irda tree got a conflict in
drivers/net/irda/irda-usb.c between commit
8e95a2026f3b43f7c3d676adaccd2de9532e8dcc ("drivers/net: Move && and || to
end of previous line") from Linus' tree and commit
1d71d682e1e4c6639f6c28042a1a2bc73c5e0554 ("irda: test index before read
in stir421x_patch_device()") from the irda tree.

I used the version from the irda tree.  (I have no idea why this conflict
has just appeared given that those two commits have been in linux-next
since September and December, 2009.)
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__8_Apr_2010_13_59_03_+1000_Sho1+z3yLFLItvRX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAku9VIcACgkQjjKRsyhoI8xv2wCgj3GheX4ls0n8lSmJs/5FaQwX
qE0An1+nH6ejT0mWcgSsSl+HjZyc04Qa
=sYAh
-----END PGP SIGNATURE-----

--Signature=_Thu__8_Apr_2010_13_59_03_+1000_Sho1+z3yLFLItvRX--
