From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Tue, 26 Apr 2016 23:56:05 +1000
Message-ID: <20160426235605.6ce21e45@canb.auug.org.au>
References: <20160426133812.366dc031@canb.auug.org.au>
	<571F6D59.8040402@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51979 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750835AbcDZN4I (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Apr 2016 09:56:08 -0400
In-Reply-To: <571F6D59.8040402@suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Randy Dunlap <rdunlap@infradead.org>

Hi Michal,

On Tue, 26 Apr 2016 15:30:01 +0200 Michal Marek <mmarek@suse.cz> wrote:
>
> On 2016-04-26 05:38, Stephen Rothwell wrote:
> > Hi Nicolas,
> > 
> > After merging the block tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> > 
> > ERROR: ".blk_queue_write_cache" [drivers/block/virtio_blk.ko] undefined!
> > ERROR: ".blk_queue_write_cache" [drivers/block/ps3disk.ko] undefined!
> > ERROR: ".blk_queue_write_cache" [drivers/block/nbd.ko] undefined!
> > 
> > Caused by commit
> > 
> >   089095b8eef9 ("kbuild: better abstract vmlinux sequential prerequisites")
> > 
> > from the kbuild-pite tree.
> > 
> > I have reverted that commit for today.  
> 
> I can't reproduce this with today's linux-next and the revert reverted.
> Also, CONFIG_TRIM_UNUSED_KSYMS is disabled in the defconfig as expected,
> so I have no idea what went wrong.

Yeah, I couldn't figure it out either, but the revert made it work for
me.  Could it be that I do incremental builds - so today, I would have
built commit b087ce990625 ("Merge remote-tracking branch 'input/next'")
which worked, then commit 9d67df654092 ("Merge remote-tracking branch
'block/for-next'") which failed.

The only suspect code in the block tree has been there since April 13
with no build failures.

Anyway, I can see how things go tomorrow, but I hate it when things
seem fragile like this.
-- 
Cheers,
Stephen Rothwell
