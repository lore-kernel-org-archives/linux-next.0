Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF31611E
	for <linux-next@vger.kernel.org>; Sun,  3 May 2026 00:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777766614; cv=none; b=ZDjhJ5UVZdiDBftcw2BHYyClZydvAgX9A2fGHbE2FCpLUdi6cJzfi6aDspt8UpdClRQDyH5ZWHvvU6AV1xzzGk2N5bz9WeArLF2FFMcjFlBWuNSpQYJ2mzirOcMu86YPc8Blcl7B8XmYMgsJold0nB7jKvWnONu3dfHC31bbLg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777766614; c=relaxed/simple;
	bh=bnA4uMJDXlFsfzQtlnjrNGaXzWhvMjlcYtxuRR/p6m0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=O9G9TW5Lk2KXeP3C2Tjv6LDjnnsD5oEl7gbR147ZFprROw5cIn4q0zrOe5ta582kZENIAh7ugBnGLL6SkU10cbXDK2KBO+sN4QC+De6Pyf+f8OezvLG7S56RFSbMc8Rta9bS8OwnUHNyx9QA5pwV5b0oubQa+TPMi5Hj8o3Knnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nvlRp8j+; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nvlRp8j+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=KgWnLf/mFwD1Hh3sBaH+YGaBoHD9/6I/6KRlAUewflQ=; b=nvlRp8j+/HTCnnNTy6Xe57wsOY
	Gt/09apg7UK5cV5SMjE3M51EklDvplc8gJ7qcDBz4Xa9n9fGauknLzlq6cnG9fLjMkCtQ//riiUpU
	9S+ho6d5iuD7orwVyImufSv6/btUuJOXg4wYqHrjzDJPr2/ysZRj8oF+pqjCfUW+uungX8jvuYmkJ
	WCxZNZlEjeQL5R3VxAZbI2ykZrRsyAmkuC8O+6KHiKE8VQfvHLjxQCB0k7Gl4qNjrJoy/UiRLnfbW
	VNUTl329wyVZnLBBeAqDCxt+bFD29C5EgVO3RCTGd3IhpZJx3YZlIyjiSuJ6bwB05mE5ZafbO7R/v
	bikF3WRw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJKIu-00000009wgg-3Hut;
	Sun, 03 May 2026 00:03:24 +0000
Message-ID: <c36e7dfb-cf62-4d21-a3b1-f54cb43e0832@infradead.org>
Date: Sat, 2 May 2026 17:03:23 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
Subject: does DRM_GPUSVM require hugepages?
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Content-Language: en-US
Cc: linux-next <linux-next@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

In linux-next-20260430, I'm seeing build errors on some ARCHes when
DRM_XE=m (probably just "is set") but HAVE_ARCH_TRANSPARENT_HUGEPAGE
is not set (not selected) by the ARCH.

Does drm_gpusvm.c require hugepages?
Or possibly DRM_XE needs some kind of restriction?

I see build failures on ARCH=alpha, ARCH=openrisc, ARCH=mips (32-bit
or 64-bit), and ARCH=arm (without ARM_LPAE set).

Example:
../drivers/gpu/drm/drm_gpusvm.c: In function 'drm_gpusvm_get_pages':
./../include/linux/compiler_types.h:699:45: error: call to '__compiletime_assert_361' declared with attribute error: BUILD_BUG failed
  699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |                                             ^
./../include/linux/compiler_types.h:680:25: note: in definition of macro '__compiletime_assert'
  680 |                         prefix ## suffix();                             \
      |                         ^~~~~~
./../include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
  699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
   40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:60:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   60 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
      |                     ^~~~~~~~~~~~~~~~
../include/linux/huge_mm.h:113:28: note: in expansion of macro 'BUILD_BUG'
  113 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
      |                            ^~~~~~~~~
../include/linux/huge_mm.h:120:35: note: in expansion of macro 'HPAGE_PMD_SHIFT'
  120 | #define HPAGE_PMD_SIZE  ((1UL) << HPAGE_PMD_SHIFT)
      |                                   ^~~~~~~~~~~~~~~
../drivers/gpu/drm/drm_gpusvm.c:1560:52: note: in expansion of macro 'HPAGE_PMD_SIZE'
 1560 |                                                    HPAGE_PMD_SIZE ?
      |                                                    ^~~~~~~~~~~~~~
make[6]: *** [../scripts/Makefile.build:289: drivers/gpu/drm/drm_gpusvm.o] Error 1

where include/linux/huge_mm.h:113: says:

#ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
#define HPAGE_PMD_SHIFT PMD_SHIFT
#define HPAGE_PUD_SHIFT PUD_SHIFT
#else
#define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; }) <<<<<<<<<<<<<<<<<< line 113
#define HPAGE_PUD_SHIFT ({ BUILD_BUG(); 0; })
#endif

-- 
~Randy

