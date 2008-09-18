From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bdev tree
Date: Thu, 18 Sep 2008 16:23:26 +1000
Message-ID: <20080918162326.c4ea4493.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36308 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751823AbYIRGXh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Sep 2008 02:23:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, Mikulas Patocka <mpatocka@redhat.com>, Alasdair G Kergon <agk@redhat.com>

Hi Al,

Today's linux-next merge of the bdev tree got a conflict in
drivers/md/dm-table.c between commit
12aba00642892cc565093c57be41693c7810e540 ("dm-export-struct-dm_dev") from
the device-mapper tree and "[PATCH] pass fmode_t to blkdev_put()" from
the bdev tree.

You will need to rebase the tree, I am afraid ... I removed it all for
today.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
