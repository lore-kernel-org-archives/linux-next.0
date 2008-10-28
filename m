From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cpu_alloc tree
Date: Tue, 28 Oct 2008 17:05:44 +1100
Message-ID: <20081028170544.3658fb09.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__28_Oct_2008_17_05_44_+1100_=Wdm_F35Md0lc5fX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52679 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752263AbYJ1GFx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Oct 2008 02:05:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rusty Russell <rusty@rustcorp.com.au>, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>

--Signature=_Tue__28_Oct_2008_17_05_44_+1100_=Wdm_F35Md0lc5fX
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

Today's linux-next merge of the cpu_alloc tree got a conflict in
kernel/module.c between commit d3794979a8a80c222ce9d016a6dfc4bed36965d0
("Zero based percpu: infrastructure to rebase the per cpu area to zero")
from the tip-core tree and commit
3ba98730fe1feb5b3fd9747fa1d3d629cd7ec0f7 ("cpualloc: use cpu allocator
instead of the builtin modules per cpu allocator") from the cpu_alloc
tree.

The latter removed code that the former modified.  I removed the code and
can carry this fix.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__28_Oct_2008_17_05_44_+1100_=Wdm_F35Md0lc5fX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkGq7gACgkQjjKRsyhoI8zDqwCeOMss98gKDzxC40EY7uNNvJJG
ksYAn0IMuCqtwZCoRj4UCYoaRCLiYbgY
=oaSS
-----END PGP SIGNATURE-----

--Signature=_Tue__28_Oct_2008_17_05_44_+1100_=Wdm_F35Md0lc5fX--
