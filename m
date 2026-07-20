Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E0B3AFD06;
	Mon, 20 Jul 2026 09:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784538109; cv=none; b=IK12Wol1HFmjteDFNru+d3sGCY/Z14PR5nKK9b6A0tVdLhVPST6qE+q1xT7Mj/GBno/USdMGKkNQpDl1Y8DN/2ZzuWqQJHEe4QB4L4DYw8fFsGxz3tM72EM9FHtogbkY8YFKguDTUFXeF/5/VEqjfMEb+6ypRG+UUZ6WDPEaW1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784538109; c=relaxed/simple;
	bh=qoCmVCRQIxgFmtCNBq6ZCeYOXN+UihMGsJ6LLeztpcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JWeriZdJ9aU20i5xKIwfrVXd+Oi712PsqPxNHrWxQ492NfDJ8bOuEr3rGaLDDg+H7IJmqM3W0IC/tGoC8C388PcDHFu7bfOVlqIAAnfFTFzhfWSblYUP/W7FHjPSQ0k8P3NDWXz7U4FBGA18A1naWIAGW9bPYzCLTYX6Zy+AP1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 81AC81EA5CC; Mon, 20 Jul 2026 17:01:38 +0800 (AWST)
X-Spam-Level: 
Received: from [10.162.163.132] (pa49-196-64-58.pa.vic.optusnet.com.au [49.196.64.58])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 7BE271EA5C8;
	Mon, 20 Jul 2026 17:01:34 +0800 (AWST)
Message-ID: <60e97b0c-701e-4b32-9056-32994fb8088a@davidgow.net>
Date: Mon, 20 Jul 2026 17:01:28 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: test failure after merge of the kunit-next tree
To: Mark Brown <broonie@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <alrCeerj_TmaqUuP@sirena.org.uk>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <alrCeerj_TmaqUuP@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 18/07/2026 à 08:02, Mark Brown a écrit :
> Hi all,
> 
> After merging the kunit-next tree, today's linux-next build
> (arm64 kunit) failed like this:
> 
> [22:59:27] Configuring KUnit Kernel ...
> [22:59:27] Building KUnit Kernel ...
> Populating config with:
> $ make ARCH=arm64 O=/tmp/next/arm64_kunit olddefconfig CROSS_COMPILE=aarch64-linux-gnu-
> Building with:
> $ make all compile_commands.json scripts_gdb ARCH=arm64 O=/tmp/next/arm64_kunit --jobs=192 CROSS_COMPILE=aarch64-linux-gnu-
> [22:59:30] Starting KUnit Kernel (1/1)...
> Running tests with:
> $ qemu-system-aarch64 -nodefaults -m 1024 -kernel /tmp/next/arm64_kunit/arch/arm64/boot/Image.gz -append 'kunit.enable=1 console=ttyAMA0 kunit_shutdown=reboot' -no-reboot -nographic -accel kvm -accel hvf -accel tcg -serial stdio -machine virt -cpu max
> [23:00:36] ============================================================
> [23:00:36] ========== gpio-unbind-with-consumers (1 subtest) ==========
> [23:00:36] # gpio_unbind_with_consumers: ASSERTION FAILED at drivers/gpio/gpiolib-kunit.c:393
> [23:00:36] Expected ret == 0x0001, but
> [23:00:36]     ret == 0 (0x0)
> [23:00:36]     0x0001 == 1 (0x1)
> [23:00:36] [FAILED] gpio_unbind_with_consumers
> [23:00:36] # module: gpiolib_kunit
> [23:00:36] =========== [FAILED] gpio-unbind-with-consumers ============
> [23:00:36] # gpio-swnode-hog:     # failed to initialize (-17)
> [23:00:36] [FAILED] gpio-swnode-hog
> [23:00:36] ============================================================
> [23:00:36] Testing complete. Ran 9377 tests: passed: 9284, failed: 2, skipped: 91
> [23:00:36] Failures: gpio-unbind-with-consumers, gpio-swnode-hog
> [23:00:36] Test results stored in /tmp/next/arm64_kunit.json
> [23:00:36] Elapsed time: 69.716s total, 0.002s configuring, 3.680s building, 66.027s running
> 
> This is caused by commit
> 
>    a05cfd98c5eca (gpio: kunit: add test cases for software node hogs)
> 
> which was from the gpio-brgl tree, it has only just become visible since
> 
>    34b5c0132952c (kunit: configs: enable GPIO kunit test cases in all_tests.config)
> 
> was added causing the gpiolib tests to actually be run though neither of
> these commits was added today (the KUnit tree did not change for a
> while).  I'm not clear why this has started failing today, presumably
> some third commit from another tree has started triggering a regression
> since neither of these trees has changed.
> 
> I have left this for today.


I'm pretty sure the fix for this is a part of:
gpio: kunit: add test cases verifying swnode devlink support
(https://lore.kernel.org/all/20260720-swnode-fw-devlink-v5-1-ec250ae6af91@oss.qualcomm.com/#r)

-- David
