From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ide tree with the driver-core tree
Date: Mon, 26 Jan 2009 12:50:11 +1100
Message-ID: <20090126125011.e060bd19.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__26_Jan_2009_12_50_11_+1100_SW=ol=7fboqXYPm/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41238 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751089AbZAZBuU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 25 Jan 2009 20:50:20 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Greg KH <greg@kroah.com>

--Signature=_Mon__26_Jan_2009_12_50_11_+1100_SW=ol=7fboqXYPm/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bartlomiej,

Today's linux-next merge of the ide tree got a conflict in
drivers/ide/ide-acpi.c between commit
ea23519ff92f553facc0a73fe4daab852c75a306 ("ide: struct device - replace
bus_id with dev_name(), dev_set_name()") from the driver-core tree and
commit d721aa90f7ba2059b007a9c13c9fb09db99ce467 ("ide-acpi: cleanup
do_drive_get_GTF()") from the ide tree.

The latter removed code that the former modified.  I used the latter
version.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__26_Jan_2009_12_50_11_+1100_SW=ol=7fboqXYPm/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkl9FtMACgkQjjKRsyhoI8xA3gCghTmH1tTEz8E8V/nfUDNpoWIb
kS8AoIQTFQ9YEzK2vbjMAAxYikHZrTMJ
=4Ri1
-----END PGP SIGNATURE-----

--Signature=_Mon__26_Jan_2009_12_50_11_+1100_SW=ol=7fboqXYPm/--
