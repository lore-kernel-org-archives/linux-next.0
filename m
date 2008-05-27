From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: m68k/semaphore build failure
Date: Tue, 27 May 2008 20:10:38 +1000
Message-ID: <20080527201038.d70e23d6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__27_May_2008_20_10_38_+1000_r3oQpRlglD1DCGxi"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45665 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756118AbYE0KLE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 27 May 2008 06:11:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Wilcox <matthew@wil.cx>
Cc: linux-next@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

--Signature=_Tue__27_May_2008_20_10_38_+1000_r3oQpRlglD1DCGxi
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Willy,

Today's linux-next build (m68k multi_defconfig) failed like this:

drivers/input/keyboard/hil_kbd.c:336: error: 'PCI_VENDOR_ID_HP' undeclared =
(first use in this function)
drivers/input/keyboard/hil_kbd.c:336: error: (Each undeclared identifier is=
 reported only once
drivers/input/keyboard/hil_kbd.c:336: error: for each function it appears i=
n.)

This is caused by commit fd7c1a9773fd107674216b63a752f21ba6495045 ("Add
missing semaphore.h includes") from the semaphore tree.  That commit adds
a linux/semaphore.h include but removes the linux/pci_ids.h include.

Also this commit has no Signed-off-by.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__27_May_2008_20_10_38_+1000_r3oQpRlglD1DCGxi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIO94jTgG2atn1QN8RArgZAJ9GWH08rFQJ+9bciZHj0Ehw4c35hQCfRDtA
Vbt0O4BMDihQgqNvTYaNegs=
=hDTx
-----END PGP SIGNATURE-----

--Signature=_Tue__27_May_2008_20_10_38_+1000_r3oQpRlglD1DCGxi--
