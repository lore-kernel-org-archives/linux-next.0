From: Michal Marek <mmarek@suse.cz>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Tue, 26 Apr 2016 15:30:01 +0200
Message-ID: <571F6D59.8040402@suse.cz>
References: <20160426133812.366dc031@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:41328 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752264AbcDZNaF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Apr 2016 09:30:05 -0400
In-Reply-To: <20160426133812.366dc031@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Randy Dunlap <rdunlap@infradead.org>

On 2016-04-26 05:38, Stephen Rothwell wrote:
> Hi Nicolas,
> 
> After merging the block tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> ERROR: ".blk_queue_write_cache" [drivers/block/virtio_blk.ko] undefined!
> ERROR: ".blk_queue_write_cache" [drivers/block/ps3disk.ko] undefined!
> ERROR: ".blk_queue_write_cache" [drivers/block/nbd.ko] undefined!
> 
> Caused by commit
> 
>   089095b8eef9 ("kbuild: better abstract vmlinux sequential prerequisites")
> 
> from the kbuild-pite tree.
> 
> I have reverted that commit for today.

I can't reproduce this with today's linux-next and the revert reverted.
Also, CONFIG_TRIM_UNUSED_KSYMS is disabled in the defconfig as expected,
so I have no idea what went wrong.

Michal
