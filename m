From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: tty tree build warning
Date: Wed, 20 Jan 2010 17:19:01 +1100
Message-ID: <20100120171901.b2e06465.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__20_Jan_2010_17_19_01_+1100_R7YgmxvDIjWFoZgA"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34668 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751416Ab0ATGTG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Jan 2010 01:19:06 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rakib Mullick <rakib.mullick@gmail.com>

--Signature=_Wed__20_Jan_2010_17_19_01_+1100_R7YgmxvDIjWFoZgA
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

drivers/char/ip2/ip2main.c:511: warning: 'ip2_setup' defined but not used

Introduced by commit 3f042287578018e0dc1c38b6f684767e657db62f ("ip2:
remove #ifdef MODULE from ip2main.c").

__setup() is a noop if CONFIG_MODULE is defined.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__20_Jan_2010_17_19_01_+1100_R7YgmxvDIjWFoZgA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktWoFUACgkQjjKRsyhoI8y/BACfQs5CTHtenOPE+O1ubKP8CeUh
yXgAnihkX/Q/RVv/DzYMPkEdKxLamRKF
=bQEf
-----END PGP SIGNATURE-----

--Signature=_Wed__20_Jan_2010_17_19_01_+1100_R7YgmxvDIjWFoZgA--
