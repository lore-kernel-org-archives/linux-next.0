From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: block tree build failure
Date: Fri, 4 Dec 2009 14:36:12 +1100
Message-ID: <20091204143612.f30db275.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__4_Dec_2009_14_36_12_+1100_+sBem.5IiBFb45Xs"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33764 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755229AbZLDDgU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Dec 2009 22:36:20 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vivek Goyal <vgoyal@redhat.com>

--Signature=_Fri__4_Dec_2009_14_36_12_+1100_+sBem.5IiBFb45Xs
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

Today's linux-next build (x86_64 allmodconfig) failed like this:

block/built-in.o: In function `blkiocg_destroy':
blk-cgroup.c:(.text+0x1bd48): undefined reference to `cfq_unlink_blkio_grou=
p'
block/built-in.o: In function `blkiocg_weight_write':
blk-cgroup.c:(.text+0x1c0d2): undefined reference to `cfq_update_blkio_grou=
p_weight'

Caused by commits b1c3576961847da26c91b1e97f226bb66be5fa3f ("blkio: Take
care of cgroup deletion and cfq group reference counting") and
f8d461d692c341add957fb973fb5ee1f62039dc7 ("blkio: Propagate cgroup weight
updation to cfq groups").

When adding code that is CONFIG dependent, please build test it with and
without the relevant CONFIG setting (in this case
CONFIG_CFQ_GROUP_IOSCHED).  Also put the extern declarations of global
functions into a header file.

I have used the version of the block tree from next-20091203 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__4_Dec_2009_14_36_12_+1100_+sBem.5IiBFb45Xs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksYg6wACgkQjjKRsyhoI8wVlgCfeYqfr7NoIDfq5A2kqu9Cg509
9PMAoI6RGgV1v5LWwgiexKqtIT6R3FiR
=FYZi
-----END PGP SIGNATURE-----

--Signature=_Fri__4_Dec_2009_14_36_12_+1100_+sBem.5IiBFb45Xs--
