From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: hid/upstream merge conflicts
Date: Wed, 4 Jun 2008 12:08:31 +1000
Message-ID: <20080604120831.80410876.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__4_Jun_2008_12_08_32_+1000_vBhNVBWLVpjCe5yc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53097 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751263AbYFDCIk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Jun 2008 22:08:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jikos@jikos.cz>
Cc: linux-next@vger.kernel.org, Alexandre Karpenko <alexander@comm.utoronto.ca>, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Wed__4_Jun_2008_12_08_32_+1000_vBhNVBWLVpjCe5yc
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

Today's linux-next merge of the hid tree got a conflict in
drivers/hid/usbhid/hid-quirks.c between commit
6e7045990f35ef9250804b3fd85e855b8c2aaeb6 ("HID: split Numlock emulation
quirk from HID_QUIRK_APPLE_HAS_FN.") from Linus' tree and commit
6560721d37b404f3c16ce3dfe7517386198fa13a ("HID: add fn key support on
Macbook Pro 4,1 and Macbook Air") from the hid tree.

It wasn't obvious how to best fixup the conflict, so I just took the
version from Linus' tree for today.  You might want to either rebase the
hid tree on top of Linus' latest or just merge in Linus' latest and fix
the conflict yourself.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__4_Jun_2008_12_08_32_+1000_vBhNVBWLVpjCe5yc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIRfklTgG2atn1QN8RAg7tAJ9QSPEV7wj0XYzA/PlOwpX0NsZO8QCfbgx5
BK4kUtC7blGEet874/l3Ct0=
=8SeA
-----END PGP SIGNATURE-----

--Signature=_Wed__4_Jun_2008_12_08_32_+1000_vBhNVBWLVpjCe5yc--
