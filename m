Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58BC33B975
	for <linux-next@vger.kernel.org>; Sat,  4 Jul 2026 04:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783140753; cv=none; b=osq7s8+JUakTlKI4TxwBKwJMc6wI9B1VR7i/SJaqInuPZLj/y2qbFi/mNcIXIAHgPe/1chrzmqvIeY5lOB08VassLc5tNeodPg02FV1dPZKj/phdC2mhwJDWN998VZtdXJgER9pLM8lpk+9oeI6PHQNMnpN54KNY3ciCS0ZUvf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783140753; c=relaxed/simple;
	bh=sqfHb9uUIdd4axPbZVGAm3wY2YRGgsL3vSdDIoP0Zq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VE5MuuJ/P71WXCAIRIslLJnsopFAyT50Ni7a/W0nBMfYCekur0b7WsEFPTbAshdm01i1zOZ2wPAWhG/GzR4mnmYbb6Bztcu+85YbpUvDtd54t38/dkZGFlAJOwelS+eu2TSobnQQnNO2eFjDV5MixlftAchRm1OBN6w8AA3s9+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oI8wmXBx; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oI8wmXBx"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso6740615e9.2
        for <linux-next@vger.kernel.org>; Fri, 03 Jul 2026 21:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783140750; x=1783745550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUxXXUuyWOByYqLo0qCy6mlleHVbTr47A7oPEj/z7yI=;
        b=oI8wmXBxm+xC+fsmxqmokOpUXKFrZuvlsfxSeXX/dVVl3CufiTzS3h8hpIH7T6/N2K
         sOrE+OdwvfYvwJcinGsxWNw/LIpKcKeDfqqLcxMt6xwRydS8s7TXl08X+Z2InAejEAQ3
         65m3wHQvcT7ICIYRqbAcYmNJkiQTu7t0ZpV4GgrQXucCsUYBOpCJUw0NMf50NeANnKHy
         I6DiTLzEJhe2fGYgwqD1Fc4oZJqsAUFpZczYyqwTqwYCTydmb1CQTAzF2PzdmngSws8U
         +3/IBN0t1MTKroU7Nf65DcZDAvfy8QRF0REyeQLvr5GSU4h2EdnY0vbLdL8l9btTFjxT
         R36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783140750; x=1783745550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZUxXXUuyWOByYqLo0qCy6mlleHVbTr47A7oPEj/z7yI=;
        b=M3MMQFbDBI4fb9LttYne08CCApnvHLDzAr1GubooKnJ5URn0UKonrEXF51i9WvjfFA
         n9QVOuxvEnl8frNt2vOflN2KsX2lYB9pS3kR2l+XEvatHJ/nNNGe+mBTfvRvvYgF8Mwe
         u2b/3M1j2ShSKP+98yOHLQthr8/URKP+5rZtcwxlC3lJBcAetAhDcU/f5fvBdfcY+TYK
         6D/b3J5VKlrV7Jc3w6lNiZ8DBOzHFacp1HPfAh4mac34nsgJM0HpM9chuE4/OPJz+8nu
         QeLb5YNULy/6tjnqwJVqgoqxBw35YFs25aLgcokHzMAzB9jDGx4PbESJQwu2HEWXYHka
         cklg==
X-Forwarded-Encrypted: i=1; AFNElJ8DjTP2E7+WmdIb1sKc17IIWbGTDsYVGTomX8hcfcC2lWI0fHA57+S7bFtFLo22B/D4tldVYJvoLma6@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdcym+ISwoUHPKP1NTDn5pIagDj76aIXEgE6F5bV7jIB83pb0z
	Fvw3wFlUcJ8tDC4Rq38ON6ADXI3Aqzf8P3UlgDLydvOHGdVfNHm/6aI=
X-Gm-Gg: AfdE7cmN0x5hOMnGMFNktU/OUcdu2C+p8iNlXmpTlKzZ+xR9BHZFSSkRmPlQ5IqHMPJ
	pkgRrfPwk38xKdoBc3BPwQnOhJVjy3DbYrG3QTbLBzAD3MHO3caXkOSk+VoiGni4o1+vwDHlItK
	IYM1uve0U2FBS+77IVeB9pYqg8nhIibfL5wCcFVDFJTbD3rnBA7q4RbiQxrcJAROpK1RV1jJHly
	FxXEd1EUtE8d7QJv6NkALFAAYeyXcEAPbeB4yT0kBcZ3TGdOtATSbqsdTkMCeC4llU9lQiZRDgS
	deR8UPnvA0fOaiwPO0bEWT4W38+BNHIUYHlRtPdJ8toVjlOBJlh6WAY08Wjm2QOiu1ea96zyB4N
	N+wthp2U9S0VrTqjzhWQgoZMI9SHcarfMBXEAiBPkHMPYQJy6yA5ArYpvaUWCim3JyvkG2T1uCR
	t+
