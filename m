From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mips tree
Date: Tue, 15 Jul 2008 23:02:19 +1000
Message-ID: <20080715230219.86638f63.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__15_Jul_2008_23_02_19_+1000_Ai1vd.4Z.OVpVPg."
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38027 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755009AbYGONCb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Jul 2008 09:02:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, Yoichi Yuasa <yoichi_yuasa@tripeaks.co.jp>, Adrian Bunk <bunk@kernel.org>

--Signature=_Tue__15_Jul_2008_23_02_19_+1000_Ai1vd.4Z.OVpVPg.
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

Today's linux-next merge of the mips tree got a trivial conflict in
drivers/mtd/maps/mtx-1_flash.c between commit
59018b6d2acabb114ab58637e6ab95ba424a89d0 ("MTD/JFFS2: remove CVS
keywords") from the mtd tree and commit
16a21f086d79f09e3f4318b4989f854266bb41a8 ("[MIPS] MTX-1 flash partition
setup move to platform devices registration") from the mips tree.

The former removed the CVS keywords from a file that the latter deleted.

I just removed the file.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__15_Jul_2008_23_02_19_+1000_Ai1vd.4Z.OVpVPg.
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh8n9sACgkQjjKRsyhoI8wk+QCfdV8Qi6oniyt/ZrCxUlu8MNNp
Y4oAn0/Ty26y72haZIq9INiiALTf1yPi
=4387
-----END PGP SIGNATURE-----

--Signature=_Tue__15_Jul_2008_23_02_19_+1000_Ai1vd.4Z.OVpVPg.--
