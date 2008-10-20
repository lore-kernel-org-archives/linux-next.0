From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual import of the driver-core,current tree
Date: Mon, 20 Oct 2008 11:01:19 +1100
Message-ID: <20081020110119.6f01662a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__20_Oct_2008_11_01_19_+1100_oXLbNgE5uBFrbkXJ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57454 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751925AbYJTAB3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 19 Oct 2008 20:01:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__20_Oct_2008_11_01_19_+1100_oXLbNgE5uBFrbkXJ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next import of the driver-core.current tree got a conflict
in document-kernel-taint-flags-properly.patch.  It would not apply until
I removed the line

- 64 - A module from drivers/staging was loaded.

from the context.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__20_Oct_2008_11_01_19_+1100_oXLbNgE5uBFrbkXJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj7yk8ACgkQjjKRsyhoI8xsRQCfW/PXftKSd/N8mKcfiy90q20A
rtkAnRV/GTa9/4Zh/WpRMdCfVZ8r88uF
=qB1a
-----END PGP SIGNATURE-----

--Signature=_Mon__20_Oct_2008_11_01_19_+1100_oXLbNgE5uBFrbkXJ--
