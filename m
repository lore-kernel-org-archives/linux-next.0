From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree
Date: Mon, 7 Jul 2008 13:09:41 +1000
Message-ID: <20080707130941.53fe052f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Jul_2008_13_09_41_+1000_3IfX2LzZ1Wo+0oBo"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47892 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753804AbYGGDJx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 6 Jul 2008 23:09:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>

--Signature=_Mon__7_Jul_2008_13_09_41_+1000_3IfX2LzZ1Wo+0oBo
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in
drivers/usb/core/hub.c between commit
09ca8adbe9f724a7e96f512c0039c4c4a1c5dcc0 ("Revert "USB: don't explicitly
reenable root-hub status interrupts"") from Linus' tree and commit
hub_events ("USB: simplify hub_restart() logic") from the usb tree.

I fixed it up but definitely worth a check to make sure that the end of
hub_events() still make sense.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Jul_2008_13_09_41_+1000_3IfX2LzZ1Wo+0oBo
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhxiPUACgkQjjKRsyhoI8xuygCfVOMReZkN1LZFwERoATtA0a39
h5AAnin7xM6KqQqHcN6EiZq/lMciKQpL
=a5MV
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Jul_2008_13_09_41_+1000_3IfX2LzZ1Wo+0oBo--
