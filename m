Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CEB32AAC5;
	Mon,  8 Jun 2026 11:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780916403; cv=none; b=CLHloF/1pRelJlkBJM2AP/DjGrUTXRlXjBuuR87JjG/vJuTLmEoARwjT3JBpQZJlnmhbZSVtefgUpt9wNbFYvUj0Q9NA7m22Cd6H0kXrnaOJcgRsbWRitcl1lb8veO1uStLV2JKgTqAGF7VM6zszYtXhDA5zsoIARxy/oxCXf9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780916403; c=relaxed/simple;
	bh=cKKKtCL6fQ1jeO80I8QuE7I5aui4Fn2Tr7NG0i0I6ns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KRFv6z9NVHJ4RFqHGbuz+da6r5+pZP7pYGMpOSLKoIgtUljvdqVgPwhnwwyStkykqvH18olnzDmrZfa+TXtAGjgN+xfCSGMm9sZzzQx+YUjK3lUABICgkQttkcjN2N9B0YKoTCm2J5p28UNUoX0qnn+NPttrAeVs83bAFds79n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HYwjYh5E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HYwjYh5E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCAE1F00893;
	Mon,  8 Jun 2026 11:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780916402;
	bh=Mn8/U3z8Xotin+bXGq7kgT5vpFp12ihRuF9vLZBzmu0=;
	h=Date:From:To:Cc:Subject;
	b=HYwjYh5Enhg1PK7gDNvxCiVWsyUWtfKQeY0O/uujgtbPerfgpQ3rPussmvZHt11XM
	 qwgCSPq4+KAR5BiX155iwd9f4zfKwzBGLhHOp/YSNmqoe13t5uLOPMnIP7lYfjUXXt
	 a5cbVXqIwKqvZmDYbAtpXFmXSj8t9iDDkm4bkzyDzzc+BhcM3xKu6JV1vRetGKc9OS
	 WOCcQ1pgB+ViIsZJRnzhNpw7NGMYVxIJjc/T8/daQis55pV4JJdZy8l6AZgGl1m1bq
	 Bt/bhYSc+/OaRubZY1U1ack4yab+ec+3yC/DMZhcAe7sA6Z4inVyf6vn8Hxn6X1cjJ
	 22z+/6ZfDYzFw==
Date: Mon, 8 Jun 2026 11:59:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Nam Cao <namcao@linutronix.de>, Paul Walmsley <pjw@kernel.org>
Subject: linux-next: manual merge of the risc-v tree with the risc-v-fixes
 tree
Message-ID: <aiagrraIGAYbWA5D@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QX0bPA25WC4yryzb"
Content-Disposition: inline


--QX0bPA25WC4yryzb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  arch/riscv/kernel/unaligned_access_speed.c

