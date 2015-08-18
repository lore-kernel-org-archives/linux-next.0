From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the nfs tree
Date: Tue, 18 Aug 2015 10:56:34 +1000
Message-ID: <20150818105634.5be18a1c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51505 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751959AbbHRA4i (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Aug 2015 20:56:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>, Anna Schumaker <Anna.Schumaker@Netapp.com>

Hi Trond,

After merging the nfs tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c: In function 'kiblnd_pmr_pool_map':
drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:1828:2: error: implicit declaration of function 'ib_reg_phys_mr' [-Werror=implicit-function-declaration]
  pmr->pmr_mr = ib_reg_phys_mr(hdev->ibh_pd,
  ^
drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:1828:14: warning: assignment makes pointer from integer without a cast
  pmr->pmr_mr = ib_reg_phys_mr(hdev->ibh_pd,
              ^
drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c: In function 'kiblnd_hdev_setup_mrs':
drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:2380:6: warning: assignment makes pointer from integer without a cast
   mr = ib_reg_phys_mr(hdev->ibh_pd, &ipb, 1, acflags, &iova);
      ^

Caused by commit

  1241d7bf2ac8 ("core: Remove the ib_reg_phys_mr() and ib_rereg_phys_mr() verbs")

which noted this build failure would occur :-(

Since this commit is self comtained, I have reverted it until someone
provides a fix for the lustre code.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
