From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: firmware/driver-core merge conflict
Date: Tue, 10 Jun 2008 19:09:06 +1000
Message-ID: <20080610190906.4e5e4251.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__10_Jun_2008_19_09_06_+1000_Jo3oU=FesnWEVL=j"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40179 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751461AbYFJJJP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Jun 2008 05:09:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>, Matthew Garrett <mjg59@srcf.ucam.org>

--Signature=_Tue__10_Jun_2008_19_09_06_+1000_Jo3oU=FesnWEVL=j
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David, Greg,

Today's linux-next merge of the firmware tree got a trivial context
conflict in drivers/usb/misc/isight_firmware.c between commit
b5393ebb32c158ca8c14141d73562b19ee1b7f35 ("isight_firmware: Avoid crash
on loading invalid firmware") from the driver-core tree and commit
eb5767b79bbaa381b67918f1f5405233a74f849b ("isight: treat firmware data as
const") from the firmware tree (which is actually in both trees).

I did the obvious fixup.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__10_Jun_2008_19_09_06_+1000_Jo3oU=FesnWEVL=j
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhORLIACgkQTgG2atn1QN/9CACfa3E6w/DafQloRu7lMpYtiAda
es4AnAqlBiEdj0c+EZRbkV4sRbxIKRNf
=p1L3
-----END PGP SIGNATURE-----

--Signature=_Tue__10_Jun_2008_19_09_06_+1000_Jo3oU=FesnWEVL=j--
