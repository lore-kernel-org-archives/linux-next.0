From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Merge request for kmemleak patches
Date: Tue, 28 Jul 2009 10:15:59 +0100
Message-ID: <1248772559.17665.12.camel@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([193.131.176.58]:62962 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751870AbZG1JQH (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Jul 2009 05:16:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>

Hi Stephen,

There are a few more kmemleak patches for the upcoming merging window
(the first one will be pushed before). Could you please pull them into
the -next tree? Thanks.


The following changes since commit 4be3bd7849165e7efa6b0b35a23d6a3598d97465:
  Linus Torvalds (1):
        Linux 2.6.31-rc4

are available in the git repository at:

  git://linux-arm.org/linux-2.6.git kmemleak

Catalin Marinas (8):
      kmemleak: Protect the seq start/next/stop sequence by rcu_read_lock()
      kmemleak: Dump object information on request
      kmemleak: Allow rescheduling during an object scanning
      kmemleak: Mark the early log buffer as __initdata
      kmemleak: Save the stack trace for early allocations
      kmemleak: Do not report alloc_bootmem blocks as leaks
      kmemleak: Inform kmemleak about kernel stack allocation
      kmemleak: Always scan the task stacks

Sergey Senozhatsky (1):
      kmemleak: Printing of the objects hex dump

 Documentation/kmemleak.txt         |   12 +-
 arch/x86/include/asm/thread_info.h |    7 +-
 arch/x86/kernel/process.c          |    1 +
 include/linux/kmemleak.h           |   18 ++--
 kernel/fork.c                      |    7 +-
 mm/bootmem.c                       |    6 +-
 mm/kmemleak.c                      |  199 ++++++++++++++++++++++++++----------
 7 files changed, 179 insertions(+), 71 deletions(-)

-- 
Catalin
