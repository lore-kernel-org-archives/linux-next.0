From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Thu, 3 Jul 2008 15:03:28 +1000
Message-ID: <20080703150328.44061d16.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__3_Jul_2008_15_03_28_+1000_78l8e.3.9U3FbAfl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50375 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753466AbYGCFDy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Jul 2008 01:03:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

--Signature=_Thu__3_Jul_2008_15_03_28_+1000_78l8e.3.9U3FbAfl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
kernel/stop_machine.c between commit
961ccddd59d627b89bd3dc284b6517833bbdf25d ("sched: add new API
sched_setscheduler_nocheck: add a flag to control access checks") from
the sched tree (which appears to also be in the rr tree) and commit
e5e62fcd081b0837f6210eb4ed022e9d8920bc59 ("stop_machine:simplify") from
the rr tree.

I used the version in the rr tree.  Probably worth a look when I publish
the tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__3_Jul_2008_15_03_28_+1000_78l8e.3.9U3FbAfl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhsXaAACgkQjjKRsyhoI8wChwCcD/WRoyg9XlyQBx2H2C/09OYT
qiYAnA3+agAdBleP/ZRwN+v5eXoKeN86
=4KLi
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Jul_2008_15_03_28_+1000_78l8e.3.9U3FbAfl--
