From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the s390 tree
Date: Wed, 29 Oct 2008 11:06:38 +1100
Message-ID: <20081029110638.f40c73d9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__29_Oct_2008_11_06_39_+1100_hYos_+0=GjJ8hulB"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37291 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752781AbYJ2AGs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Oct 2008 20:06:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, Frank Blaschka <frank.blaschka@de.ibm.com>, Ursula Braun <ursula.braun@de.ibm.com>, Jeff Garzik <jgarzik@redhat.com>, "David S. Miller" <davem@davemloft.net>

--Signature=_Wed__29_Oct_2008_11_06_39_+1100_hYos_+0=GjJ8hulB
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Martin, Heiko,

Today's linux-next merge of the s390 tree got conflicts in
drivers/s390/net/qeth_l2_main.c and drivers/s390/net/qeth_l3_main.c
between commit 0f5623c9ebfc6576c5682ab3b335c57812f6c87e ("qeth: remove
non-recover-thread checkings") from the net-current tree and commit
fef944b54d0cf71d1f775532439f2e1c3ff3d29b ("[S390] convert qeth printks to
dev_xxx and pr_xxx macros.") from the s390 tree.

Overlapping removals. So I removed the whole sections i.e. used the
net-current version.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__29_Oct_2008_11_06_39_+1100_hYos_+0=GjJ8hulB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkHqQ8ACgkQjjKRsyhoI8wylwCeJqI0c8KsGf/8k9UdZiEaHwDV
h0EAn1iqVNbcMQQO4QpRTGIPVC/a18Yr
=EYFR
-----END PGP SIGNATURE-----

--Signature=_Wed__29_Oct_2008_11_06_39_+1100_hYos_+0=GjJ8hulB--
