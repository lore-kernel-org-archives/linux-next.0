From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the generic-ipi tree
Date: Thu, 3 Jul 2008 16:40:31 +1000
Message-ID: <20080703164031.2d876e34.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__3_Jul_2008_16_40_31_+1000_at52arTsAO+D/P_e"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57924 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755244AbYGCGki (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Jul 2008 02:40:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>, Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

--Signature=_Thu__3_Jul_2008_16_40_31_+1000_at52arTsAO+D/P_e
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo, Jens,

Today's linux-next merge of the generic-ipi tree got a conflict in
arch/powerpc/mm/slice.c between commit
3a8247cc2c856930f34eafce33f6a039227ee175 ("powerpc: Only demote
individual slices rather than whole process") from the powerpc tree and
commit 15c8b6c1aaaf1c4edd67e2f02e4d8e1bd1a51c0d ("on_each_cpu(): kill
unused 'retry' parameter") from the generic-ipi tree.

The former removes the code that the latter modifies.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__3_Jul_2008_16_40_31_+1000_at52arTsAO+D/P_e
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhsdF8ACgkQjjKRsyhoI8wqRwCgs+9KUjlmW1qHRUqlyBO4ZA+S
o+EAnR+s/hhxH8pmwLrC6tLDaWp5kBJW
=0jq2
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Jul_2008_16_40_31_+1000_at52arTsAO+D/P_e--
