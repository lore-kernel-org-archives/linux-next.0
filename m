Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194EA22B8AB;
	Fri,  3 Jul 2026 14:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783089820; cv=none; b=cZXShKxVD6Asb8UCsABdls7sBhERsJNXLVx04CvhHo3NiKPLcD/C1fS+whh9tWjqoVyJAz941oup5p6Fp2g8SCskrgLkQLGFuLgZ5hRWNxNmfaLHy7jt9erpCGvHk/XXC6jEon77yRjcI2gNG/UX6R7H74bOu2MjKq+docvqSXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783089820; c=relaxed/simple;
	bh=bcQElHNN1qFZ6bJKZz9rHP/hUHTkG43m7xSqynFFBxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a78wRRmZ3OvN6YqzRpZ64oZdMPmamvM80ndRAmqejKo1wRKA2ROO8/6yn/yW03l7TPOeNMB1Ae3tVPpNI10B78gwmyHazlQ0pbCl/biuT2oec7e2yNu+nhmrkeBtWfKgJFiqolFxP+bKo6CI77dQStp3vnrNTYHv1+u2d77us6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pji1Ax45; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pji1Ax45"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9AC21F000E9;
	Fri,  3 Jul 2026 14:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783089818;
	bh=6vcyaKhycHkdc0bDvERjcEw+Vo8BUGv+kqk2yyxCJo0=;
	h=Date:From:To:Cc:Subject;
	b=Pji1Ax45ycoM0LdgKTSu5Vh/As/Gs6ybXVQdNJsYzWD1KIqmO0NiTp6H+59M6Mu7F
	 xgB97u+1kPXb9kF2aH5xa/Cf5hl0wcS9jx7LTsVCaWm4C7mE2z/P2ABIeoAe9WtmGR
	 XgLtitm8TJFzhfj4yb6yuTItZ6vBXaziZ/jiFNzNXvEmQIVWhAMG3qSI5b/UcYrDaB
	 yiRNZsSWtcZTaRYhJ5ZXcV2yfYOO74RAvOv/zfix8taQ8fDL2iUHq4U41OIbMyQ6yF
	 1TKEcJiZvYIMKkEAjcT5v76W9gCK7fpIv+Eq8FWARXg7VGgTWEyhBiGKAzBChfIPii
	 Gx878VTCMYLlw==
Date: Fri, 3 Jul 2026 15:43:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: KUnit failure after merge of the mm-nonmm-unstable tree
Message-ID: <akfKl6lJlGL6fPG3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zkPledDsvJllHRDk"
Content-Disposition: inline


--zkPledDsvJllHRDk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the mm-nonmm-unstable tree, today's linux-next failed
KUnit testing like this:

[14:20:52] Configuring KUnit Kernel ...
[14:20:52] Building KUnit Kernel ...
Populating config with:
$ make ARCH=arm64 O=/tmp/next/arm64_kunit olddefconfig CROSS_COMPILE=aarch64-linux-gnu-
Building with:
$ make all compile_commands.json scripts_gdb ARCH=arm64 O=/tmp/next/arm64_kunit --jobs=192 CROSS_COMPILE=aarch64-linux-gnu-
[14:21:06] Starting KUnit Kernel (1/1)...
Running tests with:
$ qemu-system-aarch64 -nodefaults -m 1024 -kernel /tmp/next/arm64_kunit/arch/arm64/boot/Image.gz -append 'kunit.enable=1 console=ttyAMA0 kunit_shutdown=reboot' -no-reboot -nographic -accel kvm -accel hvf -accel tcg -serial stdio -machine virt -cpu max
[14:22:11] ============================================================
[14:22:11] =================== cmdline (8 subtests) ===================
[14:22:11] # cmdline_test_memparse: EXPECTATION FAILED at lib/tests/cmdline_kunit.c:249
[14:22:11] Expected ret == e->result, but
[14:22:11]     ret == -16 (0xfffffffffffffff0)
[14:22:11]     e->result == -1 (0xffffffffffffffff)
[14:22:11] when parsing '0xffffffffffffffff0'
[14:22:11] [FAILED] cmdline_test_memparse
[14:22:11]     # module: cmdline_kunit
[14:22:11] # cmdline: pass:7 fail:1 skip:0 total:8
[14:22:11] # Totals: pass:7 fail:1 skip:0 total:8
[14:22:11] ===================== [FAILED] cmdline =====================
[14:22:11] ============================================================
[14:22:11] Testing complete. Ran 9225 tests: passed: 9104, failed: 1, skipped: 120
[14:22:11] Failures: cmdline.cmdline_test_memparse
[14:22:11] Test results stored in /tmp/next/arm64_kunit.json
[14:22:11] Elapsed time: 79.318s total, 0.002s configuring, 14.632s building, 64.682s running

I honestly have no idea what's triggering this, nothing jumps out from
the commits introduced in the merge of the branch.  If I have time later
I'll try to bisect the issue.  I have used the tree from next-20260602
instead.

--zkPledDsvJllHRDk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpHypYACgkQJNaLcl1U
h9AfcAgAhhh21SxWIquTWcHgP0S3HrKR3TArUMRl7EO7XUkYz9V1ziiRTGfJfneb
votfh5FstnVX4symL0w81PBSjsyqKtCWHcGA4Of/8vnQuJpsrDdhhBAy1AHHP95z
IeHNYfHCXKvOc8P1wZEjTD+IsctdP8Ull05It0pNQBXrib20CvmsnR20BQNXGKIa
KYs2MW2VHtIrFqyWl8th8pYBsZQviVSCol/w/V8tFwPJ3QZHI4q3IAQV2JpBAYPG
gpgAlrvy/stnMojj2fHvJy/Yfj6j6axn/1J39LEuxa0AmnddPGuhkVRp+fiM1zug
lgzhMlvnWR54bLYcBgpiX+EWMFvaIA==
=YJwU
-----END PGP SIGNATURE-----

--zkPledDsvJllHRDk--
