From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: perfmon3 tree build failure
Date: Fri, 7 Nov 2008 20:03:36 +1100
Message-ID: <20081107200336.57abfca7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__7_Nov_2008_20_03_36_+1100_.swv_kD_WHUYJ=u7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36728 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751396AbYKGJDu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Nov 2008 04:03:50 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: stephane eranian <eranian@googlemail.com>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__7_Nov_2008_20_03_36_+1100_.swv_kD_WHUYJ=u7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephane,

Today's linux-next build (x86_64 allmodconfig) failed like this:

In file included from arch/x86/perfmon/perfmon.c:26:
include/linux/perfmon_kern.h: In function 'pfm_exit_thread':
include/linux/perfmon_kern.h:200: error: 'struct task_struct' has no member=
 named 'pfm_context'

and lots more.  Caused by commit 46b4dfdc1dd4976d892fa47b5e8a2551fe6278fa
("perfmon(ia64): rename CONFIG_PERFMON to CONFIG_PERFMON_V20") which
probably should not have renamed CONFIG_PERFMON to CONFIG_PERFMON_V20 in
sched.h.

I would suggest that you clean this up by rebasing your tree onto Linus'
latest (to fix the merge conflicts) and in the process, do the
CONFIG_PERFMON rename patch first ...

I also got these errors:

perfmon/perfmon_file.c: In function 'pfm_alloc_fd':
perfmon/perfmon_file.c:270: error: 'struct task_struct' has no member named=
 'fsuid'
perfmon/perfmon_file.c:271: error: 'struct task_struct' has no member named=
 'fsgid'

These fields are being removed by another tree in linux-next, but there
are already accessor functions in Linus' tree that you should be using
anyway (see current_fsuid() and current_fsgid() in include/linux/cred.h).

So I will drop your tree for today in the hope that it will be fixed by
Monday.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__7_Nov_2008_20_03_36_+1100_.swv_kD_WHUYJ=u7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkUBGgACgkQjjKRsyhoI8yEJwCcCuSrhAgoelheSV6YV7+DyEn5
N8IAn1HgKf9dq57M1gokLir7j0jEdMYg
=BBJg
-----END PGP SIGNATURE-----

--Signature=_Fri__7_Nov_2008_20_03_36_+1100_.swv_kD_WHUYJ=u7--
