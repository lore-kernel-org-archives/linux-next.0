From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree
Date: Mon, 10 Nov 2008 12:06:20 +1100
Message-ID: <20081110120620.c41afd61.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__10_Nov_2008_12_06_20_+1100_mwkqXSKOTGxq2Ma_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37784 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755345AbYKJBGc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 9 Nov 2008 20:06:32 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Jonathan McDowell <noodles@earth.li>, Jeff Garzik <jgarzik@redhat.com>, "David S. Miller" <davem@davemloft.net>, Denis Joseph Barrow <D.Barow@option.com>

--Signature=_Mon__10_Nov_2008_12_06_20_+1100_mwkqXSKOTGxq2Ma_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in
drivers/net/usb/hso.c between commit
939a9516416ad8ccec27aa05bd19236c550c0c03 ("[netdrvr] usb/hso: Cleanup
rfkill error handling") from the net-current tree and commit
d0797ae05df8297aa1db7216c8814419047d5a12 ("HSO: put linefeeds on printk's
in hso.c") from the usb tree.

Some of the changes from the latter have been done on the former and the
former added some code next to those changes.  I have fixed it up for now
but the net-current change will (presumably) be in Linus' tree shortly,
so I expect this to be fixed in the usb tree soon.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__10_Nov_2008_12_06_20_+1100_mwkqXSKOTGxq2Ma_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkXiQwACgkQjjKRsyhoI8xsgQCdE5Qb3mTQhiQ7W5EB1T079/iZ
6bAAoLmhPsqaZ+pjyw68mZyXAnYKUJcc
=Udol
-----END PGP SIGNATURE-----

--Signature=_Mon__10_Nov_2008_12_06_20_+1100_mwkqXSKOTGxq2Ma_--
