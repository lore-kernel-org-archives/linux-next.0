From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the firmware tree
Date: Tue, 29 Jul 2008 14:27:27 +1000
Message-ID: <20080729142727.dd55e93c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__29_Jul_2008_14_27_27_+1000_pYvbww_lAkpSLz5l"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58969 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752360AbYG2E1f (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Jul 2008 00:27:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Jaswinder Singh <jaswinder@infradead.org>, Adrian Bunk <bunk@kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>

--Signature=_Tue__29_Jul_2008_14_27_27_+1000_pYvbww_lAkpSLz5l
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the firmware tree got a conflict in
drivers/media/dvb/ttpci/Kconfig between commit
445c2714cf72817ab1ad3ca894c6d9b2047b3a3e ("V4L/DVB (8534): remove
select's of FW_LOADER") from Linus' tree and commit
06c8b7a8fde544f1145365ab6df2d3254301923f ("firmware: convert av7110
driver to request_firmware()") from the firmware tree.

Just a context conflict.  I fixed it up.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__29_Jul_2008_14_27_27_+1000_pYvbww_lAkpSLz5l
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiOnC8ACgkQjjKRsyhoI8z4LQCeNAXik0mrRzWVjdTtZjNyoy7x
fcsAn0ksidbheVGVJflt/XrZqFS8KSow
=4WZM
-----END PGP SIGNATURE-----

--Signature=_Tue__29_Jul_2008_14_27_27_+1000_pYvbww_lAkpSLz5l--
