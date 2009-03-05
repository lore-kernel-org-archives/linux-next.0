From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  tree build failure
Date: Thu, 5 Mar 2009 18:41:07 +1100
Message-ID: <20090305184107.0926b4cd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__5_Mar_2009_18_41_07_+1100_F4nj6RP9ULsoHjxq"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37698 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751295AbZCEHlR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Mar 2009 02:41:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>

--Signature=_Thu__5_Mar_2009_18_41_07_+1100_F4nj6RP9ULsoHjxq
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next build (powerpc allyesconfig) failed like this:

kernel/sched.c: In function 'cpu_to_phys_group':
kernel/sched.c:7437: error: implicit declaration of function 'cpu_sibling_m=
ask'
kernel/sched.c:7437: warning: passing argument 2 of 'cpumask_and' makes poi=
nter from integer without a cast
kernel/sched.c: In function '__build_sched_domains':
kernel/sched.c:7780: warning: passing argument 2 of 'cpumask_and' makes poi=
nter from integer without a cast
kernel/sched.c:7790: warning: passing argument 2 of 'cpumask_and' makes poi=
nter from integer without a cast

Caused by commit 6034a37f9dff70fea021bf3a2dcdc356bccb88b3
("cpumask:use-cpu_sibling_mask") which introduced uses of
cpu_sibling_mask which is only defined for x86 ...

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__5_Mar_2009_18_41_07_+1100_F4nj6RP9ULsoHjxq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmvghMACgkQjjKRsyhoI8xZ5ACgmdohk7It1sKK7BFHIJvtxUhx
gzQAnjMWqi10zoDOf1l0lKhbeyJuyUVN
=u0MY
-----END PGP SIGNATURE-----

--Signature=_Thu__5_Mar_2009_18_41_07_+1100_F4nj6RP9ULsoHjxq--
