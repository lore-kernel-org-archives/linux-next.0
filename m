From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm-current tree
Date: Tue, 1 Aug 2017 15:22:44 +1000
Message-ID: <20170801152244.0a19eeb4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40423 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750763AbdHAFWq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Aug 2017 01:22:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Hocko <mhocko@suse.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

fs/proc/task_mmu.c: In function 'show_map_vma':
fs/proc/task_mmu.c:285:28: warning: unused variable 'priv' [-Wunused-variable]
  struct proc_maps_private *priv = m->private;
                            ^

Introduced by commit

  14ccc3193225 ("fs, proc: remove priv argument from is_stack")

-- 
Cheers,
Stephen Rothwell
