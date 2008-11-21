From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net tree build failure
Date: Fri, 21 Nov 2008 13:44:57 +1100
Message-ID: <20081121134457.85e1d384.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__21_Nov_2008_13_44_57_+1100_vYGd6fMFO+qghxo2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50307 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751395AbYKUCpL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 20 Nov 2008 21:45:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Stephen Hemminger <shemminger@vyatta.com>

--Signature=_Fri__21_Nov_2008_13_44_57_+1100_vYGd6fMFO+qghxo2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/net/acenic.c:461: error: 'ace_vlan_rx_register' undeclared here (no=
t in a function)

Caused by commit d8b83c57a7e497cba9b5cb156e63176323035785 ("acenic:
convert to net_device_ops").  This commit should also be looked at
again as ace_vlan_rx_register() is only defined if ACENIC_DO_VLAN is
set but it is used in net_device_ops unconditionally.   And it needs to
be forward declared to get rid of the compiler error above, of course.

I have dropped the net tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__21_Nov_2008_13_44_57_+1100_vYGd6fMFO+qghxo2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkmIKkACgkQjjKRsyhoI8yUuQCfQrnYp8HqJwL7SPoZopGvLXa0
lo4An05TldBizHkyl/+epdM8/6PPMCwp
=P71S
-----END PGP SIGNATURE-----

--Signature=_Fri__21_Nov_2008_13_44_57_+1100_vYGd6fMFO+qghxo2--
