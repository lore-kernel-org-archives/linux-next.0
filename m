From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the  tree
Date: Mon, 18 May 2009 14:53:18 +1000
Message-ID: <20090518145318.c199842e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__18_May_2009_14_53_18_+1000_BhL.eud/pNrtKSOy"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35982 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750701AbZERExY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 May 2009 00:53:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>, Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Hannes Reinecke <hare@suse.de>, Tejun Heo <tj@kernel.org>

--Signature=_Mon__18_May_2009_14_53_18_+1000_BhL.eud/pNrtKSOy
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens, Rusty,

Today's linux-next merge of the block tree got a conflict in
drivers/block/virtio_blk.c between commit
fb8df56d3255396ff144a5f359f711e516e7d7b1 ("virtio_blk: SG_IO passthru
support") from the rr tree and commit
40cbbb781d3eba5d6ac0860db078af490e5c7c6b ("block: implement and use [__]
blk_end_request_all()") from the block tree.

I have no idea what the correct solution is here, so I used the version
from the block tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__18_May_2009_14_53_18_+1000_BhL.eud/pNrtKSOy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoQ6b4ACgkQjjKRsyhoI8wfFgCbBscMcwy8s3A7LVTR/wz9Zgam
zu0AoJxO6KSCrwyt+7GF+LMvOZDbEBFD
=jLSj
-----END PGP SIGNATURE-----

--Signature=_Mon__18_May_2009_14_53_18_+1000_BhL.eud/pNrtKSOy--
