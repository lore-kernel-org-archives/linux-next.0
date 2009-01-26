From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: driver-core tree build failure
Date: Mon, 26 Jan 2009 11:50:44 +1100
Message-ID: <20090126115044.0b2e3936.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__26_Jan_2009_11_50_44_+1100_AP.lJ9++Y.VaAdfe"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36425 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750786AbZAZAuy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 25 Jan 2009 19:50:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>

--Signature=_Mon__26_Jan_2009_11_50_44_+1100_AP.lJ9++Y.VaAdfe
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

arch/powerpc/platforms/ps3/system-bus.c: In function 'ps3_system_bus_probe':
arch/powerpc/platforms/ps3/system-bus.c:379: error: 'struct device' has no =
member named 'bus_id'
arch/powerpc/platforms/ps3/system-bus.c: In function 'ps3_system_bus_remove=
':
arch/powerpc/platforms/ps3/system-bus.c:401: error: 'struct device' has no =
member named 'bus_id'

Caused by commit aab0d375e01d8c16e7e5b9bd915dfaa0a815418f ("powerpc:
struct device - replace bus_id with dev_name(), dev_set_name()") not
being thorough enough before commit
73babb2d89a71d2110b65aab658e6309748827c2 ("driver core: get rid of struct
device's bus_id string array") was applied.

I have reverted the latter commit.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__26_Jan_2009_11_50_44_+1100_AP.lJ9++Y.VaAdfe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkl9COQACgkQjjKRsyhoI8y2KQCggeW9YQbDO0IcLwQ2wUPE35C5
AS8AoLZfKikkz3vgiP8zNBnVp5MJSwIE
=lFoB
-----END PGP SIGNATURE-----

--Signature=_Mon__26_Jan_2009_11_50_44_+1100_AP.lJ9++Y.VaAdfe--
