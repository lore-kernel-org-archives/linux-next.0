Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ABC3BADB5;
	Wed, 29 Apr 2026 09:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777453824; cv=none; b=gYuXuwjpJdzbnNnRAHGo/dRisYqLdpo1fk/7cQpcH0PILSB09c78txDHsxWohzGjgML1fhHKDgiUcycDCQDUf5yGObQXJ46Qr9VC5UTEJA6CKFOYzCMdULMQiStda94V77wgqQkXnwa4JIS9FmxJvHCx6tBNq2YbYFhcljFg/V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777453824; c=relaxed/simple;
	bh=jSBBEiViULb3UU9dZ6BYCzqUgDa5grdPDSs329n6OPk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qcId9GPP8C9HUM7bdgqD5W/nuirPguVGYsvr5wCme+7G04/VT9cU90H9rU+dO29UZf41M+eC3NBc3BIwJnfcVbkWslOnxMb6dNPVpHX184loO+sTfpDJcTNFml6i0tbOLx/Ol1PAc0NGpL4g5fp1sE1RM36R2P3GPxK7d/VCGTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTvY8EKz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HTvY8EKz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E318C19425;
	Wed, 29 Apr 2026 09:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777453824;
	bh=jSBBEiViULb3UU9dZ6BYCzqUgDa5grdPDSs329n6OPk=;
	h=From:To:Cc:Subject:Date:From;
	b=HTvY8EKzlMx5vWgCremY+Cd+kNz3Z3Oh6XNQjXZ/McEsABBPaGBN+9VppoTzmbTZf
	 kbgjEVovlni2IUmc5G9QF3g5lXRb2mSjR+WNjZi36AD/0gI70mCffY0hG1XGW2jsBg
	 hIIwv2eTy53ab3UFgwHxLD1mT0ZJQzXE5Sc3fiuKK6zoFUd5NrDhV1LCfigN0ztC1w
	 OqeEpJ/fRizRq8JT7+WRWQMV8Ve5xhf06RJU7i6UKdFL6GZkZz4m1194raKcIEzoIC
	 mXTRSg1et0JmqBDHG0oy7STtQSjjJsXTXxQ0YmerAqWUDom4oVdLfSZp/Z9FAQF6k5
	 HWbWe+qjcaUqA==
From: Thierry Reding <thierry.reding@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm-nonmm-unstable tree
Date: Wed, 29 Apr 2026 11:10:18 +0200
Message-ID: <20260429091019.3967613-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

After merging the mm-nonmm-unstable tree, today's linux-next build
(arm64 defconfig) failed like this:

    In file included from /srv/kbuild/next/linux.git/arch/arm64/include/asm/fixmap.h:118,
                     from /srv/kbuild/next/linux.git/arch/arm64/include/asm/pgtable.h:36,
                     from /srv/kbuild/next/linux.git/include/linux/pgtable.h:6,
                     from /srv/kbuild/next/linux.git/arch/arm64/include/asm/io.h:12,
                     from /srv/kbuild/next/linux.git/include/linux/io.h:12,
                     from /srv/kbuild/next/linux.git/include/acpi/acpi_io.h:5,
                     from /srv/kbuild/next/linux.git/include/linux/acpi.h:40,
                     from /srv/kbuild/next/linux.git/include/acpi/apei.h:9,
                     from /srv/kbuild/next/linux.git/include/acpi/ghes.h:5,
                     from /srv/kbuild/next/linux.git/include/linux/arm_sdei.h:8,
                     from /srv/kbuild/next/linux.git/arch/arm64/kernel/asm-offsets.c:11:
    /srv/kbuild/next/linux.git/include/asm-generic/fixmap.h: In function 'set_fixmap_nocache':
    /srv/kbuild/next/linux.git/include/asm-generic/fixmap.h:54:29: error: 'PAGE_KERNEL_NOCACHE' undeclared (first use in this function); did you mean 'PAGE_KERNEL_ROX'?
       54 | #define FIXMAP_PAGE_NOCACHE PAGE_KERNEL_NOCACHE
          |                             ^~~~~~~~~~~~~~~~~~~
    /srv/kbuild/next/linux.git/include/asm-generic/fixmap.h:93:33: note: in expansion of macro 'FIXMAP_PAGE_NOCACHE'
       93 |         __set_fixmap(idx, phys, FIXMAP_PAGE_NOCACHE);
          |                                 ^~~~~~~~~~~~~~~~~~~
    /srv/kbuild/next/linux.git/include/asm-generic/fixmap.h:54:29: note: each undeclared identifier is reported only once for each function it appears in
       54 | #define FIXMAP_PAGE_NOCACHE PAGE_KERNEL_NOCACHE
          |                             ^~~~~~~~~~~~~~~~~~~
    /srv/kbuild/next/linux.git/include/asm-generic/fixmap.h:93:33: note: in expansion of macro 'FIXMAP_PAGE_NOCACHE'
       93 |         __set_fixmap(idx, phys, FIXMAP_PAGE_NOCACHE);
          |                                 ^~~~~~~~~~~~~~~~~~~
    /srv/kbuild/next/linux.git/include/asm-generic/fixmap.h: In function 'set_fixmap_offset_nocache':
    /srv/kbuild/next/linux.git/include/asm-generic/fixmap.h:54:29: error: 'PAGE_KERNEL_NOCACHE' undeclared (first use in this function); did you mean 'PAGE_KERNEL_ROX'?
       54 | #define FIXMAP_PAGE_NOCACHE PAGE_KERNEL_NOCACHE
          |                             ^~~~~~~~~~~~~~~~~~~
    /srv/kbuild/next/linux.git/include/asm-generic/fixmap.h:99:40: note: in expansion of macro 'FIXMAP_PAGE_NOCACHE'
       99 |         __set_fixmap_offset(idx, phys, FIXMAP_PAGE_NOCACHE);
          |                                        ^~~~~~~~~~~~~~~~~~~

Caused by commit

    dd4bbc6d8e3a ("include/asm-generic/fixmap.h: reimplement nasty macros in C")

I've reverted this patch in linux-next for now.

Thanks,
Thierry
