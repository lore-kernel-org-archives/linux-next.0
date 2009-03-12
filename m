From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  tree build warning
Date: Thu, 12 Mar 2009 16:48:00 +1100
Message-ID: <20090312164800.f3e28bd9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__12_Mar_2009_16_48_00_+1100_5NVn3BUjJl19mCBM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60554 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750991AbZCLFsM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Mar 2009 01:48:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nick Piggin <npiggin@suse.de>
Cc: linux-next@vger.kernel.org, Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>

--Signature=_Thu__12_Mar_2009_16_48_00_+1100_5NVn3BUjJl19mCBM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nick,

Today's linux-next build (powerpc allnoconfig) produced this warning:

mm/slqb.c:3122: warning: 'gather_stats' defined but not used

$ grep SLQB .config
CONFIG_SLQB=3Dy
# CONFIG_SLQB_DEBUG is not set
# CONFIG_SLQB_SYSFS is not set

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__12_Mar_2009_16_48_00_+1100_5NVn3BUjJl19mCBM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm4ohAACgkQjjKRsyhoI8yUMQCfSkeXBk0bv/+ArMkSMaxVleny
KVYAoIZxUs9IQ9g7rqNEAalJg399Ri5X
=/l0j
-----END PGP SIGNATURE-----

--Signature=_Thu__12_Mar_2009_16_48_00_+1100_5NVn3BUjJl19mCBM--
