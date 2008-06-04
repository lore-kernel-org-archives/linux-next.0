From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: firmware merge conflicts
Date: Wed, 4 Jun 2008 16:07:42 +1000
Message-ID: <20080604160742.e4c66cd4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__4_Jun_2008_16_07_42_+1000_mNCIkVtiIai=Qv8B"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35573 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751742AbYFDGIA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Jun 2008 02:08:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Alan Cox <alan@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>, Takashi Iwai <tiwai@suse.de>

--Signature=_Wed__4_Jun_2008_16_07_42_+1000_mNCIkVtiIai=Qv8B
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the firmware tree got a few conflicts:

Commit 33f1dd02ed25db0790fec8a62b008c71831c49d9 ("ti_usb: kick firmware
into user space") from the usb tree against commit
e009cdbc2e96e72fe84df7cf014abcd7a7eb7dc7 ("ti_usb_3410_5052: use
request_firmware()") from the firmware tree.  These seem to have similar
goals but are using different methods.  This affected the files
drivers/usb/serial/Kconfig,
drivers/usb/serial/{ti_fw_3410.h,ti_fw_5052.h,ti_usb_3410_5052.c}.  I
have used the firmware tree version for now.

Some simple conflicts in sound/Kconfig due to commit
bd7d34e759d7537b42cffb7205b7b50dda6535bb ("sound: Convert to menuconfig")
from the sound tree.

Simple conflicts in sound/pci/maestro3.c and
sound/pci/ymfpci/ymfpci_main.c because "maestro3: treat firmware data as
const" and "ymfpci: treat firmware data as const" appear in both the
driver-core tree and the firmware tree.  The conflicts are because the
firmware tree further modifies these files.

So, you and Alan need to come to an agreement about ti_usb (and inform
Greg :-)).  And you should probably ask Greg to drop the to "const"
patches (or maybe the other way around).  And I can carry the
sound/Kconfig fixup.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__4_Jun_2008_16_07_42_+1000_mNCIkVtiIai=Qv8B
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIRjEzTgG2atn1QN8RApYTAJ98gwWG2OgDJryfT790a+2SO4K9OACfYrKD
/6zfkAeh7x11uYBPWV/z/ck=
=nVjJ
-----END PGP SIGNATURE-----

--Signature=_Wed__4_Jun_2008_16_07_42_+1000_mNCIkVtiIai=Qv8B--
