From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the suspend tree
Date: Thu, 5 May 2011 12:11:17 +1000
Message-ID: <20110505121117.3b9b3fb3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__5_May_2011_12_11_17_+1000_IlRih7mJ_TL5L/9U"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58112 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752334Ab1EECL2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 May 2011 22:11:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Valdis Kletnieks <valdis.kletnieks@vt.edu>

--Signature=_Thu__5_May_2011_12_11_17_+1000_IlRih7mJ_TL5L/9U
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

After merging the suspend tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "usermodehelper_is_disabled" [drivers/base/firmware_class.ko] undefi=
ned!

Caused by commit d5fef1145404 ("PM: Print a warning if firmware is
requested when tasks are frozen").

I have used the suspend tree from next-20110504 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__5_May_2011_12_11_17_+1000_IlRih7mJ_TL5L/9U
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJNwgdFAAoJEDMEi1NhKgbsDfsH/37Xx4XLzJyPNs9zYbH2u8qO
Wzz5b3REsNxOSWmg4Y9mk55xIggzd3n/klxmQGbpx3RKKI2Ybc6pLnSAYSlFbXNl
vtsBwwjQPD0O7ZMPywCW3lMnMtD92+u71P4g00BLUqTEO6ubGk5dw5mx+0lHALmv
cg57FpjyKWcoI9DnNslfREF3AKeLQJc7hZPwWW6ikvkT2iUsayWtrjXLMybOuYWE
N83znUz0TWXklx4UhPS7FzqWadvLodwZ89YXG00IldYVoNEIrmxXg6JR4KDUOTaW
MNC9jTlWzwwo2HNkiW8UkeIdCPZbjFYU6Qn1vgMNnerML3huv79LuIExmqOzwUk=
=gPh0
-----END PGP SIGNATURE-----

--Signature=_Thu__5_May_2011_12_11_17_+1000_IlRih7mJ_TL5L/9U--
