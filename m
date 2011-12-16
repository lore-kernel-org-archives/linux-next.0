From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Fri, 16 Dec 2011 14:00:39 -0800
Message-ID: <20111216140039.c279e8d7.akpm@linux-foundation.org>
References: <20111216163928.030494ce1beb330e4e8b7b40@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:57166 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760426Ab1LPWAk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 16 Dec 2011 17:00:40 -0500
In-Reply-To: <20111216163928.030494ce1beb330e4e8b7b40@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>

On Fri, 16 Dec 2011 16:39:28 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> 
> After merging the akpm tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> arch/powerpc/kernel/rtas_flash.c: In function 'rtas_flash_release':
> arch/powerpc/kernel/rtas_flash.c:218:16: error: 'struct proc_dir_entry' has no member named 'count'
> arch/powerpc/kernel/rtas_flash.c: In function 'rtas_excl_open':
> arch/powerpc/kernel/rtas_flash.c:343:21: error: 'struct proc_dir_entry' has no member named 'count'
> arch/powerpc/kernel/rtas_flash.c:348:16: error: 'struct proc_dir_entry' has no member named 'count'
> arch/powerpc/kernel/rtas_flash.c: In function 'rtas_excl_release':
> arch/powerpc/kernel/rtas_flash.c:358:16: error: 'struct proc_dir_entry' has no member named 'count'
> arch/powerpc/kernel/rtas_flash.c: In function 'validate_flash_release':
> arch/powerpc/kernel/rtas_flash.c:541:16: error: 'struct proc_dir_entry' has no member named 'count'
> 
> Caused by commit aef714db6205 ("core kernel: add refcount type and
> refcount misuse debugging").
> 
> This would also break in drivers/nubus/proc.c
> 
> I have reverted that commit for today.

Thanks.  The plan apepars to be to make `struct kref' usable in this
situation so I'll drop these patches.
