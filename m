From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Wed, 27 Apr 2016 01:18:25 +1000
Message-ID: <20160427011825.06c64502@canb.auug.org.au>
References: <20160426133812.366dc031@canb.auug.org.au>
	<571F6D59.8040402@suse.cz>
	<v3THaCMkCzylcv3TJavAje@videotron.ca>
	<alpine.LFD.2.20.1604261037410.5091@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34925 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752370AbcDZPS2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Apr 2016 11:18:28 -0400
In-Reply-To: <alpine.LFD.2.20.1604261037410.5091@knanqh.ubzr>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Randy Dunlap <rdunlap@infradead.org>

Hi Nicolas,

On Tue, 26 Apr 2016 10:40:57 -0400 (EDT) Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
>
> If you can reproduce this build failure, could you try a make mrproper 
> and attempt it again?  I, too, would like to find an explanation and a 
> way to reproduce.

I reset my build tree to commit 9d67df654092 ("Merge remote-tracking
branch 'block/for-next'") and the build failed with:

ERROR: ".local_clock" [drivers/vhost/vhost_net.ko] undefined!
ERROR: ".local_clock" [drivers/misc/cxl/cxl.ko] undefined!

:-(

So I did a "make mrproper" and did the build again.

That built correctly.

Then I reset the tree to commit b087ce990625 ("Merge remote-tracking
branch 'input/next'"), did a "make mrproper", "make ppc64_defconfig",
"make" and that built correctly.  So I fast forwarded back to the block
tree merge and did "make ppc64_defconfig" and "make" and that failed
with:

ERROR: ".blk_queue_write_cache" [drivers/block/virtio_blk.ko] undefined!
ERROR: ".blk_queue_write_cache" [drivers/block/ps3disk.ko] undefined!
ERROR: ".blk_queue_write_cache" [drivers/block/nbd.ko] undefined!

Doing the revert made it build, then doing "reset --hard HEAD^" (i.e.
undoing the revert) also kept the build working.

These builds all have a separate object directory and are powerpc64le
hosted powerpc64be cross builds and use "make -j80".

-- 
Cheers,
Stephen Rothwell
