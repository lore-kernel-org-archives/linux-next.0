Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FCA2417C6;
	Wed, 28 Jan 2026 16:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769617063; cv=none; b=RGl65HjnlJk2EdEdemjgHFG468cK8Mcr6UElgaxJZl5Sz/tBqVQc4/3hvejvafYmaGBP16fLVmX5ZlLzackqOJ8NBgkRpSlBdRptaRac7wiHlUt83wzYpQAaIgNnIHa+hFGt7Bvy/k46f2U7dAOx1mJuD2ImOr7+PMBKSQ6Ga3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769617063; c=relaxed/simple;
	bh=xSuY13/fc3bVvqzzeJNgF/0RGAVCq1+y9t2eH6wQK0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cckcMbtLU/mBJ0FnAzDz2Uk3+e1GAQ5hcKWtSbneOeBzx1NAXn+Z4cf6RxqeBlfKu0fPNsbO4ESkIOzKGJs3sKXL+ECkzKR3sj7tS24i4LuumjjBDPsZF0QqlQ/KLp7m3QSIknPZ8G16Ig7WVxfOX1ZyVtNZa6Rt4e+SF65SPmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LW4hQ4AG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LW4hQ4AG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D41EC4CEF1;
	Wed, 28 Jan 2026 16:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769617063;
	bh=xSuY13/fc3bVvqzzeJNgF/0RGAVCq1+y9t2eH6wQK0Y=;
	h=Date:From:To:Cc:Subject:From;
	b=LW4hQ4AG/QBZSicV9DsF7oFyO4WMQHYef/VdpH0gTVh5l7WH+x04Lu6LRi3uazlKx
	 8GEEHAgLqSNYecnmlf2HVX36F0UTt4+rEQTzeLYCW3xNZ/n60kfTP5TWUubnU2kzLk
	 VrjOpCXr4GbPzkXjnLEDWM4Ea97jHQQgOJuLR1mvftV4HF9DYKo3IB9lVQftgtdM0Y
	 63dLsgF4jCGBqmL56LQotxNCTJg1Pu92TmtMaCfYkxUsrAJv5gg4rcDjXY4ir73WZy
	 /Nwsbhccji87M76H5zYKwsA1G8whmFAgHzWgOV4tkppZdacuI3vKlxnpvQ3vjAVVw4
	 DM/ncrMHAjK2g==
Date: Wed, 28 Jan 2026 16:17:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>,
	Joy Zou <joy.zou@nxp.com>, Rob Herring <robh@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the final tree
Message-ID: <aXo2o-G8IqGUlu5q@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ws9uHFn3AE+pUh7h"
Content-Disposition: inline


--ws9uHFn3AE+pUh7h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (x86_64
allnoconfig) failed like this:

