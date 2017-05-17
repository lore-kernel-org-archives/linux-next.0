From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the btrfs-kdave tree
Date: Thu, 18 May 2017 09:41:46 +1000
Message-ID: <20170518094146.7a1d9a2d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44809 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752037AbdEQXlt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 May 2017 19:41:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Liu Bo <bo.li.liu@oracle.com>

Hi David,

After merging the btrfs-kdave tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

fs/btrfs/inode.c: In function 'btrfs_submit_direct':
fs/btrfs/inode.c:8467:14: warning: 'bio' may be used uninitialized in this function [-Wmaybe-uninitialized]
  struct bio *bio;
              ^

I can't tell if it is a false positive or not.

-- 
Cheers,
Stephen Rothwell
