From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree
Date: Wed, 15 Oct 2008 18:40:55 +1100
Message-ID: <20081015184055.54fc34c9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__15_Oct_2008_18_40_55_+1100_RbgvYtNKpRp_q3cQ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34341 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750999AbYJOIGq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 04:06:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, "David S. Miller" <davem@davemloft.net>, Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Wed__15_Oct_2008_18_40_55_+1100_RbgvYtNKpRp_q3cQ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

Today's linux-next merge of the block tree got conflicts in
include/linux/interrupt.h and kernel/softirq.c between commit
978b0116cd225682a29e3d1d5010319bf2de32c2 ("softirq: allocate less
vectors") from the tip-core tree and commit
c065c007d92de6ed071c9939bd1982d3a35ebd0f ("softirq: Define and use
NR_SOFTIRQ") from the block tree.

These two commits seem to do the same thing.  I have used the latter as
other things in the block tree depend on it.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__15_Oct_2008_18_40_55_+1100_RbgvYtNKpRp_q3cQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj1nocACgkQjjKRsyhoI8wGhACghw4WpX4zJIVt1kBnx0JI0Hpz
8sEAoLlB1WsvNZYzSEH8xvKon0bLJefe
=8wY1
-----END PGP SIGNATURE-----

--Signature=_Wed__15_Oct_2008_18_40_55_+1100_RbgvYtNKpRp_q3cQ--