In file included from /tmp/next/build/mm/mm_init.c:29:
/tmp/next/build/include/linux/cma.h:68:13: warning: 'cma_skip_dt_default_re=
served_mem' defined but not used [-Wunused-function]
   68 | static bool cma_skip_dt_default_reserved_mem(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /tmp/next/build/mm/show_mem.c:9:
/tmp/next/build/include/linux/cma.h:68:13: warning: 'cma_skip_dt_default_re=
served_mem' defined but not used [-Wunused-function]
   68 | static bool cma_skip_dt_default_reserved_mem(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Building: powerpc allnoconfig
In file included from /tmp/next/build/mm/mm_init.c:29:
/tmp/next/build/include/linux/cma.h:68:13: warning: 'cma_skip_dt_default_re=
served_mem' defined but not used [-Wunused-function]
   68 | static bool cma_skip_dt_default_reserved_mem(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /tmp/next/build/mm/show_mem.c:9:
/tmp/next/build/include/linux/cma.h:68:13: warning: 'cma_skip_dt_default_re=
served_mem' defined but not used [-Wunused-function]
   68 | static bool cma_skip_dt_default_reserved_mem(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Building: powerpc64 allnoconfig
In file included from /tmp/next/build/mm/mm_init.c:29:
/tmp/next/build/include/linux/cma.h:68:13: warning: 'cma_skip_dt_default_re=
served_mem' defined but not used [-Wunused-function]
   68 | static bool cma_skip_dt_default_reserved_mem(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /tmp/next/build/mm/show_mem.c:9:
/tmp/next/build/include/linux/cma.h:68:13: warning: 'cma_skip_dt_default_re=
served_mem' defined but not used [-Wunused-function]
   68 | static bool cma_skip_dt_default_reserved_mem(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Building: powerpc ppc44x_defconfig
In file included from /tmp/next/build/mm/mm_init.c:29:
/tmp/next/build/include/linux/cma.h:68:13: warning: 'cma_skip_dt_default_re=
served_mem' defined but not used [-Wunused-function]
   68 | static bool cma_skip_dt_default_reserved_mem(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /tmp/next/build/mm/show_mem.c:9:
/tmp/next/build/include/linux/cma.h:68:13: warning: 'cma_skip_dt_default_re=
served_mem' defined but not used [-Wunused-function]
   68 | static bool cma_skip_dt_default_reserved_mem(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /tmp/next/build/kernel/dma/pool.c:6:
/tmp/next/build/include/linux/cma.h:68:13: warning: 'cma_skip_dt_default_re=
served_mem' defined but not used [-Wunused-function]
   68 | static bool cma_skip_dt_default_reserved_mem(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/arch/powerpc/boot/dts/sam440ep.dts:266.22-287.5: Warning (i=
nterrupt_provider): /plb/pci@ec000000: '#interrupt-cells' found, but node i=
s not an interrupt provider
Building: powerpc pseries_le_defconfig
In file included from /tmp/next/build/arch/powerpc/kvm/book3s_hv_builtin.c:=
15:
/tmp/next/build/include/linux/cma.h:68:13: error: 'cma_skip_dt_default_rese=
rved_mem' defined but not used [-Werror=3Dunused-function]
   68 | static bool cma_skip_dt_default_reserved_mem(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[5]: *** [/tmp/next/build/scripts/Makefile.build:287: arch/powerpc/kvm/=
book3s_hv_builtin.o] Error 1
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [/tmp/next/build/scripts/Makefile.build:544: arch/powerpc/kvm]=
 Error 2
make[4]: *** Waiting for unfinished jobs....
In file included from /tmp/next/build/mm/mm_init.c:29:
/tmp/next/build/include/linux/cma.h:68:13: warning: 'cma_skip_dt_default_re=
served_mem' defined but not used [-Wunused-function]
   68 | static bool cma_skip_dt_default_reserved_mem(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /tmp/next/build/mm/show_mem.c:9:
/tmp/next/build/include/linux/cma.h:68:13: warning: 'cma_skip_dt_default_re=
served_mem' defined but not used [-Wunused-function]
   68 | static bool cma_skip_dt_default_reserved_mem(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /tmp/next/build/arch/powerpc/kernel/fadump.c:25:
/tmp/next/build/include/linux/cma.h:68:13: error: 'cma_skip_dt_default_rese=
rved_mem' defined but not used [-Werror=3Dunused-function]
   68 | static bool cma_skip_dt_default_reserved_mem(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[5]: *** [/tmp/next/build/scripts/Makefile.build:287: arch/powerpc/kern=
el/fadump.o] Error 1
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [/tmp/next/build/scripts/Makefile.build:544: arch/powerpc/kern=
el] Error 2
make[3]: *** [/tmp/next/build/scripts/Makefile.build:544: arch/powerpc] Err=
or 2
make[3]: *** Waiting for unfinished jobs....
In file included from /tmp/next/build/mm/hugetlb.c:33:
/tmp/next/build/include/linux/cma.h:68:13: warning: 'cma_skip_dt_default_re=
served_mem' defined but not used [-Wunused-function]
   68 | static bool cma_skip_dt_default_reserved_mem(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /tmp/next/build/mm/hugetlb_cma.c:4:
/tmp/next/build/include/linux/cma.h:68:13: warning: 'cma_skip_dt_default_re=
served_mem' defined but not used [-Wunused-function]
   68 | static bool cma_skip_dt_default_reserved_mem(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /tmp/next/build/fs/proc/meminfo.c:18:
/tmp/next/build/include/linux/cma.h:68:13: warning: 'cma_skip_dt_default_re=
served_mem' defined but not used [-Wunused-function]
   68 | static bool cma_skip_dt_default_reserved_mem(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /tmp/next/build/mm/cma.c:28:
/tmp/next/build/include/linux/cma.h:68:13: warning: 'cma_skip_dt_default_re=
served_mem' defined but not used [-Wunused-function]
   68 | static bool cma_skip_dt_default_reserved_mem(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /tmp/next/build/kernel/crash_reserve.c:17:
/tmp/next/build/include/linux/cma.h:68:13: warning: 'cma_skip_dt_default_re=
served_mem' defined but not used [-Wunused-function]
   68 | static bool cma_skip_dt_default_reserved_mem(void)

Caused by commit

  26332ae848f08 (of: reserved_mem: Allow reserved_mem framework detect "cma=
=3D" kernel param)

I have applied the patch below, which I will post as a submission.


=46rom 51ca24819b2b7ab6ecb632f14cb5975563fe933f Mon Sep 17 00:00:00 2001
=46rom: Mark Brown <broonie@kernel.org>
Date: Wed, 28 Jan 2026 15:22:21 +0000
Subject: [PATCH] cma: Fix stub for cma_skip_dt_default_reserved_mem()

The stub for cma_skip_dt_default_reserved_mem() is not inlined so
triggers build warnings:

In file included from /tmp/next/build/fs/proc/meminfo.c:18:
/tmp/next/build/include/linux/cma.h:68:13: warning: 'cma_skip_dt_default_re=
served_mem' defined but not used [-Wunused-function]
   68 | static bool cma_skip_dt_default_reserved_mem(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

which are fatal with -Werror.

Fixes: 26332ae848f08 ("of: reserved_mem: Allow reserved_mem framework detec=
t "cma=3D" kernel param")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/linux/cma.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/cma.h b/include/linux/cma.h
index 0bf408360641b..d0793eaaadaa4 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -65,7 +65,7 @@ extern void cma_reserve_pages_on_error(struct cma *cma);
 #ifdef CONFIG_DMA_CMA
 extern bool cma_skip_dt_default_reserved_mem(void);
 #else
-static bool cma_skip_dt_default_reserved_mem(void)
+static inline bool cma_skip_dt_default_reserved_mem(void)
 {
 	return false;
 }
--=20
2.47.3


--ws9uHFn3AE+pUh7h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml6NqIACgkQJNaLcl1U
h9B2pgf/U7NmXg2EKC4h2UbLrOqpSebgUz89Y+27BFEaMaflrzvuP8tz+3G38GIZ
zeUKohqgtrjJcyjgm66oVG/Cj9/gRMEW6zteaXssPPtSHZRrgSTp39B+khF2dqcp
oJ02ZdX6ynijw44F88qnodEe2q+LGx2sRNgPUHgTelAjrBuZp64zA6If31s8B7pN
XqWTC/esziHesLVSaT0+UzicOZ6cMKp8YzebbwD5bDEMOF60Bo87Fy31Teo3il8q
0XqjAINHNlA2FZmqpv38fkHyVCU3g0XJrCw2EgZuK9pIGjbZU2aGJ3jmiYjOaSJS
0zsVzdDi+WQWsl0Td0EAj4nHhq+LiA==
=/d0L
-----END PGP SIGNATURE-----

--ws9uHFn3AE+pUh7h--
