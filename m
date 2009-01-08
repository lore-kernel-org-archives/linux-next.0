From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure
Date: Thu, 8 Jan 2009 16:20:07 +1100
Message-ID: <20090108162007.e77ca43e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__8_Jan_2009_16_20_07_+1100_hF1lN.Nu8TgJIZ+w"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54406 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750821AbZAHFUV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 8 Jan 2009 00:20:21 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__8_Jan_2009_16_20_07_+1100_hF1lN.Nu8TgJIZ+w
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (sparc64 defconfig) failed like this:

drivers/base/topology.c: In function 'show_physical_package_id':
drivers/base/topology.c:103: error: implicit declaration of function 'cpu_d=
ata'
drivers/base/topology.c:103: error: request for member 'proc_id' in somethi=
ng not a structure or union
drivers/base/topology.c: In function 'show_core_id':
drivers/base/topology.c:106: error: request for member 'core_id' in somethi=
ng not a structure or union

I cherry-picked the fix out of Linus' tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__8_Jan_2009_16_20_07_+1100_hF1lN.Nu8TgJIZ+w
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklljQcACgkQjjKRsyhoI8yL+wCgndvVOpcrVnocGcPmHZPE5fOW
s+oAoJrFUYVDfQrVoTj+qxD49MGodMqw
=RgW7
-----END PGP SIGNATURE-----

--Signature=_Thu__8_Jan_2009_16_20_07_+1100_hF1lN.Nu8TgJIZ+w--
