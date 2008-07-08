From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the hdlc tree
Date: Tue, 8 Jul 2008 17:27:11 +1000
Message-ID: <20080708172711.7db1df23.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__8_Jul_2008_17_27_11_+1000_60pnT2w2rPE/dMnC"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44075 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751702AbYGHH1R (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 03:27:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Krzysztof Halasa <khc@pm.waw.pl>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__8_Jul_2008_17_27_11_+1000_60pnT2w2rPE/dMnC
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Today's linux-next merge of the hdlc tree got a conflict in
drivers/net/wan/pc300_drv.c between commit
198191c4a7ce4daba379608fb38b9bc5a4eedc61 ("WAN: convert drivers to use
built-in netdev_stats") from the net tree and commit
e693f93d7b291ae6a774728c35bd1c7969f1782a ("WAN: Convert PC300 driver to
use normal u8/u16/u32 types") from the hdlc tree.

Just contextual conflicts.  I used the hdlc tree's version.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__8_Jul_2008_17_27_11_+1000_60pnT2w2rPE/dMnC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhzFs8ACgkQjjKRsyhoI8ygAgCgqksN7gQeeeQBNuTXtmX23APj
K9YAnjq1draK5PQnVZbcYLMUr3mvpQJi
=/+e5
-----END PGP SIGNATURE-----

--Signature=_Tue__8_Jul_2008_17_27_11_+1000_60pnT2w2rPE/dMnC--
