From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the vfs tree
Date: Mon, 3 Jul 2017 10:53:47 +1000
Message-ID: <20170703105347.0ebf12a3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53341 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752094AbdGCAxv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 2 Jul 2017 20:53:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Al,

After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c: In function 'kiblnd_send':
drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c:1643:2: warning: ignoring return value of 'copy_from_iter', declared with attribute warn_unused_result [-Wunused-result]
  copy_from_iter(&ibmsg->ibm_u.immediate.ibim_payload, IBLND_MSG_SIZE,
  ^
drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c: In function 'kiblnd_recv':
drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c:1744:3: warning: ignoring return value of 'copy_to_iter', declared with attribute warn_unused_result [-Wunused-result]
   copy_to_iter(&rxmsg->ibm_u.immediate.ibim_payload,
   ^

Introduced by commit

  aa28de275a24 ("iov_iter/hardening: move object size checks to inlined part")

-- 
Cheers,
Stephen Rothwell
