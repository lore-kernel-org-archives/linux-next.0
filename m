From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: percpu tree build failure
Date: Wed, 25 Nov 2009 23:41:33 +1100
Message-ID: <20091125234133.4d603f48.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Nov_2009_23_41_33_+1100_Vc+EMHFwSLWu1hH+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50485 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934553AbZKYMlf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Nov 2009 07:41:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Vivek Goyal <vgoyal@redhat.com>

--Signature=_Wed__25_Nov_2009_23_41_33_+1100_Vc+EMHFwSLWu1hH+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (sparc64 defconfig) failed like this:

mm/percpu.c: In function 'per_cpu_ptr_to_phys':
mm/percpu.c:1321: error: implicit declaration of function 'page_to_phys'

Caused by commit 9a453506c3503929654112851e27b8c64c693912 ("percpu: Fix
kdump failure if booted with percpu_alloc=3Dpage").  I reverted the merge
commit (due to dependencies) that merged the above
(25b1a9ccfdd0e3dc306a1e3a354ba5480c4b0dd9 "Merge branch 'for-linus' into
for-next to receive per_cpu_ptr_to_phys ().") for today.  The branch
being merged had only that one commit in it.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Nov_2009_23_41_33_+1100_Vc+EMHFwSLWu1hH+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksNJf0ACgkQjjKRsyhoI8xa3gCgucV2PLYl2MLOdDfhdsin4VCA
RjIAmgK7oE2yh2MSOorW1X+5pfs2E/bI
=U8Ip
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Nov_2009_23_41_33_+1100_Vc+EMHFwSLWu1hH+--
