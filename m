From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pm tree
Date: Mon, 13 Apr 2015 14:24:42 +1000
Message-ID: <20150413142442.2f7107e5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/wQd_Ak5TvD_LSZFUNsW5WJr"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47782 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750843AbbDMEYv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2015 00:24:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>, Dasaratharaman Chandramouli <dasaratharaman.chandramouli@intel.com>

--Sig_/wQd_Ak5TvD_LSZFUNsW5WJr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from arch/x86/include/asm/msr.h:131:0,
                 from arch/x86/include/asm/processor.h:20,
                 from arch/x86/include/asm/thread_info.h:23,
                 from include/linux/thread_info.h:54,
                 from arch/x86/include/asm/preempt.h:6,
                 from include/linux/preempt.h:18,
                 from include/linux/smp.h:55,
                 from include/linux/kernel_stat.h:4,
                 from drivers/cpufreq/intel_pstate.c:14:
drivers/cpufreq/intel_pstate.c: In function 'knl_get_turbo_pstate':
drivers/cpufreq/intel_pstate.c:622:9: error: 'MSR_NHM_TURBO_RATIO_LIMIT' un=
declared (first use in this function)
  rdmsrl(MSR_NHM_TURBO_RATIO_LIMIT, value);
         ^
arch/x86/include/asm/paravirt.h:153:26: note: in definition of macro 'rdmsr=
l'
  val =3D paravirt_read_msr(msr, &_err); \
                          ^
drivers/cpufreq/intel_pstate.c:622:9: note: each undeclared identifier is r=
eported only once for each function it appears in
  rdmsrl(MSR_NHM_TURBO_RATIO_LIMIT, value);
         ^
arch/x86/include/asm/paravirt.h:153:26: note: in definition of macro 'rdmsr=
l'
  val =3D paravirt_read_msr(msr, &_err); \
                          ^

Caused by commit 6acfd09a439a ("tools/power turbostat: define and dump
MSR_TURBO_RATIO_LIMIT2") interacting with commit b34ef932d79a
("intel_pstate: Knights Landing support").  This should have been
resolved in commit 08fb40f3fbeb ("Merge branches 'powercap' and
'pm-tools'").

I have added the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 13 Apr 2015 14:11:11 +1000
Subject: [PATCH] intel_pstate: fix bad merge (MSR_NHM_TURBO_RATIO_LIMIT ren=
ame)

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/cpufreq/intel_pstate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index 875154d5f60b..5ecd2689a8fc 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -619,7 +619,7 @@ static int knl_get_turbo_pstate(void)
 	u64 value;
 	int nont, ret;
=20
-	rdmsrl(MSR_NHM_TURBO_RATIO_LIMIT, value);
+	rdmsrl(MSR_TURBO_RATIO_LIMIT, value);
 	nont =3D core_get_max_pstate();
 	ret =3D (((value) >> 8) & 0xFF);
 	if (ret <=3D nont)
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/wQd_Ak5TvD_LSZFUNsW5WJr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVK0UQAAoJEMDTa8Ir7ZwVyrAP/jWQmUyq5S063cQ8oQbhJKG1
ZqDgJGE0PM3CNaTzGzcHyBM9nHWxXvAuM728EaYcWJh/2hk6AyiJ7r749Hr6BfUM
wMXyldSm2IsxYbh0SUehK8ABgKWs/OI8G2pfvlJArWqW5iqE+rZ+bwoK41p435wl
ZQPqzyR1nd8YSX10GyGsw9wOGHMxdy0UA7AtOspap+et4BAnvYfw0xEKTmEqE3Ds
CCCcXP3KwVx/+Tm3OhMRFNldHaVsFSWuYtZ3LlZKFtxlwsYhfVr0JPlJAQYIkWYI
/tyCi6/YLmloP4CL1ZmjuU4Fz5Tcd7wq/Txe+nylhn8oehtknalv5iyVzN4GI72u
qJ89pv9x5KVAxgVXdvkQ029zJg/mIL2JK0l4XJYCwgKRFZbF9DeI67bspIyxV0UF
Q3DxB9BAqHR9tMOpqKW4x+QrLQt8/e3mfPmqmh0OtvkIkWoMIuKucdZo20Q/P1WI
7DV6gk9CEYg7kefzuWJWE6jencLdysMmaIYorHD5kwCvxQcZkAjJodzyj+lIQ0D1
XyBQCA6mqwGVSykw4vm6NrRaS5xR8X2fvxTUcW34EHtuMBKRL3wc1JfLiSirmiVa
1+ea18Vb8U+o15Hz/uAN/OPIHQrrVt9OA9XWNuOD14AADtYbHFGgNhuPieOzGIeP
87igSw6aawc7waEpKxxW
=zQ69
-----END PGP SIGNATURE-----

--Sig_/wQd_Ak5TvD_LSZFUNsW5WJr--
