Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520BB3E95A7
	for <linux-next@vger.kernel.org>; Tue, 17 Mar 2026 15:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773760065; cv=pass; b=a3oXtIV8mH65fIDxhp9J2jZIi9Ox3gJPXAUnVHL5lUoV+G34u1Xy6+bSNIdT6PzmxZctXO2eUIvVSaM2qffocZKQcng00x/ytGv2mjuHb7EtwzLk9C6EbzAyRLVm8gspRs8FXNaliAS/IpFoGkz6Upb1V4hjhQdCeSjkUoO7INE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773760065; c=relaxed/simple;
	bh=iacGR+dLcrJn5jW4hL5FkpXaxtjv9MhzWWSRiVGm2Ro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c+8TLyR4QpJtQD7QgvN2jw9DVDHJspfYXD4NIxJyQ8m238UoQXwnYHPAyo4oRyCAftPzxQHlG5Wx5rmuLda1weKc3HgSeDIeN4McwTHFKIn8sAhHrkw5dKbdHvSmSzcBCERe+zmomIMFKGoPGpwCQDf4Jz1vX1b1D97wqyxGk2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKOC/PKa; arc=pass smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKOC/PKa"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-417c34b0509so3003315fac.1
        for <linux-next@vger.kernel.org>; Tue, 17 Mar 2026 08:07:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773760063; cv=none;
        d=google.com; s=arc-20240605;
        b=S2Fdk7PHmYq2GuP+7tkwOYLVfszZ87gRkuIZXQ8nuJ0fg/vVgxrZKe0FAfTd06HfCd
         c0gFkpSKF+hUba2tOM3DHRDRP8AYVbw7stNj6pxuUKN2hb0CnbXBAEyOT0HH7B2QaRC9
         DSXYOks4/+DB0HyyyOiZHgIiVIjgYFn4CazzmkpktOqYKsuplUIqmTd8XFSDeXQgG2TE
         LY29O/S4AmnBXk1yKCdvI30ZlZouwQwGjnOvEFajKN6TaEThcAgu6BSajMtxU8TaaETK
         IuVoI19ggNPuRzWEaYoyTxFLgZL0KQkyqOg4otWRWDNZIcl1GSd+U5WCIx+2cWaGZN3A
         sgQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GTP8JPFg9FfbjKKhMUsizMb4WgMFG5B+JV8fQsoWREo=;
        fh=CcRDFyL4VfCdrNDQ4VQQ4VT59sQVc8xlubltOr/4kOE=;
        b=f2NisoHJpMxXFqCjxnMndIm4rfLoT3bMkJSZPUyyp78lpJcXR9OgtSeQz5QkQIVXXB
         AgMCiOpjGSGiRK0is1DNQLTG/Z/uYf5HMoC2WytDJewpFNr8Eq7Pv/4PDhBf7NRiPEPJ
         f1TfiO6zfaasxFC/AZrt6/+b7B60TQ4lZOTM+hDgpn/JD57whrxwfNbaXEJZ+aUiQH+j
         eZUdZ+D1OUXWrVXgtd4pfMSgKbOVrsu8oqzmHBGxx0/0FAU43bRAGFwkVPuMKPfk5CeR
         tVf/kn6lYMQVPT79jTqQ7jXZP9/pBXfKuHItjoDmNbDNe2YZxR6v7XMKkGtggSRXCJYC
         8qbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773760063; x=1774364863; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GTP8JPFg9FfbjKKhMUsizMb4WgMFG5B+JV8fQsoWREo=;
        b=jKOC/PKaaPX99J2FuX33fiKOomtZtE+EhNkydLB/6ruZebnvHOMkVfZBL/xTo3rF20
         9Kp485xPGrMJl3oTXKKXnqgmM2BWXOZutLiRUUEqU+yRQvQTzQ5uSASMaUBG6VIXsOse
         mL0bqUDd0OKt8DI57e8+njGGeyu5IwkIkcBaS7OCie6x3g0C7sbf9ioMkLerABrYTlLv
         bxQjXmB+zSfUidIVeqT68uaTx5J/1HaAJWVGuoht0IK2mo9bvFIwuQAUtWQFrat3KXGO
         WMJiTPE5PVBiM0UHt/DImcsAwmD4NG4MQQF2crCTQ2khI9NDGSAUN+P+OK+W60aupMGn
         HwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773760063; x=1774364863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTP8JPFg9FfbjKKhMUsizMb4WgMFG5B+JV8fQsoWREo=;
        b=Sk/AXqF5inzfYibx6rLmaMGf1GZrZv1I25qRkbuGWa3JFyL3dFLrlRrYZVN3J7WvC7
         1SWJL7m/bRIo1f6+NhVUlE7cvIEi8nxdwYfuWMYZH52sQ9uDDELei8rUbPTCnedI6u3D
         UCN93HNyGGlIJSmnN84pj9NPIR2kftL+/d+AJB+yP2sHEtF7Yxo/7wckur/M9TMSoUFr
         bV08V3frDvjnbH6glquvPWtDTDsy9nEDl5Oq/HNZHSoYoPvF9i75h8pAvh+Zepxqpa4d
         Kkyxw9UeDPBE70b0qRIyjT3rAhLgQ/G0xdvpDOgSQQ+int1o1ZroPvRT2Y3FCxpi/kHa
         52ow==
