From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the bkl-procfs tree
Date: Tue, 13 Apr 2010 15:27:41 +1000
Message-ID: <20100413152741.4d56be0c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__13_Apr_2010_15_27_41_+1000_outbpfpjGyHmv8k/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58193 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750869Ab0DMF1r (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 13 Apr 2010 01:27:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?UTF-8?B?IkZyw6lkw6lyaWMgV2Vpc2JlY2tlciI=?= <fweisbec@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__13_Apr_2010_15_27_41_+1000_outbpfpjGyHmv8k/
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi "Fr=C3=A9d=C3=A9ric,

After merging the bkl-procfs tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

net/sunrpc/cache.c: In function 'cache_ioctl_procfs':
net/sunrpc/cache.c:1355: error: implicit declaration of function 'lock_kern=
el'
net/sunrpc/cache.c:1359: error: implicit declaration of function 'unlock_ke=
rnel'

Caused by commit 64ef834551d7696f54553d7608eba80a5a800e77 ("procfs: Push
down the bkl from ioctl").  Forgot to include linux/smp_lock.h?  See
Documentation/SubmitChecklist Rule #1.

I have dropped the bkl-procfs tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__13_Apr_2010_15_27_41_+1000_outbpfpjGyHmv8k/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvEAM0ACgkQjjKRsyhoI8y5ygCdGixk/ODmErpqJ9otBhb4FxLv
qZwAoIQl630LSyvxhsHxuwj2TXUJRD3s
=x8XG
-----END PGP SIGNATURE-----

--Signature=_Tue__13_Apr_2010_15_27_41_+1000_outbpfpjGyHmv8k/--
