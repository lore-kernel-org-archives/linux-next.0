From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 21 Apr 2016 16:00:16 +1000
Message-ID: <20160421160016.3221533d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60202 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751188AbcDUGAT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Apr 2016 02:00:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hugh Dickins <hughd@google.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

mm/built-in.o: In function `handle_mm_fault':
frame_vector.c:(.text+0x29628): undefined reference to `do_huge_pmd_anonymous_page'

(Ignore the "frame_vector.c" above it is obviously incorrect.)

Probably caused by commit

  747220c26dd0 ("huge tmpfs: add shmem_pmd_fault()")

[Andrew: I added this patch from Hugh today ... see other emails]

The condition protecting the call to do_huge_pmd_anonymous_page()
in __handle_mm_fault() has becom more complicated and so the call
has presumably no longer been removed by the compiler for the
!CONFIG_TRANSPARENT_HUGEPAGE case.

I have reverted that commit for today.

-- 
Cheers,
Stephen Rothwell