X-Forwarded-Encrypted: i=1; AJvYcCVBQQvbDkF5Z1JtJe4fYoPd0hzln/NgbWB8XNnOfX081tafHpX32GIAEbmsuIBIrCta4rY30wEI11d2@vger.kernel.org
X-Gm-Message-State: AOJu0YznzyZ2s+TEtNqLOqV1VrOUgh+ZveAbhiVh+x2zq9nR1LNDMHOI
	V4WMXw5C5K75bnJVW1kgL7x5GMj52rYrdN/4tuyNCj9/zD52gfn6nUqLpw+zRlExdnn/7chz1s8
	Gc6LxZVMuKHmhxtwDuJRA8ZEzXNFBY6k=
X-Gm-Gg: ATEYQzyIyLo50pHvvsDU2XWJ8gVfup1UxPhl59tIVlfmcgy/c0mJ28Gd2zKrJtAK+Tn
	H7ht8WRc+Gdx3yxIamtaUtIjEntYuVBYNq31j98XlaQuBbbB98VhzMGfIaxe++5Ows3w2dZ5Ikl
	rEBiYqLUQNVuAKhHrpcbz2TwXmJxuizDOZEwooF9oAlrtXz+o8MlepKbMUFhBp86wbBCF/Zot2m
	Kt6uooRbbwlveqKbLNdjgs99pVMcOlrnr0hOsN6pNbkOhzgglPYOShAAcofyfGsFRazw1SIWoK2
	uy1Ydech9RSE5vKBYV/AGZjMHPFGrpcY8iKT1w==
X-Received: by 2002:a05:6871:4704:b0:417:6041:7740 with SMTP id
 586e51a60fabf-417b9484475mr10559305fac.49.1773760063174; Tue, 17 Mar 2026
 08:07:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ablmE1TqDmIYHiBH@sirena.org.uk> <412389f8-7d8f-414c-91f0-e748f370ad04@efficios.com>
In-Reply-To: <412389f8-7d8f-414c-91f0-e748f370ad04@efficios.com>
From: David CARLIER <devnexen@gmail.com>
Date: Tue, 17 Mar 2026 15:07:31 +0000
X-Gm-Features: AaiRm50DWc2x2E3smV9U6My8Y_M_IB7voxhc0A0QslW91F4X9Ptn1VHvXX78X28
Message-ID: <CA+XhMqzNiEnNFXhqwuX=GSWa3YqfbTX23dTvA5FUUp8zMy-ObQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the mm-nonmm-unstable tree
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Josh Law <objecting@objecting.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi all I ve send a patch to all involved parties. Cheers.

