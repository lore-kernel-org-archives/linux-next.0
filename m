From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the percpu tree with Linus' tree
Date: Mon, 7 Sep 2009 18:22:29 +1000
Message-ID: <20090907182229.734c31d2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Sep_2009_18_22_29_+1000_4_uh0S8_iFiKIt3e"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59959 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751871AbZIGIWf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Sep 2009 04:22:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__7_Sep_2009_18_22_29_+1000_4_uh0S8_iFiKIt3e
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the percpu tree got a conflict in mm/percpu.c
between commit 04a13c7c632e1fe04a5f6e6c83565d2559e37598 ("percpu: don't
assume existence of cpu0") from Linus' tree and commit pcpu_chunk_page_occu=
pied ("percpu: drop pcpu_chunk->page[]") from the percpu tree.

I *think* the changes in the percpu tree supercede those in Linus' tree,
so I have used those.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Sep_2009_18_22_29_+1000_4_uh0S8_iFiKIt3e
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqkwsUACgkQjjKRsyhoI8wxLQCfXhHLFOID5aHVu8nGQ4Zngt93
HcwAoLDHefgqqjxiln4eMftZicxjsjb8
=8J/L
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Sep_2009_18_22_29_+1000_4_uh0S8_iFiKIt3e--
