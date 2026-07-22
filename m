Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87FD383333
	for <linux-next@vger.kernel.org>; Wed, 22 Jul 2026 22:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784760971; cv=none; b=e/gcMLZd2wErH228DZXoH964LPGTPEDe4zn93xD5CIh3L+y2O+Fqn4jVzd7PU8Pk4yTqB0uDWm9SLFL6ZD3II+ppNx/1ijMMLnZqOj9e0d7vK4UoYp2j7/y8IZfFCDCT1ZasBYddM9brNpTMN/9sWncc6fYoM/xH7dWqEMYUyA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784760971; c=relaxed/simple;
	bh=r1kmZRLtQIiEX5RG2wWHT9LokdhsD7pL3aXxke0CQQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JXy4fASBlsg2ToUj4QtSCo8mWlPb7TPWeQ5U0G2IW/cjeCHi8yzULZG/5aUDfopm8vpV3ODMGAssxGbVut0C3ALeenh79DvOtt5qAuDT3OwSDVhz8wrOR5NA9HVZJP3MJ672CBsCtZNoPjHmczLsuFjgBZE0q2qOY4vTutCA8H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPkBpSIy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPkBpSIy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5E81F000E9;
	Wed, 22 Jul 2026 22:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784760970;
	bh=nnwsPKVbi4DvaYV8nWWsvMkgYyamzu5KTWQUU7aAxNA=;
	h=Date:From:To:Cc:Subject;
	b=ZPkBpSIygpo7zwkLCFfrCkN630Q73t3unwq8Ryg3gZLQahZp2q8QHd3pusDqaWtUw
	 c1Ere6dRXFMjYAvUd4fBwfDY9764WDASWOTPEnRvIKayNXrfrzyhJV+PRdNg0XLRJa
	 yznM14j+ZswrRsLK/JeWZQR4glE9mIkh29df2kUcdv5H9qJAxRNPdyCpeiTFpXKY6k
	 cbnzAi712V0pfeO1mVq6hGA5CfBDZcH3REZ5TLkNiN/r1Jg6mnA7p8C+MsItzOuefT
	 ooMHeyX2qXK0WnmukgtbNlsbfnsKdJOmKKE5JBmOhXJGDafvFgQoVHEtRxKuOIwDJe
	 PivPabZFBIrvw==
Date: Wed, 22 Jul 2026 15:56:05 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Matthew Brost <matthew.brost@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Usama Arif <usama.arif@linux.dev>
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
	linux-next@vger.kernel.org
Subject: Semantic conflict between 04b177544a04 in drm-misc-fixes and
 0b6b1bb28482 in -mm
Message-ID: <20260722225605.GA1910198@ax162>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark and drm and mm folks,

There is a semantic conflict between commit 04b177544a04 ("drm/pagemap:
Guard HPAGE_PMD_ORDER use with CONFIG_ARCH_ENABLE_THP_MIGRATION") in the
drm-misc-fixes tree and commit 0b6b1bb28482 ("mm: rename
ARCH_ENABLE_THP_MIGRATION to ARCH_HAS_PMD_SOFTLEAVES"), resulting in a
lone instance of CONFIG_ARCH_ENABLE_THP_MIGRATION with no way to define
it.

  $ git grep ARCH_ENABLE_THP_MIGRATION
  Next/merge.log:Merging drm-misc-fixes/for-linux-next-fixes (04b177544a040 drm/pagemap: Guard HPAGE_PMD_ORDER use with CONFIG_ARCH_ENABLE_THP_MIGRATION)
  drivers/gpu/drm/drm_pagemap.c:#if IS_ENABLED(CONFIG_ARCH_ENABLE_THP_MIGRATION)

This results in an objtool warning (or error with CONFIG_OBJTOOL_WERROR)
when building with clang because NR_PAGES(order) results in 1U << -1,
which causes clang to stop generating code for
drm_pagemap_migrate_to_devmem() when encountering unconditional
undefined behavior.

  drivers/gpu/drm/drm_gpusvm_helper.o: error: objtool: drm_pagemap_migrate_to_devmem() falls through to next function drm_pagemap_zdd_alloc()

Mark, could please apply the following diff to the -mm merge to avoid
this? Obviously, there will need to be further coordination for
resolving this upstream when the time comes but it is only an issue in
-next currently.

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 4a794544b7dc..f00c27edbfb9 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -12,7 +12,7 @@
 #include <drm/drm_pagemap_util.h>
 #include <drm/drm_print.h>
 
-#if IS_ENABLED(CONFIG_ARCH_ENABLE_THP_MIGRATION)
+#if IS_ENABLED(CONFIG_ARCH_HAS_PMD_SOFTLEAVES)
 #define DRM_PAGEMAP_PMD_ORDER	HPAGE_PMD_ORDER
 #else
 #define DRM_PAGEMAP_PMD_ORDER	(-1)
-- 
Cheers,
Nathan
