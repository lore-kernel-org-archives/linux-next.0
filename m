From: Mark Salter <msalter@redhat.com>
Subject: linux-next build failure
Date: Fri, 08 Nov 2013 11:51:57 -0500
Message-ID: <1383929517.11574.92.camel@deneb.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:25093 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757423Ab3KHQwA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Nov 2013 11:52:00 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

I'm seeing a build failure for a no-MMU system:

   mm/built-in.o: In function `__vm_enough_memory':
  (.text+0x1ce70): undefined reference to `vm_commit_limit'
  fs/built-in.o: In function `meminfo_proc_show':
  meminfo.c:(.text+0x6852c): undefined reference to `vm_commit_limit'


This patch added vm_commit_limit() to mm/mmap.c, but no-mmu systems
use mm/nommu.c instead.

commit 50e05119f980037b474043434cb713bf6f859734
Author: Andrew Morton <akpm@linux-foundation.org>
Date:   Thu Nov 7 12:01:09 2013 +1100

    mm-factor-commit-limit-calculation-fix
    
    uninline vm_commit_limit()
