From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the nfs tree
Date: Tue, 14 Jun 2016 10:48:45 +1000
Message-ID: <20160614104845.742361d7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55618 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1422642AbcFNAsr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Jun 2016 20:48:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Trond,

After merging the nfs tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

fs/nfs/direct.c: In function 'nfs_direct_write_reschedule':
fs/nfs/direct.c:652:32: error: 'struct pnfs_ds_commit_info' has no member named 'nbuckets'
  for (i = 0; i < dreq->ds_cinfo.nbuckets; i++)
                                ^
fs/nfs/direct.c:653:17: error: 'struct pnfs_ds_commit_info' has no member named 'buckets'
   dreq->ds_cinfo.buckets[i].direct_verf.committed = NFS_INVALID_STABLE_HOW;
                 ^

Caused by commit

  2f9273fd2f09 ("NFS: Ensure we reset the write verifier 'committed' value on resend.")

CONFIG_NFS_V4_1 is not set for this build.

I have used the nfs tree from next-20160609 for today.

-- 
Cheers,
Stephen Rothwell
