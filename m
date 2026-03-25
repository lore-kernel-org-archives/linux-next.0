Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C2E38D6BC;
	Wed, 25 Mar 2026 16:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774455754; cv=none; b=Pji6b1X0Yn4qHbhUpP/RUGKbGcWxq3pARefCjUa3VqZDEGYuj+yziQdbpkC4XMlaV+o70UL15VILvWm0ojrj1Gwb+P93O8O23jp3Ldhb/U0l0DmULw/ixmopXblvufQ5msKS0xMilffzAQc+jI6pxZWAt5z6AYNzme2qC8nGT3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774455754; c=relaxed/simple;
	bh=C9m+O1LHNRzeumvhKxqQM9w4sFUx4JIpaZWqLoRoQ18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rv98u2/c5dXifwuuQHtX53EPCdrkPnFIErWSzQ8mQ0Lvm5G7Q1BlK4i1Tf91meD6sXyqNuimOomu+Ot+mgaea/Dis+jfWe0rKNlSXVixLOfTblf3Rr+LX31bZjGub1wTsSsgiwJ9ktXtXCkVN6LN54PBqyq3h7lNLx+w3m911S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qmPOBYKa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qmPOBYKa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21082C4CEF7;
	Wed, 25 Mar 2026 16:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774455753;
	bh=C9m+O1LHNRzeumvhKxqQM9w4sFUx4JIpaZWqLoRoQ18=;
	h=Date:From:To:Cc:Subject:From;
	b=qmPOBYKaja4K+/4zceHtZXE8udCd5jPl/l2luJOn3SivTy860bsCiYkj1gCW2589+
	 p4OMMqjKYJY49Fah5b4fvv8RGPZ2IPTfcp4V1zd/ZpfCABI9dL79oYl2v9r9C3p6x6
	 YkizRT7VgR6bNi6vPjVv5Z/z1hb8nkWBNur+wKiJkLdZJzd40oPRrkmvFfN+IVb0Ar
	 QUNUfJikRcY559D/YLKfPHb7snP91dDL3/gUWyNyRYlcL7T4KbvF/2wxJoaJZ7UHCi
	 1GY8PlZwdg/aHB7KdlwR3FTRqY8bQjXVs8v+Ttr7ARYkhW4peGltIcH16O2oHUwwx8
	 vv1SNp0Fdt2CA==
Date: Wed, 25 Mar 2026 16:22:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the input tree
Message-ID: <acQLxuMKNAbtQDef@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="egYshBt7HoHr+f5a"
Content-Disposition: inline


--egYshBt7HoHr+f5a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the input tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/input/touchscreen/mxs-lradc-ts.c:
In function 'mxs_lradc_ts_handle_irq':
/tmp/next/build/drivers/input/touchscreen/mxs-lradc-ts.c:508:8: error:
macro "class_spinlock_irqsave_constructor" passed 2 arguments, but takes
just 1
  508 |                 scoped_guard(spinlock_irqsave, &ts->lock, flags) {
      | ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /tmp/next/build/include/linux/sched.h:37,
                 from /tmp/next/build/include/linux/ratelimit.h:6,
                 from /tmp/next/build/include/linux/dev_printk.h:16,
                 from /tmp/next/build/include/linux/device.h:15,
                 from /tmp/next/build/drivers/input/touchscreen/mxs-lradc-ts.c:13:
/tmp/next/build/include/linux/spinlock.h:623:9: note: macro
"class_spinlock_irqsave_constructor" defined here
  623 | #define class_spinlock_irqsave_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(spinlock_irqsave, _T)
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /tmp/next/build/include/linux/jump_label.h:78,
                 from /tmp/next/build/include/linux/dynamic_debug.h:6,
                 from /tmp/next/build/include/linux/printk.h:620,
                 from /tmp/next/build/include/asm-generic/bug.h:31,
                 from /tmp/next/build/arch/x86/include/asm/bug.h:193,
                 from /tmp/next/build/arch/x86/include/asm/alternative.h:9,
                 from /tmp/next/build/arch/x86/include/asm/segment.h:6,
                 from /tmp/next/build/arch/x86/include/asm/ptrace.h:5,
                 from /tmp/next/build/arch/x86/include/asm/math_emu.h:5,
                 from /tmp/next/build/arch/x86/include/asm/processor.h:13,
                 from /tmp/next/build/include/linux/sched.h:13:
/tmp/next/build/include/linux/cleanup.h:300:17: error: invalid initializer
  300 |                 class_##_name##_constructor
      |                 ^~~~~~
/tmp/next/build/include/linux/cleanup.h:438:14: note: in expansion of
macro 'CLASS'
  438 |         for (CLASS(_name, scope)(args);                                 \
      |              ^~~~~
/tmp/next/build/include/linux/cleanup.h:447:9: note: in expansion of macro
'__scoped_guard'
  447 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
      |         ^~~~~~~~~~~~~~
/tmp/next/build/drivers/input/touchscreen/mxs-lradc-ts.c:508:17: note:
in expansion of macro 'scoped_guard'
  508 |                 scoped_guard(spinlock_irqsave, &ts->lock, flags) {
      |                 ^~~~~~~~~~~~

Caused by commit

  a995f3ca3bd51 (Input: mxs-lradc-ts - use guard notation when acquiring spinlock)

I have used the tree from next-20260324 instead.

--egYshBt7HoHr+f5a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnEC8UACgkQJNaLcl1U
h9ABlAgAhn1SMliu6GbCeHynUKTTNHVUZ4OjE6Xz8POle2bSYauBbVaz4tp5MWwb
qzcmFMQXMdoF2fDa3PKpN2fR/m8didOQRXbqpNZC1hWyZTTvsjugobS3sTej9/cp
f8rDNRM1frk0bDhrNNrrRTOg3WDPnwIy5WWKOwiCQfz7mUKHG7OHDCE8Jdh21hnr
ajMP9QoY5KYaz+qUegaqI3INHB4IHSRdpjcB5s8UvP8inO/CvznuxsmoJ0o5rUU0
TAruYnFyOvlzD1jY/Nk8/BmXxyj9Nmr7fpjwKtKlG4fklVvJqjGbiRm76imWPBsb
OXNl68L4m+54BAPY+u05ET9QiSpBdA==
=9rZ7
-----END PGP SIGNATURE-----

--egYshBt7HoHr+f5a--
