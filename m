From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the f2fs tree
Date: Mon, 13 Nov 2017 07:39:58 +1100
Message-ID: <20171113073958.6e63ed70@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49699 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750910AbdKLUkB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 12 Nov 2017 15:40:01 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yunlei He <heyunlei@huawei.com>, Chao Yu <yuchao0@huawei.com>

Hi Jaegeuk,

Commit

  c79d88f915ed ("f2fs: separate nat entry mem alloc from nat_tree_lock")

is missing a Signed-off-by from its author.

-- 
Cheers,
Stephen Rothwell