X-Received: by 2002:a05:600c:1907:b0:493:c3c9:218c with SMTP id 5b1f17b1804b1-493d3139fe7mr3348955e9.30.1783140750262;
        Fri, 03 Jul 2026 21:52:30 -0700 (PDT)
Received: from p183 ([178.172.147.87])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d780csm4777786f8f.11.2026.07.03.21.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 21:52:29 -0700 (PDT)
Date: Sat, 4 Jul 2026 07:55:40 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: KUnit failure after merge of the mm-nonmm-unstable
 tree
Message-ID: <afc8f908-4add-4da8-816c-9a6c06619b18@p183>
References: <akfKl6lJlGL6fPG3@sirena.org.uk>
 <992f91e5-a6cc-4b16-8026-74c9d32bc08d@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <992f91e5-a6cc-4b16-8026-74c9d32bc08d@sirena.org.uk>

On Fri, Jul 03, 2026 at 05:39:59PM +0100, Mark Brown wrote:
> On Fri, Jul 03, 2026 at 03:43:35PM +0100, Mark Brown wrote:
> > Hi all,
> > 
> > After merging the mm-nonmm-unstable tree, today's linux-next failed
> > KUnit testing like this:
> > 
> > [14:20:52] Configuring KUnit Kernel ...
> > [14:20:52] Building KUnit Kernel ...
> > Populating config with:
> > $ make ARCH=arm64 O=/tmp/next/arm64_kunit olddefconfig CROSS_COMPILE=aarch64-linux-gnu-
> > Building with:
> > $ make all compile_commands.json scripts_gdb ARCH=arm64 O=/tmp/next/arm64_kunit --jobs=192 CROSS_COMPILE=aarch64-linux-gnu-
> > [14:21:06] Starting KUnit Kernel (1/1)...
> > Running tests with:
> > $ qemu-system-aarch64 -nodefaults -m 1024 -kernel /tmp/next/arm64_kunit/arch/arm64/boot/Image.gz -append 'kunit.enable=1 console=ttyAMA0 kunit_shutdown=reboot' -no-reboot -nographic -accel kvm -accel hvf -accel tcg -serial stdio -machine virt -cpu max
> > [14:22:11] ============================================================
> > [14:22:11] =================== cmdline (8 subtests) ===================
> > [14:22:11] # cmdline_test_memparse: EXPECTATION FAILED at lib/tests/cmdline_kunit.c:249
> > [14:22:11] Expected ret == e->result, but
> > [14:22:11]     ret == -16 (0xfffffffffffffff0)
> > [14:22:11]     e->result == -1 (0xffffffffffffffff)
> > [14:22:11] when parsing '0xffffffffffffffff0'
> > [14:22:11] [FAILED] cmdline_test_memparse
> > [14:22:11]     # module: cmdline_kunit
> > [14:22:11] # cmdline: pass:7 fail:1 skip:0 total:8
> > [14:22:11] # Totals: pass:7 fail:1 skip:0 total:8
> > [14:22:11] ===================== [FAILED] cmdline =====================
> > [14:22:11] ============================================================
> > [14:22:11] Testing complete. Ran 9225 tests: passed: 9104, failed: 1, skipped: 120
> > [14:22:11] Failures: cmdline.cmdline_test_memparse
> > [14:22:11] Test results stored in /tmp/next/arm64_kunit.json
> > [14:22:11] Elapsed time: 79.318s total, 0.002s configuring, 14.632s building, 64.682s running
> > 
> > I honestly have no idea what's triggering this, nothing jumps out from
> > the commits introduced in the merge of the branch.  If I have time later
> > I'll try to bisect the issue.  I have used the tree from next-20260602
> > instead.
> 
> bisect tells me it's due to:
> 
>   e595545005616 (Revert "lib: fix _parse_integer_limit() to handle overflow")

No, it is due to

	commit 9a4580db6e9f83428813f671a79486469684069f
	lib: fix memparse() to handle overflow

memparse should be rewritten with _parse_integer().
