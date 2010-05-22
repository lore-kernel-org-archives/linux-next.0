From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the squashfs tree
Date: Sat, 22 May 2010 16:30:42 +1000
Message-ID: <20100522163042.13478ac4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__22_May_2010_16_30_42_+1000_VW0KvyRX..7M9liQ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42091 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752659Ab0EVGcV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 22 May 2010 02:32:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Hemminger <shemminger@vyatta.com>

--Signature=_Sat__22_May_2010_16_30_42_+1000_VW0KvyRX..7M9liQ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Phillip,

After merging the squashfs tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

fs/squashfs/super.c: In function 'squashfs_fill_super':
fs/squashfs/super.c:265: warning: assignment from incompatible pointer type

Introduced by commit 67f66cc6c728de183d9d43c243cb163c1ebd8e04 ("squashfs:
add new extended inode types") from the squashfs tree interacting with
commit bb4354538eb7b92f32cfedbad68c7be266c0b467 ("fs: xattr_handler table
should be const") from Linus' tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__22_May_2010_16_30_42_+1000_VW0KvyRX..7M9liQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkv3ehIACgkQjjKRsyhoI8xVFQCgi/b8+lM8C8fo3iuRk2CGVjpJ
OTMAoIUpOQjRv9+QbRKQI0Mb/8wJjmJH
=wwaq
-----END PGP SIGNATURE-----

--Signature=_Sat__22_May_2010_16_30_42_+1000_VW0KvyRX..7M9liQ--
