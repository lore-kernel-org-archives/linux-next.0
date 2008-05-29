From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: pci/driver-core merge conflicts
Date: Thu, 29 May 2008 12:18:47 +1000
Message-ID: <20080529121847.fcc81e2f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__29_May_2008_12_18_47_+1000_2pgdpsJmSjZxNd/n"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56888 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750830AbYE2CS5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 28 May 2008 22:18:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>, Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, "Rafael J. Wysocki" <rjw@sisk.pl>

--Signature=_Thu__29_May_2008_12_18_47_+1000_2pgdpsJmSjZxNd/n
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse, Greg,

Today's linux-next merge of the pci tree got a trivial conflict in
drivers/base/power/main.c between commit
bd24b944eb93549b1ca5becbf27c7373504f7eed ("driver-core: prepare for
removal of 20 char limit from struct device") from the driver-core tree
and commit 4ba09608f82f2273b731560f702f8bbb167f4c23 ("Introduce new top
level suspend and hibernation callbacks") from the pci tree.  I took the
latter version except to use "dev_name(dev->parent)" instead of
"dev->parent->bus_id".

The second conflict was in include/linux/device.h between commit
9c77d9cc76e424a3c59822c405cbf75a45465170 ("class: move driver core
specific parts to a private structure") from the driver-core tree and
commit 4ba09608f82f2273b731560f702f8bbb167f4c23 ("Introduce new top level
suspend and hibernation callbacks") from the pci tree.  I just added both
new fields of struct class.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__29_May_2008_12_18_47_+1000_2pgdpsJmSjZxNd/n
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIPhKNTgG2atn1QN8RAhsqAJ90iZ7WzT2Pi/wMlpZlVEFZwczkGACfZyyo
2KYtoFK36sP6Mi7jTmuZKEM=
=DCUs
-----END PGP SIGNATURE-----

--Signature=_Thu__29_May_2008_12_18_47_+1000_2pgdpsJmSjZxNd/n--
