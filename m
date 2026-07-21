Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD163D6CB2
	for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 14:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644896; cv=none; b=aNgYQg2MvuP9qnpksbNGqLaJmns68aCWAttEZdvm5GcND++sCGlwdMStwiwEtj4yKOGV4jvEQPgWAWIn/5T1lYpDLR+1pNIzRGY+JGcC6KQpiPl+NPTSV6I2wVTkAzXj+hXyqc8ldJGKI3OAbJ4DkgKsY5mRa1nf+0e5SorprdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644896; c=relaxed/simple;
	bh=TFhpZG6eIckp976K39st25serTz/ZH6yqHxKMmP5Oek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jLRwvrXnYHgRfJcc60kDsnlyupqmGPV23O5A0G1vyFqOXDu18WTo48D/yVij7tL4rUz07A4CouoS5uuJvwkk7hu7RDWRBTmpGKArm1UVlW/hhfde9Mf4uZuMTZrjbPI7VfeweoD+OSzOV19tBqzNZ+krLe3XcbC2nmtjmubm1hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=L9Jyf68h; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="L9Jyf68h"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7eb545db3afso4813771a34.0
        for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 07:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784644894; x=1785249694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VffFQp2iSzD3ZVFEr3nt7P07FQDLtRlz3fgwNX6bLhc=;
        b=L9Jyf68h6+14Gwfa2e0qVoqt68bx6f3WYmusVVBHtc9pGHlMYMF/fV4aKjxEY9qwdY
         f3gVfCQm00k3C/fwbdgorvzO+rx7L7g7GWtPJbx1h5XJ9Gmrsh+pcaqryqK6XvigtJgy
         r+CHZiCSq0hgCXTH6+CqpVv2F/0fSKtKLDsrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784644894; x=1785249694;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VffFQp2iSzD3ZVFEr3nt7P07FQDLtRlz3fgwNX6bLhc=;
        b=FH4N1g+x7Gv0V45rhrYVNrgVS22xE5sPceWHIgbZZiQYPyB/0W4p58AO3D8K8c4l8R
         5NFDbe3/uas4GED42hRjM/jqDbKz0BpBIcwSYGYVbTgZ6/weTTjFYqjr+RXevV/zL9Bd
         h044gf4OYEFoVoRWJrTtzDuU3z5ZAWv/hn0IslcVRO0MqE1ArzaslsxAwQkjieF+MYz8
         vYwB7kUsZhxpRol8pKdUTIf81eO7OwGdmV4urShSTCpuFXoCbUCxhSOyM6iVdbNGnL7u
         rLYnUCSOuCfS0mupaSMHNZK+hqzS7PEaXOu99nC2U11vyHFvNiGGOQkNvhrU54nzXdQK
         pkXQ==
X-Forwarded-Encrypted: i=1; AHgh+RoenT0vc3PU0kyT+ZBc99iz12HUQGfEtT9QIEUsymy7jBRt8cL1PK3OmrunBi3Q06WojoGd7KwaHyzp@vger.kernel.org
X-Gm-Message-State: AOJu0YxMUvtBl8XTxC7V3GV0MtSvAvm+XyMvhdJF3UDJU2Q5sw+ZMIYp
	RomMryJHkdjufiV4Kkh+HeUtNYcdGCzrWU8ZrbNo+rhrp1ViPPGrF0oxPGVzI/oGLrk=
X-Gm-Gg: AfdE7ckWd9Nyg2BIiK8VdmjIpDu0ZgieHX0H6Jf2buGCr2yiJgKCBdvLtykZFIT+P7Q
	7Fj/O/OcCs5dfVxiCmB7SaHP7eH/vPgxu0b9QeRIIJeHGryBxsGgXrNTM4HY9L90uoXmZFlndv5
	fYnCUjItUnr9OF3XiGKQvTLrggjwksQsQqh6A3qf+tws8WC6jizE76fHvyA/anlbgcc6NkqdI8W
	Sn9Llg0BsmjjyRJd9+cMNmM5vTvohvhpgi6z1pF6byVTtKwrX8Evco2A3+DBBhpg+TommPVfx2k
	XopS5bOCw5bTnAHXh0v/p9mGKDs02wmJurV2a9xhZUO2emdn/H2WwEMR0HHZkMRhnS0O4ID6TyW
	43uNtAJGJbJYB1C/OhPdXCuwB9sRgmLpnNb04l3E5OilqZhorQYgN80z318wFgfChqwFkaQl0Lq
	xlz/1g6PvfjTja2mrGpUY8WA==
