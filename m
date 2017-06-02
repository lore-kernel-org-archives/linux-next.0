From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: upcoming conflict between the target-updates and
 target-bva trees
Date: Fri, 2 Jun 2017 13:39:28 +1000
Message-ID: <20170602133928.2afa3e7a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51371 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751120AbdFBDjb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 1 Jun 2017 23:39:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, Bart Van Assche <bart.vanassche@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Last night the tagret-bva tree was rebased on top of the target-updates
tree.  Just now, part of the target-updates tree has been rewritten.
So now I expect to get conflict(s) when I merge these trees since the
commits in the target-updates tree are no longer the same as those that
the target-bva tree was rebased on top of.

Please take a little time to sort out your development process.

-- 
Cheers,
Stephen Rothwell
