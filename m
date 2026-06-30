Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FA23F39E3;
	Tue, 30 Jun 2026 11:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819704; cv=none; b=o50trbg2z3HNOWDCIHx43g4MtX0Q4e9UAIb8Edzq5UQlAUW/CW5BYv+1grZTRSgk6KXMMk4pqlX2vsHKy9y5fzz3/jjpTWmWDkEdZxq14JJcKXfccgx0S6MyUXl3MA7CmgRLIrsvArHadXUWWz7D7TT1//D3jZifguqy4cHhTeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819704; c=relaxed/simple;
	bh=1hvLiWTYW+QvC50xi0D0AH6SKDHRnncNq5yAiKWiP7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RHXjwG7UMlnKniXU3Gfz5k69Xfh+pFJtZuqtQatrwnGApmP001733Vx2Cm3Uy3D1SicQb3XH1PJV4j2nqeu4Es0CeL8kF6yvfVD4a1pqsLKf+5TKKl6sdAZGnmmwfjTkdgvAmmjunDiJlIMLOpfY2Qvs/lEpOIb2m1db+Parz/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRVT3lzS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRVT3lzS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A37771F000E9;
	Tue, 30 Jun 2026 11:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782819696;
	bh=jdgA3WBhyc9pIV6QlYApQXymaFQtp62zBrZHlxa7l8w=;
	h=Date:From:To:Cc:Subject;
	b=hRVT3lzS/7sjI8KhTbazgpt2eM3QcO7OLp/av+kaGEYOasxblzmhvj0t18fREcMLK
	 xDuDPaB55n2tEHmH7KQMX+4ZKSIf9EAUqRNjVzfO6PMdUYppNVGIv0cIKYuqcXo9/v
	 6C4pItlhHMrcjwV3jOqxx2H+qBxI9SYRL3cSfL/+1XcmuHOy2oPlOIULepnJNU8iA3
	 O9Y6sdvOiFlG0F5oIzP2zSzJHCL6xRTQ5U5JDFvQyU+TfUqbB/t5oF7n3jlppViFjB
	 pQwoz7U7eZ2nVNMO9SntMdIR6CshhIFLnqqlwA9J5mz43ZSbN4zZY1dKu9PSQa/70p
	 ljJF4+fUePcOw==
Date: Tue, 30 Jun 2026 12:41:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: KUnit failure after merge of the vfs-brauner tree
Message-ID: <akOrbOsKUqgZarGw@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hWVN3R61K5WHc1B1"
Content-Disposition: inline


--hWVN3R61K5WHc1B1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the vfs-brauner tree, today's linux-next KUnit testing
(arm64 kunit) failed like this:

[11:23:24] Configuring KUnit Kernel ...
[11:23:24] Building KUnit Kernel ...
Populating config with:
$ make ARCH=arm64 O=/tmp/next/arm64_kunit olddefconfig CROSS_COMPILE=aarch64-linux-gnu-
Building with:
$ make all compile_commands.json scripts_gdb ARCH=arm64 O=/tmp/next/arm64_kunit --jobs=192 CROSS_COMPILE=aarch64-linux-gnu-
[11:23:55] Starting KUnit Kernel (1/1)...
Running tests with:
$ qemu-system-aarch64 -nodefaults -m 1024 -kernel /tmp/next/arm64_kunit/arch/arm64/boot/Image.gz -append 'kunit.enable=1 console=ttyAMA0 kunit_shutdown=reboot' -no-reboot -nographic -accel kvm -accel hvf -accel tcg -serial stdio -machine virt -cpu max
[11:25:01] ============================================================
[11:25:01] ================ miscdev_init (7 subtests) =================
[11:25:01] ================ miscdev_test_static_basic  ================
[11:25:01] [FAILED] lower static range, top
[11:25:01]     # miscdev_test_static_basic: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_static_basic: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01] [FAILED] upper static range, bottom
[11:25:01]     # miscdev_test_static_basic: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_static_basic: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01] [FAILED] lower static range, bottom
[11:25:01]     # miscdev_test_static_basic: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_static_basic: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01] [FAILED] upper static range, top
[11:25:01]     # miscdev_test_static_basic: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_static_basic: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_static_basic: pass:0 fail:4 skip:0 total:4
[11:25:01] ============ [FAILED] miscdev_test_static_basic ============
[11:25:01]     # miscdev_test_dynamic_basic: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_basic: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01] [FAILED] miscdev_test_dynamic_basic
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_dynamic_only_range: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01] [FAILED] miscdev_test_dynamic_only_range
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01] [FAILED] miscdev_test_collision
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_collision_reverse: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01] [FAILED] miscdev_test_collision_reverse
[11:25:01] Invalid fixed minor 257 for miscdevice 'miscstat'
[11:25:01]     # miscdev_test_conflict: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:166
[11:25:01] failed to create node
[11:25:01]     # miscdev_test_conflict: EXPECTATION FAILED at drivers/char/misc_minor_kunit.c:170
[11:25:01] failed to open misc device: -2
[11:25:01] [FAILED] miscdev_test_conflict
[11:25:01]     # miscdev_init: found misc device minor 15 available
[11:25:01]     # miscdev_init: found misc device minor 128 available
[11:25:01]     # miscdev_init: found misc device minor 0 available
[11:25:01]     # miscdev_init: found misc device minor 254 available
[11:25:01]     # module: misc_minor_kunit
[11:25:01]     # is_init: true
[11:25:01] # miscdev_init: pass:1 fail:6 skip:0 total:7
[11:25:01] # Totals: pass:1 fail:9 skip:0 total:10
[11:25:01] ================== [FAILED] miscdev_init ===================
[11:25:01] ============================================================
[11:25:01] Testing complete. Ran 9206 tests: passed: 9077, failed: 9, skipped: 120
[11:25:01] Failures: miscdev_init.miscdev_test_static_basic, miscdev_init.miscdev_test_dynamic_basic, miscdev_init.miscdev_test_dynamic_only_range, miscdev_init.miscdev_test_collision, miscdev_init.miscdev_test_collision_reverse, miscdev_init.miscdev_test_conflict
[11:25:01] Test results stored in /tmp/next/arm64_kunit.json
[11:25:01] Elapsed time: 96.725s total, 0.002s configuring, 30.930s building, 65.792s running

I didn't specifically identify the commit causing this.  I have used
the tree from next-20260629 instead.

--hWVN3R61K5WHc1B1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpDq2sACgkQJNaLcl1U
h9Dzrwf+J1/WDYZ33TvjKf2jgX/mis3VthNDzMTuIuTtvlpw88RERsIECkIFLHJb
xniVyXsmeew8IvkPXa3C4qhD6YHzadBYpvk3Z0ftUyJU0uTdEK3bH0fLxJ8HAkkk
Wcqt3uLZgUuF/eIyGW/AUArEmaHK2dW87t2Sf6aRrtVvZ3K51rtqUmjQKPSZ/yK1
xY31338Qwz7sMu/fJIQLz7R8dAybeGC18dA+SocWL7YI9yBXgXp5WB7bsEuws7jy
kzmkhUUp/vfDAXY3rC4vpl3knGVzfw9Cn7ReDacZlOkvwgOzVQ+YhpXOZOFof58S
dlztlQ01Z0CSEWerSoPG2TXN7FeR+g==
=HZUg
-----END PGP SIGNATURE-----

--hWVN3R61K5WHc1B1--
