Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431C3C77B7C
	for <linux-next@archiver.kernel.org>; Thu,  4 May 2023 13:21:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbjEDNVz (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 4 May 2023 09:21:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230386AbjEDNVy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 May 2023 09:21:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECE687287;
        Thu,  4 May 2023 06:21:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 89EAB63421;
        Thu,  4 May 2023 13:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 981B1C4339B;
        Thu,  4 May 2023 13:21:52 +0000 (UTC)
From:   Mark Brown <broonie@finisterre.sirena.org.uk>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Lorenzo Stoakes <lstoakes@gmail.com>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: linux-next: manual merge of the tip tree with the mm-unstable tree
Date:   Thu,  4 May 2023 22:21:48 +0900
Message-Id: <20230504132148.182960-1-broonie@finisterre.sirena.org.uk>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  mm/gup.c

between commit:

  2353d85b4e9c2 ("mm/gup: disallow FOLL_LONGTERM GUP-nonfast writing to file-backed mappings")

from the mm-unstable tree and commit:

  75818f575af6d ("mm: Don't allow write GUPs to shadow stack memory")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc mm/gup.c
index 802dbe46a401a,80258a640135a..0000000000000
--- a/mm/gup.c
+++ b/mm/gup.c
@@@ -1017,11 -978,7 +1017,11 @@@ static int check_vma_flags(struct vm_ar
  		return -EFAULT;
  
  	if (write) {
 +		if (!vma_anon &&
 +		    !writable_file_mapping_allowed(vma, gup_flags))
 +			return -EFAULT;
 +
- 		if (!(vm_flags & VM_WRITE)) {
+ 		if (!(vm_flags & VM_WRITE) || (vm_flags & VM_SHADOW_STACK)) {
  			if (!(gup_flags & FOLL_FORCE))
  				return -EFAULT;
  			/* hugetlb does not support FOLL_FORCE|FOLL_WRITE. */
