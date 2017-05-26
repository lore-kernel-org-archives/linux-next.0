From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm-current tree
Date: Fri, 26 May 2017 12:43:24 +1000
Message-ID: <20170526124324.058c3d2a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53153 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932649AbdEZCn1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 25 May 2017 22:43:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jeff Layton <jlayton@redhat.com>, Ross Zwisler <ross.zwisler@linux.intel.com>, Jan Kara <jack@suse.cz>, Matthew Wilcox <mawilcox@microsoft.com>, Christoph Hellwig <hch@lst.de>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

fs/jfs/jfs_metapage.c: In function 'force_metapage':
fs/jfs/jfs_metapage.c:714:2: warning: ignoring return value of 'write_one_page', declared with attribute warn_unused_result [-Wunused-result]
  write_one_page(page);
  ^
fs/jfs/jfs_metapage.c: In function 'release_metapage':
fs/jfs/jfs_metapage.c:759:4: warning: ignoring return value of 'write_one_page', declared with attribute warn_unused_result [-Wunused-result]
    write_one_page(page);
    ^

Introduced by commit

  f8652aebee02 ("mm: drop "wait" parameter from write_one_page()")

These call sites were updated for the droppping of the argument, but
not for the addition of __must_check :-(

-- 
Cheers,
Stephen Rothwell
