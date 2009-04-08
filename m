From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: usb.current tree build failure
Date: Wed, 8 Apr 2009 10:10:07 +1000
Message-ID: <20090408101007.40822ec6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__8_Apr_2009_10_10_07_+1000_ioKPVH8dBdILl1cM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34412 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751866AbZDHAKR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Apr 2009 20:10:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, David Vrabel <david.vrabel@csr.com>

--Signature=_Wed__8_Apr_2009_10_10_07_+1000_ioKPVH8dBdILl1cM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/block/ub.c: In function 'ub_scsi_urb_compl':
drivers/block/ub.c:1052: error: implicit declaration of function 'usb_setto=
ggle'

Caused by commit 876d77e4521ff2b4f937bf7104bf70d2d105b0c2 ("USB: add
reset endpoint operations") from the usb.current tree.

I have used the version of that tree from next-20090407. (Which means I
need to do the same for the driver-core, usb and staring trees that
depend on the usb.current tree.)
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__8_Apr_2009_10_10_07_+1000_ioKPVH8dBdILl1cM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknb618ACgkQjjKRsyhoI8wq7ACguLDUJOXIjQSW8WUWFgh6Xyoe
xzsAn2/toaqVIc8HMdzPUxkIhLbhbs/G
=Pokb
-----END PGP SIGNATURE-----

--Signature=_Wed__8_Apr_2009_10_10_07_+1000_ioKPVH8dBdILl1cM--
