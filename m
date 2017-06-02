From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the target-bva tree with the
 target-updates tree
Date: Fri, 2 Jun 2017 14:05:35 +1000
Message-ID: <20170602140535.17d87d58@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41605 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750710AbdFBEFi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 2 Jun 2017 00:05:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bart Van Assche <bart.vanassche@gmail.com>, "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Bart,

Today's linux-next merge of the target-bva tree got a conflict in:

  drivers/target/target_core_tpg.c

between commits:

  06fd91ce633d ("target/configfs: Kill se_lun->lun_link_magic")
  4f61e1e687c4 ("target: Avoid target_shutdown_sessions loop during queue_depth change")

from the target-updates tree and commits:

  ba438d7c8d39 ("target: Avoid target_shutdown_sessions loop during queue_depth change")
  b968ec8ff101 ("target/configfs: Kill se_lun->lun_link_magic")

from the target-bva tree.

I fixed it up (I used the version from the target-updates tree) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
