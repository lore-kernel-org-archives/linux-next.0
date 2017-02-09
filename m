From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the f2fs tree
Date: Fri, 10 Feb 2017 10:51:35 +1100
Message-ID: <20170210105135.26bc6739@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39167 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751318AbdBIXvh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 9 Feb 2017 18:51:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Jaegeuk,

After merging the f2fs tree, today's linux-next build
(x86_64_allmodconfig) produced this warning:

fs/f2fs/node.c: In function 'fsync_node_pages':
fs/f2fs/node.c:1520:3: warning: 'last_idx' may be used uninitialized in this function [-Wmaybe-uninitialized]
   f2fs_submit_merged_bio_cond(sbi, NULL, ino, last_idx,
   ^

Introduced by commit

  9563642a6ec2 ("f2fs: check last page index in cached bio to decide submission")

-- 
Cheers,
Stephen Rothwell
