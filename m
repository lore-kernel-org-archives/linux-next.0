From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of i2c tree
Date: Tue, 17 Jun 2008 14:28:21 +1000
Message-ID: <20080617142821.88d73657.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__17_Jun_2008_14_28_21_+1000_tTSB6xpBWzUeaesd"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51285 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751187AbYFQE2b (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Jun 2008 00:28:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

--Signature=_Tue__17_Jun_2008_14_28_21_+1000_tTSB6xpBWzUeaesd
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean,

Today's linux-next merge if the i2c tree got a conflict in
drivers/i2c/i2c-core.c between commit
5f38434efd52cd113a6bd278d9765f11e63005d7
("i2c-use-class_for_each_device") from the driver-core tree and commits
30b96672f3860f0b45b4347b0b0280523ca2a5d1 ("i2c: Use
list_for_each_entry_safe"), d6d4d5deddec521bbac62860338237c448adc5d7
("i2c: Simplify i2c_del_driver()") and
a7e4e16fe30eb27f6d0975d9cd97af157bf7576d ("i2c: Add detection capability
to new-style drivers") from the i2c tree.

I fixed it up as best I could. Please check after I publish the tree,
thanks.  I took the i2c tree version except that class_for_each_device
now has an extra argument.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__17_Jun_2008_14_28_21_+1000_tTSB6xpBWzUeaesd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhXPWUACgkQTgG2atn1QN+DEwCfZroxRQZc9HaK9xsFlfT8t15t
J8kAniEwMYKiX5xAB5ffR3WDldf1yOGc
=Lf6Q
-----END PGP SIGNATURE-----

--Signature=_Tue__17_Jun_2008_14_28_21_+1000_tTSB6xpBWzUeaesd--
