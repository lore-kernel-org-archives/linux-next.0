From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: usb tree build warning
Date: Mon, 30 Nov 2009 17:01:28 +1100
Message-ID: <20091130170128.db346120.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__30_Nov_2009_17_01_28_+1100_AdvViXo9aU/k_MV6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51600 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750869AbZK3GBZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Nov 2009 01:01:25 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>

--Signature=_Mon__30_Nov_2009_17_01_28_+1100_AdvViXo9aU/k_MV6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

drivers/net/wimax/i2400m/usb.c: In function 'i2400mu_suspend':
drivers/net/wimax/i2400m/usb.c:595: warning: unused variable 'usb_dev'

Introduced by commit a85c653a3945350875611d3cb071a0143cfeb2d2 ("USB:
remove the auto_pm flag") which removed the last usage in this function.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__30_Nov_2009_17_01_28_+1100_AdvViXo9aU/k_MV6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksTX7gACgkQjjKRsyhoI8xWuACfUSmf6xGfSqRbrlyXWNtiKhux
eYUAoKershDTtUadLidv7GdpScwOrndo
=djQj
-----END PGP SIGNATURE-----

--Signature=_Mon__30_Nov_2009_17_01_28_+1100_AdvViXo9aU/k_MV6--
