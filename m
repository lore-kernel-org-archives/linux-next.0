From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: import of the rr quilt series
Date: Mon, 10 May 2010 09:24:40 +1000
Message-ID: <20100510092440.8c7909bc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__10_May_2010_09_24_40_+1000_ZBH2CelSnuYmKUjo"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48491 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752767Ab0EIXYs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 9 May 2010 19:24:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__10_May_2010_09_24_40_+1000_ZBH2CelSnuYmKUjo
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

The import of the rr quilt series produced this error:

Importing rr based on v2.6.34-rc6-201
fatal: Needed a single revision
Unknown BASE

since "v2.6.34-rc6-201" does not unambiguously identify a commit in
Linus' tree.  I have updated the BASE in the series file to
v2.6.34-rc6-201-g722154e (which seems sensible).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__10_May_2010_09_24_40_+1000_ZBH2CelSnuYmKUjo
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvnRDgACgkQjjKRsyhoI8yGNgCcCzL7+WBLQiejjWyMejfb0cbW
bvEAoLvxlXQEJlS1smeRRjRPfAhgsCGd
=X3CR
-----END PGP SIGNATURE-----

--Signature=_Mon__10_May_2010_09_24_40_+1000_ZBH2CelSnuYmKUjo--
