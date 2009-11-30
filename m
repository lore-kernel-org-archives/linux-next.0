From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree with the net tree
Date: Mon, 30 Nov 2009 13:53:20 +1100
Message-ID: <20091130135320.215722a2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__30_Nov_2009_13_53_20_+1100_1rxf6uol2G1642nf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53429 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752712AbZK3CxS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 29 Nov 2009 21:53:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Hutchings <bhutchings@solarflare.com>, "David S. Miller" <davem@davemloft.net>, =?UTF-8?B?IkFuZHLDqSBHb2RkYXJkIFJvc2Ei?= <andre.goddard@gmail.com>

--Signature=_Mon__30_Nov_2009_13_53_20_+1100_1rxf6uol2G1642nf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

Today's linux-next merge of the trivial tree got a conflict in
drivers/net/sfc/falcon.c between commit
127e6e10ad17585c48cba8e1dcf30d98b90ee583 ("sfc: Fix bugs in RX queue
flushing") from the net tree and commit
4e5cf22a6f45b6489f84de03d3a1dfa60cc4b4e4 ("tree-wide: fix assorted typos
all over the place") from the trivial tree.

The former removed the comment that the latter was fixing.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__30_Nov_2009_13_53_20_+1100_1rxf6uol2G1642nf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksTM6AACgkQjjKRsyhoI8y7RQCfVp2jvlhuZuGG7TPSs1zYZwPe
+cMAnRUsy4Jvl+fCuWvdm+Hk6vKMKWdF
=1VfD
-----END PGP SIGNATURE-----

--Signature=_Mon__30_Nov_2009_13_53_20_+1100_1rxf6uol2G1642nf--
