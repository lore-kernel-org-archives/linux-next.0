From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the hid tree
Date: Tue, 14 Oct 2008 17:51:43 +1100
Message-ID: <20081014175143.731c8280.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_17_51_43_+1100_xSa3nK9yePIoAib5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46509 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755542AbYJNHFm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 03:05:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jikos@jikos.cz>
Cc: linux-next@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>

--Signature=_Tue__14_Oct_2008_17_51_43_+1100_xSa3nK9yePIoAib5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

Today's linux-next merge of the hid tree got a conflict in
drivers/hid/hid-tmff.c between commits
454db62d208add27f30fcbcc00435768245407c9 ("USB: remove warn() macro from
usb hid drivers") and 3e85ea87fdfbb9440dacda77b4de30472e0d38c9 ("USB:
remove info() macro from usb HID drivers") from the usb tree and commit
a9c923a59c4f106ee7385a5b210215db3eeb1d8d ("HID: convert to dev_* prints")
from the hid tree.

I fixed it up (just used the hid tree versions) and can carry the fix.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Oct_2008_17_51_43_+1100_xSa3nK9yePIoAib5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj0QX8ACgkQjjKRsyhoI8zWpQCfSzDG+DUQOEL15Ygal2kUO/MX
CKYAnRsnzwR9oMBa6IVoVOXRQxRdO/Np
=bHtw
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_17_51_43_+1100_xSa3nK9yePIoAib5--
