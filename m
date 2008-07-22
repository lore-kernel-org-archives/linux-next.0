From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree
Date: Tue, 22 Jul 2008 10:56:40 +1000
Message-ID: <20080722105640.8cb5989b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__22_Jul_2008_10_56_40_+1000_Ir=qrsyi4u8ZDxfz"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50725 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753424AbYGVA4v (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Jul 2008 20:56:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>

--Signature=_Tue__22_Jul_2008_10_56_40_+1000_Ir=qrsyi4u8ZDxfz
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the driver-core tree got a conflict in
drivers/usb/core/devio.c between commit
e04199b2167e88f0e2d0410fafaa2c35ff7ba8c1 ("usbfs: don't store bad
pointers in registration") from Linus' tree and commits
56d207f2504091e7a173640b91cb39072a2f4542 ("device create: usb: convert
device_create to device_create_drvdata")
0de4509ad6495261fba5ebb539ac6fbb5cf66999 ("device create: usb: convert
device_create_drvdata to device_create") from the driver-core tree.

I did the (reasonably obvious) fixup in usb_classdev_add.  Probably worth
a check when I publish the tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__22_Jul_2008_10_56_40_+1000_Ir=qrsyi4u8ZDxfz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiFMEgACgkQjjKRsyhoI8y4NgCghQCh5RLS/kFMH5XMm6Ekn57R
1SYAoLFumjIeXMOal2svBKuFRHvjyxMe
=SYhi
-----END PGP SIGNATURE-----

--Signature=_Tue__22_Jul_2008_10_56_40_+1000_Ir=qrsyi4u8ZDxfz--
