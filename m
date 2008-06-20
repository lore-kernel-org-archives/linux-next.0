From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: s390 build failure
Date: Fri, 20 Jun 2008 13:52:57 +1000
Message-ID: <20080620135257.102f024c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__20_Jun_2008_13_52_57_+1000_3Qy2zAh=F1gGG_W6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53744 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750749AbYFTDxT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Jun 2008 23:53:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Cornelia Huck <cornelia.huck@de.ibm.com>, linux-next@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>

--Signature=_Fri__20_Jun_2008_13_52_57_+1000_3Qy2zAh=F1gGG_W6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg, Cornelia,

Yesterday's (and back to next-20080612) linux-next build (s390
allnoconfig (and others) with an s390s compiler) fails with this error:

drivers/s390/cio/cio.c:573: error: 'struct device' has no member named 'ini=
t_name'

Bisecting lead to the commit "s390: bus_id -> dev_set_name() changes" in
the driver-core tree.  I suspect this was caused by the removal of
"driver core: add init_name to struct device" from the driver-core tree
on June 11 (even though the former patch was earlier in the series then
the latter).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__20_Jun_2008_13_52_57_+1000_3Qy2zAh=F1gGG_W6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhbKZkACgkQTgG2atn1QN+2UACgg58ekOhLwMzy6Dsx4oXoWAYV
zcYAn3HA4Ud4Q+xmRXH513EBCwdylXKS
=YDdN
-----END PGP SIGNATURE-----

--Signature=_Fri__20_Jun_2008_13_52_57_+1000_3Qy2zAh=F1gGG_W6--
