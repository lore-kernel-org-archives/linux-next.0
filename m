From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree
 (jdelvare-hwmon tree related)
Date: Tue, 15 Mar 2011 19:24:28 +1100
Message-ID: <20110315192428.ce74a177.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__15_Mar_2011_19_24_28_+1100_IVD6P5ZWNyTxwMAC"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51266 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754699Ab1COIYr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Mar 2011 04:24:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

--Signature=_Tue__15_Mar_2011_19_24_28_+1100_IVD6P5ZWNyTxwMAC
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/hwmon/sch5627.c: In function 'sch5627_read_virtual_reg':
drivers/hwmon/sch5627.c:179: error: implicit declaration of function 'mslee=
p'

Caused by commit 19803daeb145 ("hwmon: New driver for SMSC SCH5627").
See Rule 1 in Documentation/SubmitChecklist.

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__15_Mar_2011_19_24_28_+1100_IVD6P5ZWNyTxwMAC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJNfyI8AAoJEDMEi1NhKgbsamkH/3X58iz955srOssiHFEtZ0iD
KYWIEpvOzMhBqpPA+3fKTo/aTiqFsy7CJ2TQ8cRt/tj9wGVFiNCUDQuqd+c6IFh0
jPMBE1mkxD2hyle3MCNJvUyGZs/9uL2TfHJk6lsBTCaLoIgMiYqLums9CiNSvM2Z
40cySuXLznLAeSnmxI8nby0je5CPOpHByPGiqMq3owcy4bjd1v36Srj9TFrn+nVa
extxwRPAppsfh88LYoAovtlIyb+LD2CQIUkGRIBquGfthW2GjEpgCATGNGKKpfWZ
8NyxOWBVJdHj7aJeuTxUCWfuURUpi3QehBDZIAjMHBHaUR+tnMQy9K8CJKOYeIs=
=/FA6
-----END PGP SIGNATURE-----

--Signature=_Tue__15_Mar_2011_19_24_28_+1100_IVD6P5ZWNyTxwMAC--
