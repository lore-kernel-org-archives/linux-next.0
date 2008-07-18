From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Fri, 18 Jul 2008 18:23:03 +1000
Message-ID: <20080718182303.083671d5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__18_Jul_2008_18_23_03_+1000_SJTTehHdEMnQy7.f"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43214 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752752AbYGRIXM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 04:23:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

--Signature=_Fri__18_Jul_2008_18_23_03_+1000_SJTTehHdEMnQy7.f
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/usb/serial/airprime.c between commit
0cc220d6bfe0d92843868a8dd4f0bd427fe6d8e2 ("USB: delete airprime driver")
from the usb tree and commit 255ba432f804717e8a2d6096aa2d92e970f61c3d
("usb-serial-api-change") from the ttydev tree.

I just removed the file.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__18_Jul_2008_18_23_03_+1000_SJTTehHdEMnQy7.f
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiAUucACgkQjjKRsyhoI8w/DQCfRTWfwKAAxx97QEtM7IDdhxO/
/joAn2/NzJ77JQxQD75FbpdaGy0gfhtZ
=C61+
-----END PGP SIGNATURE-----

--Signature=_Fri__18_Jul_2008_18_23_03_+1000_SJTTehHdEMnQy7.f--
