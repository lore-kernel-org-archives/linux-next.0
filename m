From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: build failure after merge of the final tree (cgroup
 tree related)
Date: Wed, 20 Mar 2013 07:51:35 -0700
Message-ID: <20130320145135.GV3042@htj.dyndns.org>
References: <20130313161236.760c25633a4e8ea8d4847ccb@canb.auug.org.au>
 <51401DAB.1070602@huawei.com>
 <20130320154328.4b164061f7a58af5fb3f62e4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f47.google.com ([209.85.160.47]:62028 "EHLO
	mail-pb0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757276Ab3CTOvj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Mar 2013 10:51:39 -0400
Content-Disposition: inline
In-Reply-To: <20130320154328.4b164061f7a58af5fb3f62e4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Li Zefan <lizefan@huawei.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Mar 20, 2013 at 03:43:28PM +1100, Stephen Rothwell wrote:
> It has returned today.  Please be more careful.
> 
> In file included from include/linux/memcontrol.h:22:0,
>                  from include/linux/swap.h:8,
>                  from include/linux/suspend.h:4,
>                  from arch/powerpc/kernel/asm-offsets.c:24:
> include/linux/cgroup.h:742:13: warning: 'struct cgroupstats' declared inside parameter list [enabled by default]
> include/linux/cgroup.h:742:13: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
> 
> I have reverted commit c2c9ad164fa3 ("cgroup: remove unneeded includes
> from cgroup.h") for today.

Oops, my bad.  I mistakenly reverted the original commit from
for-next, not for-3.10 and got confused after applying more patches on
top.  Fixed up now.

Thanks.

-- 
tejun
