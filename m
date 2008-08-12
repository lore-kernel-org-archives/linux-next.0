From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Tue, 12 Aug 2008 16:58:30 +1000
Message-ID: <20080812165830.86c08de0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__12_Aug_2008_16_58_30_+1000_.hReJI_/Zu=iM8Im"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33854 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751071AbYHLG6j (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Aug 2008 02:58:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>, Greg KH <greg@kroah.com>

--Signature=_Tue__12_Aug_2008_16_58_30_+1000_.hReJI_/Zu=iM8Im
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/usb/class/cdc-acm.c between commit
9e02103a5b182c5c99aaa8efa1def46bd215c707 ("usb: cdc-acm: stop dropping tx
buffers") from the usb.current tree and commit
1b873c25c7cb1571784626ce044b63a28909e288 ("tty-fix-cdc-acm") from the
ttydev tree.

The former removed a line that the latter modified.  I just removed the
line.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__12_Aug_2008_16_58_30_+1000_.hReJI_/Zu=iM8Im
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkihNJYACgkQjjKRsyhoI8zmEgCgs3un1l9HaL84pWsnBDe2dFL/
9VAAnjzhfGQq1Igr1J6JpAm6zxxltmxK
=bFLI
-----END PGP SIGNATURE-----

--Signature=_Tue__12_Aug_2008_16_58_30_+1000_.hReJI_/Zu=iM8Im--
