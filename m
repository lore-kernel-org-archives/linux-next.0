From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the file-locks tree
Date: Wed, 21 Jun 2017 10:30:52 +1000
Message-ID: <20170621103052.2eb33b59@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54167 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752910AbdFUAaz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Jun 2017 20:30:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeff Layton <jlayton@poochiereds.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ross Zwisler <ross.zwisler@linux.intel.com>, Jan Kara <jack@suse.cz>, Matthew Wilcox <mawilcox@microsoft.com>, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>

Hi Jeff,

After merging the file-locks tree, today's linux-next build (powerpc
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

  ee6b2b8e0a8f ("mm: drop "wait" parameter from write_one_page()")

-- 
Cheers,
Stephen Rothwell
