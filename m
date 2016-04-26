From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the block tree
Date: Tue, 26 Apr 2016 13:38:12 +1000
Message-ID: <20160426133812.366dc031@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36667 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751060AbcDZDiO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Apr 2016 23:38:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Michal Marek <mmarek@suse.cz>, Randy Dunlap <rdunlap@infradead.org>

Hi Nicolas,

After merging the block tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

ERROR: ".blk_queue_write_cache" [drivers/block/virtio_blk.ko] undefined!
ERROR: ".blk_queue_write_cache" [drivers/block/ps3disk.ko] undefined!
ERROR: ".blk_queue_write_cache" [drivers/block/nbd.ko] undefined!

Caused by commit

  089095b8eef9 ("kbuild: better abstract vmlinux sequential prerequisites")

from the kbuild-pite tree.

I have reverted that commit for today.

-- 
Cheers,
Stephen Rothwell
