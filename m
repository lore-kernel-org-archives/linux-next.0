From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sched tree
Date: Tue, 1 Jul 2008 12:42:06 +1000
Message-ID: <20080701124206.77ff77cd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jul_2008_12_42_06_+1000_Q9iygG8D6Gtn1c7o"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45544 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750765AbYGACmP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 22:42:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__1_Jul_2008_12_42_06_+1000_Q9iygG8D6Gtn1c7o
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sched tree got a conflict in
kernel/sched.c between commit 040ec23d07f95285e9777a85cda29cb339a3065b
("sched: sched_clock() lockdep fix") from the  tree and commit
76a2a6ee8a0660a29127f05989ac59ae1ce865fa ("sched: sched_clock_cpu() based
cpu_clock()") from the sched tree.

The former updated some code that the latter removed.  I used the version
from the sched tree.

There was also a conflict in kernel/sched_rt.c between commit
363ab6f1424cdea63e5d182312d60e19077b892a ("core: use performance variant
for_each_cpu_mask_nr") from the cpus4096 tree and commit
eff6549b957d15d1ad168d90b8c1eb643b9c163f ("sched: rt: move some code
around") from the sched tree.

Again I took the version from the sched tree except for the
for_each_cpu_mask -> for_each_cpu_mask_nr transformation.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jul_2008_12_42_06_+1000_Q9iygG8D6Gtn1c7o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhpmX4ACgkQjjKRsyhoI8ylUQCfQZlD6P3EOEZQQ326hNsfX9h6
hIYAn3zMLbbdktKTv9w6/9OQz7bczzzm
=GKQK
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jul_2008_12_42_06_+1000_Q9iygG8D6Gtn1c7o--
