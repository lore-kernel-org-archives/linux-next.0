From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 21 Jan 2016 10:47:09 +0530
Message-ID: <20160121051709.GA4749@sudip-pc>
References: <20160121161156.69051295@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:36248 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750934AbcAUFR3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Jan 2016 00:17:29 -0500
Content-Disposition: inline
In-Reply-To: <20160121161156.69051295@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>

On Thu, Jan 21, 2016 at 04:11:56PM +1100, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (arm
> efm32_defconfig) failed like this:
> 
> fs/proc/task_nommu.c:132:28: error: 'mm' undeclared (first use in this function)
> 
> Caused by commit
> 
>   e87d4fd02f40 ("proc: revert /proc/<pid>/maps [stack:TID] annotation")

posted a patch for it few minutes ago.
https://patchwork.kernel.org/patch/8077421/

regards
sudip
