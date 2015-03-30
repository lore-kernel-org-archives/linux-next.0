From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tip tree
Date: Mon, 30 Mar 2015 17:13:34 +1100
Message-ID: <20150330171334.6f377ba7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zhkqKsw_db745L06GAlqst."; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37086 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751370AbbC3GNm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Mar 2015 02:13:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Russell King <linux@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nathan Lynch <nathan_lynch@mentor.com>

--Sig_/zhkqKsw_db745L06GAlqst.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/kernel/vdso.c: In function 'tk_is_cntvct':
arch/arm/kernel/vdso.c:273:15: error: 'const struct timekeeper' has no memb=
er named 'tkr'
  if (strcmp(tk->tkr.clock->name, "arch_sys_counter") !=3D 0)
               ^
arch/arm/kernel/vdso.c: In function 'update_vsyscall':
arch/arm/kernel/vdso.c:319:32: error: 'struct timekeeper' has no member nam=
ed 'tkr'
   vdso_data->cs_cycle_last =3D tk->tkr.cycle_last;
                                ^
arch/arm/kernel/vdso.c:321:36: error: 'struct timekeeper' has no member nam=
ed 'tkr'
   vdso_data->xtime_clock_snsec =3D tk->tkr.xtime_nsec;
                                    ^
arch/arm/kernel/vdso.c:322:27: error: 'struct timekeeper' has no member nam=
ed 'tkr'
   vdso_data->cs_mult  =3D tk->tkr.mult;
                           ^
arch/arm/kernel/vdso.c:323:28: error: 'struct timekeeper' has no member nam=
ed 'tkr'
   vdso_data->cs_shift  =3D tk->tkr.shift;
                            ^
arch/arm/kernel/vdso.c:324:27: error: 'struct timekeeper' has no member nam=
ed 'tkr'
   vdso_data->cs_mask  =3D tk->tkr.mask;
                           ^

Caused by commit 876e78818def ("time: Rename timekeeper::tkr to
timekeeper::tkr_mono") from the tip tree interacting with commit
ecf99a439105 ("ARM: 8331/1: VDSO initialization, mapping, and
synchronization") from the arm tree.

I added this merge fix patch for today (is that all that is needed?):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 30 Mar 2015 17:08:21 +1100
Subject: [PATCH] ARM: VDSO: rename tkr to tkr_mono

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/arm/kernel/vdso.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/kernel/vdso.c b/arch/arm/kernel/vdso.c
index 0d31d3ccab81..efe17dd9b921 100644
--- a/arch/arm/kernel/vdso.c
+++ b/arch/arm/kernel/vdso.c
@@ -270,7 +270,7 @@ static bool tk_is_cntvct(const struct timekeeper *tk)
 	if (!IS_ENABLED(CONFIG_ARM_ARCH_TIMER))
 		return false;
=20
-	if (strcmp(tk->tkr.clock->name, "arch_sys_counter") !=3D 0)
+	if (strcmp(tk->tkr_mono.clock->name, "arch_sys_counter") !=3D 0)
 		return false;
=20
 	return true;
@@ -316,12 +316,12 @@ void update_vsyscall(struct timekeeper *tk)
 	vdso_data->wtm_clock_nsec		=3D wtm->tv_nsec;
=20
 	if (vdso_data->tk_is_cntvct) {
-		vdso_data->cs_cycle_last	=3D tk->tkr.cycle_last;
+		vdso_data->cs_cycle_last	=3D tk->tkr_mono.cycle_last;
 		vdso_data->xtime_clock_sec	=3D tk->xtime_sec;
-		vdso_data->xtime_clock_snsec	=3D tk->tkr.xtime_nsec;
-		vdso_data->cs_mult		=3D tk->tkr.mult;
-		vdso_data->cs_shift		=3D tk->tkr.shift;
-		vdso_data->cs_mask		=3D tk->tkr.mask;
+		vdso_data->xtime_clock_snsec	=3D tk->tkr_mono.xtime_nsec;
+		vdso_data->cs_mult		=3D tk->tkr_mono.mult;
+		vdso_data->cs_shift		=3D tk->tkr_mono.shift;
+		vdso_data->cs_mask		=3D tk->tkr_mono.mask;
 	}
=20
 	vdso_write_end(vdso_data);
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/zhkqKsw_db745L06GAlqst.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVGOmTAAoJEMDTa8Ir7ZwV4VYP/0FNY2QSIh+qFuhWHd2T5W6H
MypfX9l04pBQzXDOLl0Spz1ei5CiALSNIhRv9w4MXwiaRWu1PWWBMZM4ZV6lqAIM
Qz/W0KMiks0uEY8mH7w4glJ6fBLlJtmViSI5pvKvqY1m3vdKgEgW0zz9jZNvm1aD
GWRA8/9GerXJZ8IuL4dBWX+BUevqtsaD0jbhjnHCQw//VyXKOBqfILPa0TQa60cO
/Bfd4jowPlIEAAQuUe7BOfpL1ikWTWnZ2tf0iF26+d+kUXkfVzYg9AUOeZQqNv4m
945wQ/VeLrbXMha17xSbRD0LyRbwZBG7t8Dfi+eUByobxK7zq/mbIl0wFxDbnsw5
lQMSJIXRjtQKHQU7sGVryXuFluexA/NWIMxbYmNUJ52Gj+fVn11OT8Q2tdN2qmxM
mr538DcOV2d47Q9WjZDzXVy11XTe7ekb7b/tXco7eHb630EP+vDQCe0F42/xzP1w
4ZXnw+ha2u2aLMFOJV6XlXH/H7uAOHLHn8KAu9OFau1WJzQ5KPqQ4WbkjQbN+/Kf
T+J7BLBkSp0qRHN/N4tDZgVJNE992crZhgoPBMvq43imSDsQy6YqXWUGh5q05rMy
fY710H5z8rQXW5Yb34lQcZyUa1x0Ixzw4LyLOD9zgcm0Z+Ko0uqB6I6o3ETNu2ij
wPXXwigbz/IV4JmzzfjE
=FOv1
-----END PGP SIGNATURE-----

--Sig_/zhkqKsw_db745L06GAlqst.--
