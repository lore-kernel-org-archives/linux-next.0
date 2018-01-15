From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the nfs tree
Date: Tue, 16 Jan 2018 08:44:39 +1100
Message-ID: <20180116084439.7870ff7e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38259 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750732AbeAOVom (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 15 Jan 2018 16:44:42 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, NeilBrown <neilb@suse.com>

Hi Trond,

After merging the nfs tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

fs/nfs/export.c: In function 'nfs_encode_fh':
fs/nfs/export.c:58:1: warning: label 'out' defined but not used [-Wunused-label]
 out:
 ^~~

Introduced by commit

  aaa150089465 ("nfs: remove dead code from nfs_encode_fh()")

-- 
Cheers,
Stephen Rothwell
