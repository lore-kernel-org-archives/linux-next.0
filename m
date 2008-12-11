From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: driver-core tree build failure
Date: Thu, 11 Dec 2008 11:21:27 +1100
Message-ID: <20081211112127.7aa2c373.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__11_Dec_2008_11_21_27_+1100_Qzmx2IwS7xsTwHv3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56697 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752009AbYLKAVl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Dec 2008 19:21:41 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>

--Signature=_Thu__11_Dec_2008_11_21_27_+1100_Qzmx2IwS7xsTwHv3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/mtd/maps/physmap.c: In function 'physmap_flash_probe':
drivers/mtd/maps/physmap.c:108: error: expected ')' before '{' token
drivers/mtd/maps/physmap.c:144: error: expected expression before '}' token

Caused by commit 7267696c2421503e280d9da5bbdbd5c11e1e5b25 ("mtd: struct
device - replace bus_id with dev_name(), dev_set_name()").

I have reverted that patch for today.

Please be more careful ... allmodconfig is your friend when doing wide
ranging changes ...
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__11_Dec_2008_11_21_27_+1100_Qzmx2IwS7xsTwHv3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklAXQcACgkQjjKRsyhoI8z0EgCfbBxlwKKRsJq8w977/tZu/XaN
DLcAn0bWdZDn1vIS8Z45T0wf+ZwuPfyG
=wlii
-----END PGP SIGNATURE-----

--Signature=_Thu__11_Dec_2008_11_21_27_+1100_Qzmx2IwS7xsTwHv3--
