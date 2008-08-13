From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree
Date: Wed, 13 Aug 2008 15:26:01 +1000
Message-ID: <20080813152601.305099ed.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__13_Aug_2008_15_26_01_+1000_=9P0.VHSLapHtB0C"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41312 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751324AbYHMF0K (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Aug 2008 01:26:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Christoph Lameter <cl@linux-foundation.org>

--Signature=_Wed__13_Aug_2008_15_26_01_+1000_=9P0.VHSLapHtB0C
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kmemcheck tree got a trivial conflict in
mm/Makefile between commit 5db80305ad7ea891246aec24204630c2925e7b12
("kmemtrace: Core implementation") from the slab tree and commit
e6df1035b1b488cafde1e69f1a25f2706c3ac1f7 ("kmemcheck: add mm functions")
from the kmemcheck tree.

The latter removed an empty line that the former replaced.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__13_Aug_2008_15_26_01_+1000_=9P0.VHSLapHtB0C
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiicGkACgkQjjKRsyhoI8yAngCdFpxHLlS5BGiWoG1Ci6+PjkWO
PwMAn19K8z+COFm38w/xBBdsT6mUlc5o
=Sphl
-----END PGP SIGNATURE-----

--Signature=_Wed__13_Aug_2008_15_26_01_+1000_=9P0.VHSLapHtB0C--
