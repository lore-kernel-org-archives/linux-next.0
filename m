From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the bkl-ioctl tree
Date: Thu, 29 Apr 2010 15:49:47 +1000
Message-ID: <20100429154947.fbacee1f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__29_Apr_2010_15_49_47_+1000_Ow=LcdvZXNFTLhds"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36100 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758802Ab0D3Rcg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 30 Apr 2010 13:32:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?UTF-8?B?IkZyw6lkw6lyaWMgV2Vpc2JlY2tlciI=?= <fweisbec@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, John Kacur <jkacur@redhat.com>

--Signature=_Thu__29_Apr_2010_15_49_47_+1000_Ow=LcdvZXNFTLhds
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Fr=C3=A9d=C3=A9ric,

After merging the bkl-ioctl tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/scsi/3w-xxxx.c: In function 'tw_chrdev_ioctl':
drivers/scsi/3w-xxxx.c:896: error: 'inode' undeclared (first use in this fu=
nction)

Caused by commit 5c9af160f830a68734f600fc0f90cba35e26727b ("scsi: Push
down BKL into ioctl functions").

I have used the version of the blk-ioctl tree from next-20100428 for
today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__29_Apr_2010_15_49_47_+1000_Ow=LcdvZXNFTLhds
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvZHfsACgkQjjKRsyhoI8z9cgCeJ40beHDV3+JMut48yUQVQpES
EVUAn0YS0Qu99DUMIpLnpqQaUCBph2Ki
=I35W
-----END PGP SIGNATURE-----

--Signature=_Thu__29_Apr_2010_15_49_47_+1000_Ow=LcdvZXNFTLhds--
