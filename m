From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: drm tree build failure
Date: Mon, 12 Jan 2009 14:12:49 +1100
Message-ID: <20090112141249.f9d72f6c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__12_Jan_2009_14_12_49_+1100_4pw49QlUiGQ.EgUH"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35602 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752141AbZALDNE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 11 Jan 2009 22:13:04 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, Richard Purdie <rpurdie@linux.intel.com>

--Signature=_Mon__12_Jan_2009_14_12_49_+1100_4pw49QlUiGQ.EgUH
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/gpu/drm/i915/i915_dma.c: In function 'i915_initialize':
drivers/gpu/drm/i915/i915_dma.c:183: error: 'drm_i915_init_t' has no member=
 named 'sarea_priv'

Immediate cause is commit 21edb2690395e7a5281d0d5b5b8a9362491c9879
("drm/i915: setup sarea properly in master_priv").

I have dropped the drm tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__12_Jan_2009_14_12_49_+1100_4pw49QlUiGQ.EgUH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklqtTEACgkQjjKRsyhoI8z/5gCdG1RxC0kre45tGkVXUDVJzLLJ
r3wAnjfYhRsqsO9kCnvxaQPKmgzvwhJ7
=8PWY
-----END PGP SIGNATURE-----

--Signature=_Mon__12_Jan_2009_14_12_49_+1100_4pw49QlUiGQ.EgUH--
