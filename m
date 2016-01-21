From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 21 Jan 2016 16:25:45 +1100
Message-ID: <20160121162545.367f8ec2@canb.auug.org.au>
References: <20160121161156.69051295@canb.auug.org.au>
	<20160121051709.GA4749@sudip-pc>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55384 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750788AbcAUFZr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Jan 2016 00:25:47 -0500
In-Reply-To: <20160121051709.GA4749@sudip-pc>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>

Hi Sudip,

On Thu, 21 Jan 2016 10:47:09 +0530 Sudip Mukherjee <sudipm.mukherjee@gmail.com> wrote:
>
> On Thu, Jan 21, 2016 at 04:11:56PM +1100, Stephen Rothwell wrote:
> > Hi Andrew,
> > 
> > After merging the akpm-current tree, today's linux-next build (arm
> > efm32_defconfig) failed like this:
> > 
> > fs/proc/task_nommu.c:132:28: error: 'mm' undeclared (first use in this function)
> > 
> > Caused by commit
> > 
> >   e87d4fd02f40 ("proc: revert /proc/<pid>/maps [stack:TID] annotation")  
> 
> posted a patch for it few minutes ago.
> https://patchwork.kernel.org/patch/8077421/

Thanks, I have added that to the akpm-current tree for tomorrow in case
Andrew does not get around to it.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
