From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mfd tree
Date: Tue, 8 Jul 2008 17:11:03 +1000
Message-ID: <20080708171103.f9c9a3ce.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__8_Jul_2008_17_11_03_+1000_WVMriTgnaWGZ0GB."
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49457 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751702AbYGHHLK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 03:11:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Samuel Ortiz <sameo@openedhand.com>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__8_Jul_2008_17_11_03_+1000_WVMriTgnaWGZ0GB.
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

Today's linux-next merge of the mfd tree got a conflict in MAINTAINERS
between commit 4e0d13cbb71de2b1baf71ddd3c14f7ba8da810e5 ("MFD
maintainer") from Linus' tree and commit
52554ec1473a5334ffe589053268d7dd89007afa ("MFD maintainer") from the mfd
tree.

Same commit - different white space. I used Linus' version.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__8_Jul_2008_17_11_03_+1000_WVMriTgnaWGZ0GB.
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhzEwcACgkQjjKRsyhoI8zqowCfTdJCflRAfF5U+Cgs6XnQvpNf
Va0An3MrqPAZuSE72lmTm8KBYN8c14UL
=AMpp
-----END PGP SIGNATURE-----

--Signature=_Tue__8_Jul_2008_17_11_03_+1000_WVMriTgnaWGZ0GB.--
