From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Mon, 5 Jan 2009 14:32:39 +1100
Message-ID: <20090105143239.08b1a060.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__5_Jan_2009_14_32_39_+1100_mlaZpo7/B1wDiOhu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44858 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751985AbZAEDc5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 4 Jan 2009 22:32:57 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>, Christoph Lameter <clameter@sgi.com>

--Signature=_Mon__5_Jan_2009_14_32_39_+1100_mlaZpo7/B1wDiOhu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in kernel/module.c
between commit d3794979a8a80c222ce9d016a6dfc4bed36965d0 ("Zero based
percpu: infrastructure to rebase the per cpu area to zero") from the
tip-core tree and the cpualloc patches from the rr tree.

It requires better understanding than I have time for today, so I have
dropped the rr tree for today.

Similarly with init/main.c, include/linux/percpu.h,
include/asm-generic/percpu.h and arch/x86/include/asm/percpu.h (though
against different commits/trees, of course).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__5_Jan_2009_14_32_39_+1100_mlaZpo7/B1wDiOhu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklhf1cACgkQjjKRsyhoI8zhVgCgs8dYUyAgUnsuLPJUs0ravlqH
eUEAmwUoW4LLyM2u/06N9R4p73OVAZuh
=xh4A
-----END PGP SIGNATURE-----

--Signature=_Mon__5_Jan_2009_14_32_39_+1100_mlaZpo7/B1wDiOhu--
