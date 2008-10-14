From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree
Date: Tue, 14 Oct 2008 14:47:15 +1100
Message-ID: <20081014144715.14dc680c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_14_47_15_+1100_598Kfvb2q3Oy9PeW"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59330 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756152AbYJNEmB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 00:42:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Denis Joseph Barrow <D.Barow@option.com>

--Signature=_Tue__14_Oct_2008_14_47_15_+1100_598Kfvb2q3Oy9PeW
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in
drivers/net/usb/hso.c between commit
8ef5ba63b94b04b182ac4a6009dbbf1406beb3c5 ("[netdrvr] usb/hso: throttle to
prevent loss of serial data") from Linus' tree and commit
046a038ee4a99eb585313b07dc658a6a444d530e ("HSO: put linefeeds on printk's
in hso.c") from the usb tree.

The former removed some of the code that the latter was modifying.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Oct_2008_14_47_15_+1100_598Kfvb2q3Oy9PeW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj0FkMACgkQjjKRsyhoI8w9dgCeJII+GYss8Ug14JI9eQmzm4KG
kl0An3DALHY+YbYgnHmUY4YG37LysNY+
=80L0
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_14_47_15_+1100_598Kfvb2q3Oy9PeW--