X-Received: by 2002:a05:6830:6c12:b0:7ec:6749:f38f with SMTP id 46e09a7af769-7eda158ed6amr9403337a34.22.1784644893532;
        Tue, 21 Jul 2026 07:41:33 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edad98ab3dsm10663524a34.12.2026.07.21.07.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:41:32 -0700 (PDT)
Message-ID: <f54627c0-83fc-4df4-9539-e9df051cf2e8@linuxfoundation.org>
Date: Tue, 21 Jul 2026 08:41:29 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: test failure after merge of the kunit-next tree
To: David Gow <david@davidgow.net>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <alrCeerj_TmaqUuP@sirena.org.uk>
 <60e97b0c-701e-4b32-9056-32994fb8088a@davidgow.net>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <60e97b0c-701e-4b32-9056-32994fb8088a@davidgow.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/20/26 03:01, David Gow wrote:
> Le 18/07/2026 à 08:02, Mark Brown a écrit :
>> Hi all,
>>
>> After merging the kunit-next tree, today's linux-next build
>> (arm64 kunit) failed like this:
>>
>> [22:59:27] Configuring KUnit Kernel ...
>> [22:59:27] Building KUnit Kernel ...
>> Populating config with:
>> $ make ARCH=arm64 O=/tmp/next/arm64_kunit olddefconfig CROSS_COMPILE=aarch64-linux-gnu-
>> Building with:
>> $ make all compile_commands.json scripts_gdb ARCH=arm64 O=/tmp/next/arm64_kunit --jobs=192 CROSS_COMPILE=aarch64-linux-gnu-
>> [22:59:30] Starting KUnit Kernel (1/1)...
>> Running tests with:
>> $ qemu-system-aarch64 -nodefaults -m 1024 -kernel /tmp/next/arm64_kunit/arch/arm64/boot/Image.gz -append 'kunit.enable=1 console=ttyAMA0 kunit_shutdown=reboot' -no-reboot -nographic -accel kvm -accel hvf -accel tcg -serial stdio -machine virt -cpu max
>> [23:00:36] ============================================================
>> [23:00:36] ========== gpio-unbind-with-consumers (1 subtest) ==========
>> [23:00:36] # gpio_unbind_with_consumers: ASSERTION FAILED at drivers/gpio/gpiolib-kunit.c:393
>> [23:00:36] Expected ret == 0x0001, but
>> [23:00:36]     ret == 0 (0x0)
>> [23:00:36]     0x0001 == 1 (0x1)
>> [23:00:36] [FAILED] gpio_unbind_with_consumers
>> [23:00:36] # module: gpiolib_kunit
>> [23:00:36] =========== [FAILED] gpio-unbind-with-consumers ============
>> [23:00:36] # gpio-swnode-hog:     # failed to initialize (-17)
>> [23:00:36] [FAILED] gpio-swnode-hog
>> [23:00:36] ============================================================
>> [23:00:36] Testing complete. Ran 9377 tests: passed: 9284, failed: 2, skipped: 91
>> [23:00:36] Failures: gpio-unbind-with-consumers, gpio-swnode-hog
>> [23:00:36] Test results stored in /tmp/next/arm64_kunit.json
>> [23:00:36] Elapsed time: 69.716s total, 0.002s configuring, 3.680s building, 66.027s running
>>
>> This is caused by commit
>>
>>    a05cfd98c5eca (gpio: kunit: add test cases for software node hogs)
>>
>> which was from the gpio-brgl tree, it has only just become visible since
>>
>>    34b5c0132952c (kunit: configs: enable GPIO kunit test cases in all_tests.config)
>>
>> was added causing the gpiolib tests to actually be run though neither of
>> these commits was added today (the KUnit tree did not change for a
>> while).  I'm not clear why this has started failing today, presumably
>> some third commit from another tree has started triggering a regression
>> since neither of these trees has changed.
>>
>> I have left this for today.
> 
> 
> I'm pretty sure the fix for this is a part of:
> gpio: kunit: add test cases verifying swnode devlink support
> (https://lore.kernel.org/all/20260720-swnode-fw-devlink-v5-1-ec250ae6af91@oss.qualcomm.com/#r)
> 

Thanks David.

Hope this makes it into linux-next soon through gpio tree.

thanks,
-- Shuah
