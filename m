From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Thu, 25 Jun 2009 13:15:17 +1000
Message-ID: <20090625131517.d9adc935.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__25_Jun_2009_13_15_17_+1000_unMPI5.OUDdM8Kkc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36703 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752636AbZFYDPW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 24 Jun 2009 23:15:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>

--Signature=_Thu__25_Jun_2009_13_15_17_+1000_unMPI5.OUDdM8Kkc
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
fs/fs-writeback.c between commit 01c031945f2755c7afaaf456088543312f2b72ea
("cleanup __writeback_single_inode") from Linus' tree and commit
385b54f15a82a85a505e0f5e8579605f5742c648 ("writeback: move dirty inodes
from super_block to backing_dev_info") from the block tree (and probably
others).

I can't see how to easily fix this up, so I have dropped the block tree
for today (since it only contained 2.6.32 material, right?).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__25_Jun_2009_13_15_17_+1000_unMPI5.OUDdM8Kkc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpC68UACgkQjjKRsyhoI8wEiACePOgcCw0dlfbPEbAj9WzNJ1Kr
Jx4AoJesgSm/an7/PvJrYFaMO5w7DvHp
=SqwO
-----END PGP SIGNATURE-----

--Signature=_Thu__25_Jun_2009_13_15_17_+1000_unMPI5.OUDdM8Kkc--
