From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bkl-ioctl tree with the bkl-procfs
 tree
Date: Thu, 29 Apr 2010 15:50:11 +1000
Message-ID: <20100429155011.36bf1e3d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__29_Apr_2010_15_50_11_+1000_K6g/Xeg1xTN1+pRq"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36098 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758646Ab0D3Rcg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 30 Apr 2010 13:32:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?UTF-8?B?IkZyw6lkw6lyaWMgV2Vpc2JlY2tlciI=?= <fweisbec@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

--Signature=_Thu__29_Apr_2010_15_50_11_+1000_K6g/Xeg1xTN1+pRq
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Fr=C3=A9d=C3=A9ric,

Today's linux-next merge of the bkl-ioctl tree got a conflict in
drivers/isdn/divert/divert_procfs.c between commit
64ef834551d7696f54553d7608eba80a5a800e77 ("procfs: Push down the bkl from
ioctl") from the bkl-procfs tree and commit
5cc2443e44f810a21d1228ac9bf60b41536e5b9c ("isdn: Push down BKL into ioctl
functions") from the bkl-ioctl tree.

I used the version from the blk-procfs tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Thu__29_Apr_2010_15_50_11_+1000_K6g/Xeg1xTN1+pRq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvZHhMACgkQjjKRsyhoI8yCRwCgpSwlsj6WFeh4XjGn3mniuLu9
tZEAn049XL54w7qpfrtUyVpRee4UWxVj
=aBGB
-----END PGP SIGNATURE-----

--Signature=_Thu__29_Apr_2010_15_50_11_+1000_K6g/Xeg1xTN1+pRq--
