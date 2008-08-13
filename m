From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree
Date: Wed, 13 Aug 2008 15:22:12 +1000
Message-ID: <20080813152212.632e48fa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__13_Aug_2008_15_22_12_+1000_9H=4EptvoJDrgCxl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41208 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751443AbYHMFWV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Aug 2008 01:22:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Christoph Lameter <cl@linux-foundation.org>

--Signature=_Wed__13_Aug_2008_15_22_12_+1000_9H=4EptvoJDrgCxl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kmemcheck tree got a conflict in
MAINTAINERS between commit 5db80305ad7ea891246aec24204630c2925e7b12
("kmemtrace: Core implementation") from the slab tree and commit
3994d3f08b618f9c40af1d402c3e4ecec946b5dc ("kmemcheck: add Vegard and
Pekka to MAINTAINERS") from the kmemcheck tree.

Simply overlapping additions. I added both.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__13_Aug_2008_15_22_12_+1000_9H=4EptvoJDrgCxl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiib4QACgkQjjKRsyhoI8x05ACfZRvvMCj2rgH+CeEPJ5SFrJig
Z38An0d8s+lupHQ4u1nPNvUfs6F4fVyV
=WLtY
-----END PGP SIGNATURE-----

--Signature=_Wed__13_Aug_2008_15_22_12_+1000_9H=4EptvoJDrgCxl--
