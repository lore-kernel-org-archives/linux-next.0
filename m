Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF4717A309;
	Wed,  8 Apr 2026 12:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775652252; cv=none; b=nI51VmSihS1aPL/prjgyovsYhrlTcLizbV70NTeupv33ZRZ+RGaPBkloSn5inw2WL5Acnw8h1Y3GBGBZjWXQbzd5NAgc6lFUHdeioKIOkBvgbRvIUaUYjwhwU8ZQBj3Q6xTksv+fQ8WQqBdisDu8zm9etkaEkqtFYUZ39CE5PR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775652252; c=relaxed/simple;
	bh=W+bPQ1fOW1BZYQjo1d9QwGMjjDXUEhRCd0p7liJhJzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h0aXLVgi4gplfb/3zIsjswHfhpf/njIc+k2qqlDo2hQzxoHzRmgcFS1b1QcUjWtUA5lJTckXFo9NB3dVpcrke6USoSjXJl+pEx5kxAt7Xvyn92yaxruqtLPW1zfqkCHbxPMC1oFg4yMC9aI1Nf+ljsAilV9LzCYPxhOK2wCvhGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nKjInora; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nKjInora"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5AAC19424;
	Wed,  8 Apr 2026 12:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775652252;
	bh=W+bPQ1fOW1BZYQjo1d9QwGMjjDXUEhRCd0p7liJhJzI=;
	h=Date:From:To:Cc:Subject:From;
	b=nKjInorafHzl6FbLde5BYjqF4DUepFhpkCsyDCNHkRHVR66jB7T7VpT/bh77OK3EZ
	 OTbptEz55buxECTvadWVypyhUFRBbCUn1sPFL0DmZZVV4GVbZCZn/bje4uSyXHMcN8
	 4cmKAiEmyqP97+b4FDbMEYalzpt18Al1lbHQWrSO4NifOu/MtFUiTarKWvmjQ2jY2f
	 gHHw+f6K2D/8e8PJ6lU1d1GEptiqNnz7ITJhuvIz6lIbV2IsjCOgcZPP450z6EU4uy
	 0Isfu239fP0IjvryaOVd4KlWKQZ1KKDFrK3g/30u/ErNEUMBh1NZRtFvzaqF6/Hxd3
	 R7PfkgUeRXncw==
Date: Wed, 8 Apr 2026 13:44:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Josh Snyder <josh@code406.com>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip-fixes tree
Message-ID: <adZNmIpSOkd6P5c7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the tip-fixes tree, today's linux-next build (arm64 kunit)
failed like this:

[12:34:18] Configuring KUnit Kernel ...
[12:34:18] Building KUnit Kernel ...
Populating config with:
$ make ARCH=arm64 O=/tmp/next/arm64_kunit olddefconfig CROSS_COMPILE=aarch64-linux-gnu-
Building with:
$ make all compile_commands.json scripts_gdb ARCH=arm64 O=/tmp/next/arm64_kunit --jobs=192 CROSS_COMPILE=aarch64-linux-gnu-
[12:34:34] Starting KUnit Kernel (1/1)...
Running tests with:
$ qemu-system-aarch64 -nodefaults -m 1024 -kernel /tmp/next/arm64_kunit/arch/arm64/boot/Image.gz -append 'kunit.enable=1 console=ttyAMA0 kunit_shutdown=reboot' -no-reboot -nographic -accel kvm -accel hvf -accel tcg -serial stdio -machine virt -cpu max
Command '['qemu-system-aarch64', '-nodefaults', '-m', '1024', '-kernel', '/tmp/next/arm64_kunit/arch/arm64/boot/Image.gz', '-append', 'kunit.enable=1 console=ttyAMA0 kunit_shutdown=reboot', '-no-reboot', '-nographic', '-accel', 'kvm', '-accel', 'hvf', '-accel', 'tcg', '-serial', 'stdio', '-machine', 'virt', '-cpu', 'max']' timed out after 300 seconds
[12:39:34] [FAILED] <missing>
[12:39:34] Testing complete. Ran 0 tests: errors: 1
[12:39:34] Test results stored in /tmp/next/arm64_kunit.json
[12:39:34] Elapsed time: 316.083s total, 0.002s configuring, 16.074s building, 300.006s running

which isn't super helpful.  I haven't isolated which commit but it'll be
one of the three:

  b81207470caf ("clockevents: Prevent timer interrupt starvation")
  82b915051d32 ("tick/nohz: Fix inverted return value in check_tick_dependency() fast path")
  105c42566a55 ("ata: ahci: force 32-bit DMA for JMicron JMB582/JMB585")

which are new since yesterday, I'm guessing not the latter.  I have used
the tree from next-20260407 instead.
