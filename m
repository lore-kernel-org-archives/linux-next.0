From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Thu, 14 Aug 2008 15:50:09 +1000
Message-ID: <20080814155009.c76f4aa2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__14_Aug_2008_15_50_10_+1000_wYtD5Lv.ORosz0Eu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44507 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751331AbYHNFuU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Aug 2008 01:50:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Olivier Blin <blino@mandriva.com>, Greg KH <greg@kroah.com>

--Signature=_Thu__14_Aug_2008_15_50_10_+1000_wYtD5Lv.ORosz0Eu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/net/usb/hso.c between commit
e9690d2f637dd16bf20bc4d69b51ba72fb211822 ("hso: fix oops in read/write
callbacks") from the usb tree and commit
37a8d3fef248ae274c93974972469e0c36e21f73 ("tty-kref-hso") from the ttydev
tree.

Overlapping fixes.  I fixed them up as seemed obvious.

[Alan, I assume your patches will get better changelogs ...]
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__14_Aug_2008_15_50_10_+1000_wYtD5Lv.ORosz0Eu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkijx5IACgkQjjKRsyhoI8zS1ACeOcAQsFMvKa3nrmXETZS7yUS6
vb0An1c5jw/zwec94Q0RBuELpRZ/pJ8U
=qhch
-----END PGP SIGNATURE-----

--Signature=_Thu__14_Aug_2008_15_50_10_+1000_wYtD5Lv.ORosz0Eu--
