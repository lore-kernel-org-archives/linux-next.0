From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH linux-next]cgroup: move list add after list head
 initilization
Date: Wed, 28 Nov 2012 06:04:54 -0800
Message-ID: <20121128140454.GC15971@htj.dyndns.org>
References: <1354094121.3054.28.camel@ThinkPad-T5421.cn.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:54497 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754913Ab2K1OFA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Nov 2012 09:05:00 -0500
Received: by mail-pa0-f46.google.com with SMTP id bh2so6796547pad.19
        for <linux-next@vger.kernel.org>; Wed, 28 Nov 2012 06:05:00 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1354094121.3054.28.camel@ThinkPad-T5421.cn.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Li Zhong <zhong@linux.vnet.ibm.com>
Cc: linux-next list <linux-next@vger.kernel.org>, lizefan@huawei.com

On Wed, Nov 28, 2012 at 05:15:21PM +0800, Li Zhong wrote:
> commit 2243076ad128d0cc196cf6597e6ddcf6bc907676 initialize
> cgrp->allcg_node in init_cgroup_housekeeping(). Then in
> init_cgroup_root(), we should call init_cgroup_housekeeping() before
> adding it to &root->allcg_list. Otherwise, we are initializing an entry
> already in a list. 
> 
> Signed-off-by: Li Zhong <zhong@linux.vnet.ibm.com>

Applied to cgroup/for-3.8.  Thanks!

-- 
tejun
