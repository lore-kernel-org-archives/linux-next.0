From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: driver-core/i2c merge conflicts
Date: Mon, 26 May 2008 12:18:20 +1000
Message-ID: <20080526121820.03d27324.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__26_May_2008_12_18_20_+1000_woQ.izvrq1834RFH"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35649 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751770AbYEZCSo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 25 May 2008 22:18:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Jean Delvare <khali@linux-fr.org>

--Signature=_Mon__26_May_2008_12_18_20_+1000_woQ.izvrq1834RFH
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg, Jean,

Today's linux-next merge of the i2c tree got conflicts in
drivers/i2c/i2c-core.c between "i2c-use-class_for_each_device" from the
driver-core tree" and "i2c: Use class_for_each_device", "i2c: Use
list_for_each_entry_safe" and "i2c: Simplify i2c_del_driver()" from the
i2c tree.

I used the version from the i2c tree except I added NULL for the new
parameter to class_for_each_device.  This merge fixup has replaced the
build fixup in the previous linux-next tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__26_May_2008_12_18_20_+1000_woQ.izvrq1834RFH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIOh33TgG2atn1QN8RAmQMAJwJIZyhqMTCpl7saiLGbCwy66/LywCeJVlf
au4Hcl2KURfUptMdyWqVAvo=
=xoYU
-----END PGP SIGNATURE-----

--Signature=_Mon__26_May_2008_12_18_20_+1000_woQ.izvrq1834RFH--
