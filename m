From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: slab tree build warning
Date: Wed, 4 Feb 2009 18:38:47 +1100
Message-ID: <20090204183847.771df81b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__4_Feb_2009_18_38_47_+1100_lcm7dfkLhdSKLqi."
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41810 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751122AbZBDHiy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Feb 2009 02:38:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Nick Piggin <npiggin@suse.de>

--Signature=_Wed__4_Feb_2009_18_38_47_+1100_lcm7dfkLhdSKLqi.
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (powerpc allnoconfig) produced this warning:

mm/slqb.c: In function 'kmem_cache_open':
mm/slqb.c:2180: warning: label 'error_lock' defined but not used
mm/slqb.c:2176: warning: label 'error_cpu_array' defined but not used

Caused by commit 8b9ffd9d52479bd17b5729c9f3acaefa90c7e585 ("slqb: dynamic
array allocations").

Clearly neither CONFIG_SMP not CONFIG_NUMA is set.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__4_Feb_2009_18_38_47_+1100_lcm7dfkLhdSKLqi.
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmJRgcACgkQjjKRsyhoI8xRmgCfc/3mv7G/ts1uVo82oO+gek3f
WkoAn1CMQvcorpfkSBopFrnjAwFH9RM2
=DA2t
-----END PGP SIGNATURE-----

--Signature=_Wed__4_Feb_2009_18_38_47_+1100_lcm7dfkLhdSKLqi.--
