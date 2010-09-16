From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the final tree
Date: Thu, 16 Sep 2010 15:05:30 +1000
Message-ID: <20100916150530.5789eb79.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__16_Sep_2010_15_05_30_+1000_wL+phshA.ItXOCYj"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55782 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751238Ab0IPFFk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Sep 2010 01:05:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>

--Signature=_Thu__16_Sep_2010_15_05_30_+1000_wL+phshA.ItXOCYj
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

After merging the final tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

drivers/scsi/aic7xxx_old.c: In function 'aic7xxx_buildscb':
drivers/scsi/aic7xxx_old.c:10122: warning: unused variable 'req'

Introduced by commit 9cbbdca44ae1a6f512ea1e2be11ced8bbb9d430a ("block:
remove spurious uses of REQ_HARDBARRIER").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__16_Sep_2010_15_05_30_+1000_wL+phshA.ItXOCYj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMkaWaAAoJEDMEi1NhKgbsW2sIAKAxHvdQOVKV1pMGb0i6AKpj
RdDbhBpbqxLL/FcBiY3XG4VYbDrgM08wSsvVez7hQp+AJYoIfuBDEP43ipCieYhf
tZm0+lQg9Q2fZlhzNOmPpLudZEdxkZzaMOA5KNlJiNSw+Ns7Am+AsqOhntl1SoIH
yumZLEeM3MKhSZMgzXR/nk1N67kyZ/btcC9NZaq9R8WXHvRISk1ZYa7+z/pm9Ejk
0RnnENcKxUZjysH2UccVeq/baJpUtZK6lAnZRqic4JDw7a6BiMYF82dtur0GNnyP
2M2Q/8MoOccAsacPM1ZjsMmATD3q4pXo7Gnx8/j+IubDktmJc92dLsPV42p/8dk=
=JlCY
-----END PGP SIGNATURE-----

--Signature=_Thu__16_Sep_2010_15_05_30_+1000_wL+phshA.ItXOCYj--
