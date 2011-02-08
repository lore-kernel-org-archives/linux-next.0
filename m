From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drivers-x86 tree
Date: Tue, 8 Feb 2011 14:45:22 +1100
Message-ID: <20110208144522.ecea74db.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__8_Feb_2011_14_45_22_+1100_eJ+XS2ArLGQDjqk/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36162 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750762Ab1BHDpc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Feb 2011 22:45:32 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

--Signature=_Tue__8_Feb_2011_14_45_22_+1100_eJ+XS2ArLGQDjqk/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Matthew,

After merging the drivers-x86 tree, today's linux-next build (x86_64_allmod=
config)
failed like this:

drivers/platform/x86/eeepc-wmi.c:118: error: 'KEY_CAMERA_ZOOMIN' undeclared=
 here (not in a function)
drivers/platform/x86/eeepc-wmi.c:124: error: 'KEY_CAMERA_ZOOMOUT' undeclare=
d here (not in a function)
drivers/platform/x86/eeepc-wmi.c:125: error: 'KEY_CAMERA_UP' undeclared her=
e (not in a function)
drivers/platform/x86/eeepc-wmi.c:126: error: 'KEY_CAMERA_DOWN' undeclared h=
ere (not in a function)
drivers/platform/x86/eeepc-wmi.c:127: error: 'KEY_CAMERA_LEFT' undeclared h=
ere (not in a function)
drivers/platform/x86/eeepc-wmi.c:128: error: 'KEY_CAMERA_RIGHT' undeclared =
here (not in a function)

Caused by commit 8e077c067a95956859341cd0caddabd99371c7b7 ("eeepc-wmi:
add camera keys").  Presumably a missing update to a header file ...

I have used the drivers-x86 tree from next-20110207 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__8_Feb_2011_14_45_22_+1100_eJ+XS2ArLGQDjqk/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJNULxSAAoJEDMEi1NhKgbs5GIH/ArrcCW6G+bIWdbHwGqlOWKX
g7h0cqu04ezCZnPEwCXtoFbaKoqBRyrCU2MvKvyRNK12ue7TYza21X6OH7TJXwt0
Nl2NjbGxJEILW4kHr9YJVMe7UyStybnmKl7uFw26rIOZGMz9s0ztwr2nvBPxJUj8
WMZPzESYYMF5a4bjtqTH6q1Z2EDZSVJ+Y3mD7jKPWucXnsbPoW8HuMRg3cVZTvqs
xO7BdbhjCIvlCbXgCtVRo0cmnEEPH49HzJRPSNOKAZycrPcu3jqp8ptll0kQqFTj
1allZ/8EbNlRJdm6cradydN4g5PWbk6TzdA3w2RjVUw2EshJsz/7qQVzNPe/ZFk=
=K8z2
-----END PGP SIGNATURE-----

--Signature=_Tue__8_Feb_2011_14_45_22_+1100_eJ+XS2ArLGQDjqk/--