between commit:

  1e4fcbec3c714 ("riscv: Fix fast_unaligned_access_speed_key not getting in=
itialized")

=66rom the risc-v-fixes tree and commits:

  aad60bdd0b5a6 ("riscv: Fix fast_unaligned_access_speed_key not getting in=
itialized")
  65e25b3affc92 ("riscv: misaligned: Fix fast_unaligned_access_speed_key in=
it")

=66rom the risc-v tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined arch/riscv/kernel/unaligned_access_speed.c
index 11c781a4de733,bb57eb5d19dfe..0000000000000
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@@ -27,8 -27,6 +27,6 @@@ DEFINE_PER_CPU(long, vector_misaligned_
  static long unaligned_scalar_speed_param =3D RISCV_HWPROBE_MISALIGNED_SCA=
LAR_UNKNOWN;
  static long unaligned_vector_speed_param =3D RISCV_HWPROBE_MISALIGNED_VEC=
TOR_UNKNOWN;
 =20
- static cpumask_t fast_misaligned_access;
-=20
  static u64 __maybe_unused
  measure_cycles(void (*func)(void *dst, const void *src, size_t len),
  	       void *dst, void *src, size_t len)
@@@ -131,13 -129,10 +129,10 @@@ static int check_unaligned_access(struc
  	 * Set the value of fast_misaligned_access of a CPU. These operations
  	 * are atomic to avoid race conditions.
  	 */
- 	if (ret) {
+ 	if (ret)
  		per_cpu(misaligned_access_speed, cpu) =3D RISCV_HWPROBE_MISALIGNED_SCAL=
AR_FAST;
- 		cpumask_set_cpu(cpu, &fast_misaligned_access);
- 	} else {
+ 	else
  		per_cpu(misaligned_access_speed, cpu) =3D RISCV_HWPROBE_MISALIGNED_SCAL=
AR_SLOW;
- 		cpumask_clear_cpu(cpu, &fast_misaligned_access);
- 	}
 =20
  	return 0;
  }
@@@ -192,49 -187,24 +187,24 @@@ static void __init check_unaligned_acce
 =20
  DEFINE_STATIC_KEY_FALSE(fast_unaligned_access_speed_key);
 =20
- static void modify_unaligned_access_branches(cpumask_t *mask, int weight)
+ static void modify_unaligned_access_branches(const cpumask_t *mask)
  {
- 	if (cpumask_weight(mask) =3D=3D weight)
+ 	bool fast =3D true;
+ 	int cpu;
+=20
+ 	for_each_cpu(cpu, mask) {
+ 		if (per_cpu(misaligned_access_speed, cpu) !=3D RISCV_HWPROBE_MISALIGNED=
_SCALAR_FAST) {
+ 			fast =3D false;
+ 			break;
+ 		}
+ 	}
+=20
+ 	if (fast)
  		static_branch_enable_cpuslocked(&fast_unaligned_access_speed_key);
  	else
  		static_branch_disable_cpuslocked(&fast_unaligned_access_speed_key);
  }
 =20
- static void set_unaligned_access_static_branches_except_cpu(int cpu)
- {
- 	/*
- 	 * Same as set_unaligned_access_static_branches, except excludes the
- 	 * given CPU from the result. When a CPU is hotplugged into an offline
- 	 * state, this function is called before the CPU is set to offline in
- 	 * the cpumask, and thus the CPU needs to be explicitly excluded.
- 	 */
-=20
- 	cpumask_t fast_except_me;
-=20
- 	cpumask_and(&fast_except_me, &fast_misaligned_access, cpu_online_mask);
- 	cpumask_clear_cpu(cpu, &fast_except_me);
-=20
- 	modify_unaligned_access_branches(&fast_except_me, num_online_cpus() - 1);
- }
-=20
- static void set_unaligned_access_static_branches(void)
- {
- 	/*
- 	 * This will be called after check_unaligned_access_all_cpus so the
- 	 * result of unaligned access speed for all CPUs will be available.
- 	 *
- 	 * To avoid the number of online cpus changing between reading
- 	 * cpu_online_mask and calling num_online_cpus, cpus_read_lock must be
- 	 * held before calling this function.
- 	 */
-=20
- 	cpumask_t fast_and_online;
-=20
- 	cpumask_and(&fast_and_online, &fast_misaligned_access, cpu_online_mask);
-=20
- 	modify_unaligned_access_branches(&fast_and_online, num_online_cpus());
- }
-=20
  static int riscv_online_cpu(unsigned int cpu)
  {
  	int ret =3D cpu_online_unaligned_access_init(cpu);
@@@ -266,14 -236,19 +236,19 @@@
  #endif
 =20
  exit:
- 	set_unaligned_access_static_branches();
+ 	modify_unaligned_access_branches(cpu_online_mask);
 =20
  	return 0;
  }
 =20
  static int riscv_offline_cpu(unsigned int cpu)
  {
- 	set_unaligned_access_static_branches_except_cpu(cpu);
+ 	cpumask_t mask;
+=20
+ 	cpumask_copy(&mask, cpu_online_mask);
+ 	cpumask_clear_cpu(cpu, &mask);
+=20
+ 	modify_unaligned_access_branches(&mask);
 =20
  	return 0;
  }
@@@ -430,7 -405,7 +405,7 @@@ static int __init check_unaligned_acces
  				  riscv_online_cpu_vec, NULL);
 =20
  	cpus_read_lock();
- 	set_unaligned_access_static_branches();
+ 	modify_unaligned_access_branches(cpu_online_mask);
  	cpus_read_unlock();
 =20
  	return 0;

--QX0bPA25WC4yryzb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmomoK0ACgkQJNaLcl1U
h9Du6Qf+Oc1OYXcdXqmcmFtcTZRzXPjI1XJ+fKPyETswyEgVPPn1gqoUqqXNJCsj
SOTpyuGrDJbur08xU/oJpesarh18SeHrFbk6AhD00yhD6LEUMu5xbC5bHENu0gkz
JCSkRBjPNncJ9DUCPrBvcckAuEhyec9E18U+lG9FrAXe2GWPeKiFMpau4F2MRqGy
oeaRC/IgHF9FdHplWZ9hg4qvDZWBTSmZHXPWBbVg4WpiPZwmVGtgI374qkRD684H
2AL4606KBRHYH/mVTRyJto1HvgDx1zt3g+8v/me6IVBxSvnlwuCiC2l8VTaBO53I
y0blaK3OKmm8rdkfqdqrmqR9U2AlmQ==
=LF0q
-----END PGP SIGNATURE-----

--QX0bPA25WC4yryzb--
