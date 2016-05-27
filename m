From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm-current tree
Date: Fri, 27 May 2016 13:07:10 +1000
Message-ID: <20160527130710.04d4d859@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39359 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932168AbcE0DHN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 May 2016 23:07:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

mm/oom_kill.c: In function '__oom_reap_task':
mm/oom_kill.c:537:2: warning: 'mm' may be used uninitialized in this function [-Wmaybe-uninitialized]
  mmput_async(mm);
  ^

Introduced by commit

  df1e2f56632d ("oom_reaper: close race with exiting task")

This is real - the first "goto unlock_oom" is before "mm" has been
assigned.

-- 
Cheers,
Stephen Rothwell
