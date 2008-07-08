From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the hdlc tree
Date: Tue, 8 Jul 2008 17:23:26 +1000
Message-ID: <20080708172326.907c0784.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__8_Jul_2008_17_23_26_+1000_GPiHYfgoXJdM.+n6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59935 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751971AbYGHHXe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 03:23:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Krzysztof Halasa <khc@pm.waw.pl>
Cc: linux-next@vger.kernel.org, David Miller <davem@davemloft.net>, Jeff Garzik <jeff@garzik.org>

--Signature=_Tue__8_Jul_2008_17_23_26_+1000_GPiHYfgoXJdM.+n6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Today's linux-next merge of the hdlc tree got a conflict in
drivers/net/wan/hdlc_fr.c between commit
54364b752ef0c91fe92684df000cc4593d1e8963 ("Add missing skb->dev
assignment in Frame Relay RX code") from the net tree and commit
41274d8181eca88e7ac2d7e82f804263a4f23ce4 ("WAN: Use struct
net_device_stats built into struct net_device.") from the hdlc tree
(which seem sto also exist in the net tree).

Just contextual.  I kept in the net tree's addition.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__8_Jul_2008_17_23_26_+1000_GPiHYfgoXJdM.+n6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhzFe4ACgkQjjKRsyhoI8xHOACgvllm31biWT+k5yXUXSk7oTU+
ct4An0yGC+FXR0X7q0+16t8hBzeuonfd
=6ona
-----END PGP SIGNATURE-----

--Signature=_Tue__8_Jul_2008_17_23_26_+1000_GPiHYfgoXJdM.+n6--
