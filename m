From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the device-mapper tree
Date: Sun, 1 Nov 2015 21:43:57 +1100
Message-ID: <20151101214357.058b19de@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55240 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752391AbbKAKoE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2015 05:44:04 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Hi all,

After merging the device-mapper tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/md/dm-mpath.c: In function 'multipath_prepare_ioctl':
drivers/md/dm-mpath.c:1570:41: error: 'cmd' undeclared (first use in this function)
   int err = scsi_verify_blk_ioctl(NULL, cmd);
                                         ^

Caused by commit

  21a2807bc3ff ("dm: refactor ioctl handling")

I have used the device-mapper tree from next-20151022 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
