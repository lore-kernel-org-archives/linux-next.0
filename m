From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the scsi tree
Date: Wed, 9 Aug 2017 09:27:29 +1000
Message-ID: <20170809092730.1138bf7e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60931 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752094AbdHHX1c (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Aug 2017 19:27:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>

Hi James,

The commit series

  94b76dcac422 ("scsi: qla2xxx: Fix system crash while triggering FW dump")
to
  b96b8da34c40 ("scsi: aacraid: Fix out of bounds in aac_get_name_resp")

is missing Signed-off-bys from its committer.  It looks like you have
rebased a series from Martin ...

-- 
Cheers,
Stephen Rothwell