On Tue, 17 Mar 2026 at 15:06, Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> On 2026-03-17 10:32, Mark Brown wrote:
> > Hi all,
> >
> > After merging the mm-unstable tree, today's linux-next build (arm64
> > kunit) failed like this:
> >
> > [13:30:42] # hpcc_test_compare_value_boundaries: EXPECTATION FAILED at lib/tests/percpu_counter_tree_kunit.c:157
> > [13:30:42] Expected 1 == percpu_counter_tree_precise_compare_value(&pct, (long)under), but
> > [13:30:42]     percpu_counter_tree_precise_compare_value(&pct, (long)under) == 0 (0x0)
> > [13:30:42] # hpcc_test_compare_value_boundaries: EXPECTATION FAILED at lib/tests/percpu_counter_tree_kunit.c:160
> > [13:30:42] Expected -1 == percpu_counter_tree_precise_compare_value(&pct, -(long)over), but
> > [13:30:42]     percpu_counter_tree_precise_compare_value(&pct, -(long)over) == 0 (0x0)
> > [13:30:42] [FAILED] hpcc_test_compare_value_boundaries
> > [13:30:42] # hpcc_test_compare_counter_boundaries: EXPECTATION FAILED at lib/tests/percpu_counter_tree_kunit.c:246
> > [13:30:42] Expected 1 == percpu_counter_tree_precise_compare(&pct[0], &pct[1]), but
> > [13:30:42]     percpu_counter_tree_precise_compare(&pct[0], &pct[1]) == 0 (0x0)
> > [13:30:42] # hpcc_test_compare_counter_boundaries: EXPECTATION FAILED at lib/tests/percpu_counter_tree_kunit.c:251
> > [13:30:42] Expected -1 == percpu_counter_tree_precise_compare(&pct[0], &pct[1]), but
> > [13:30:42]     percpu_counter_tree_precise_compare(&pct[0], &pct[1]) == 0 (0x0)
> > [13:30:42] [FAILED] hpcc_test_compare_counter_boundaries
> > [13:30:42] [PASSED] hpcc_test_init_one
> > [13:30:42] [PASSED] hpcc_test_set
> > [13:30:42]     # module: percpu_counter_tree_kunit
> > [13:30:42] # percpu_counter_tree: pass:8 fail:2 skip:0 total:10
> >
> > ...
> >
> > [13:30:47] Testing complete. Ran 9088 tests: passed: 9015, failed: 2, skipped: 71
> > [13:30:47] Failures: percpu_counter_tree.hpcc_test_compare_value_boundaries, percpu_counter_tree.hpcc_test_compare_counter_boundaries
> >
> > Triggered by commit
> >
> >    ebc1ff504f557 (lib: add kunit boundary tests for percpu_counter_tree comparisons)
> >
> > though as it's a newly added test it's obviously entirely plausible that
> > it's flagging an existing bug.  I used the tree from next-20260316
> > instead.
>
> I've been able to reproduce with 1 cpu:
>
> branch: mm-unstable
> commit dffde584d805 ("zram: propagate read_from_bdev_async() errors")
>
> cat .kunit/.kunitconfig
> CONFIG_KUNIT=y
> CONFIG_SMP=y
> CONFIG_PREEMPT=y
> CONFIG_NR_CPUS=32
> CONFIG_HOTPLUG_CPU=y
> CONFIG_PERCPU_COUNTER_TREE_TEST=y
>
> /tools/testing/kunit/kunit.py run --arch=x86_64 --qemu_args="-smp 1"
>
> [10:48:04] Configuring KUnit Kernel ...
> [10:48:04] Building KUnit Kernel ...
> Populating config with:
> $ make ARCH=x86_64 O=.kunit olddefconfig
> Building with:
> $ make all compile_commands.json scripts_gdb ARCH=x86_64 O=.kunit --jobs=384
> [10:48:07] Starting KUnit Kernel (1/1)...
> [10:48:07] ============================================================
> Running tests with:
> $ qemu-system-x86_64 -nodefaults -m 1024 -kernel .kunit/arch/x86/boot/bzImage -append 'kunit.enable=1 console=ttyS0 kunit_shutdown=reboot' -no-reboot -nographic -accel kvm -accel hvf -accel tcg -serial stdio -bios qboot.rom -smp 1
> [10:48:08] ============ percpu_counter_tree (10 subtests) =============
> [10:48:08] [PASSED] hpcc_print_info
> [10:48:15] [PASSED] hpcc_test_single_thread_first
> [10:48:19] [PASSED] hpcc_test_single_thread_first_random
> [10:48:19] [PASSED] hpcc_test_single_thread_random
> [10:48:34] [PASSED] hpcc_test_multi_thread_batch_increment
> [10:48:34] [PASSED] hpcc_test_multi_thread_random_walk
> [10:48:34] # hpcc_test_compare_value_boundaries: EXPECTATION FAILED at lib/tests/percpu_counter_tree_kunit.c:157
> [10:48:34] Expected 1 == percpu_counter_tree_precise_compare_value(&pct, (long)under), but
> [10:48:34]     percpu_counter_tree_precise_compare_value(&pct, (long)under) == 0 (0x0)
> [10:48:34] # hpcc_test_compare_value_boundaries: EXPECTATION FAILED at lib/tests/percpu_counter_tree_kunit.c:160
> [10:48:34] Expected -1 == percpu_counter_tree_precise_compare_value(&pct, -(long)over), but
> [10:48:34]     percpu_counter_tree_precise_compare_value(&pct, -(long)over) == 0 (0x0)
> [10:48:34] [FAILED] hpcc_test_compare_value_boundaries
> [10:48:34] # hpcc_test_compare_counter_boundaries: EXPECTATION FAILED at lib/tests/percpu_counter_tree_kunit.c:246
> [10:48:34] Expected 1 == percpu_counter_tree_precise_compare(&pct[0], &pct[1]), but
> [10:48:34]     percpu_counter_tree_precise_compare(&pct[0], &pct[1]) == 0 (0x0)
> [10:48:34] # hpcc_test_compare_counter_boundaries: EXPECTATION FAILED at lib/tests/percpu_counter_tree_kunit.c:251
> [10:48:34] Expected -1 == percpu_counter_tree_precise_compare(&pct[0], &pct[1]), but
> [10:48:34]     percpu_counter_tree_precise_compare(&pct[0], &pct[1]) == 0 (0x0)
> [10:48:34] [FAILED] hpcc_test_compare_counter_boundaries
> [10:48:34] [PASSED] hpcc_test_init_one
> [10:48:34] [PASSED] hpcc_test_set
> [10:48:34]     # module: percpu_counter_tree_kunit
> [10:48:34] # percpu_counter_tree: pass:8 fail:2 skip:0 total:10
> [10:48:34] # Totals: pass:8 fail:2 skip:0 total:10
> [10:48:34] =============== [FAILED] percpu_counter_tree ===============
> [10:48:34] ============================================================
> [10:48:34] Testing complete. Ran 10 tests: passed: 8, failed: 2
> [10:48:34] Elapsed time: 30.726s total, 0.001s configuring, 3.074s building, 27.600s running
>
> Thanks,
>
> Mathieu
>
>
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> https://www.efficios.com
