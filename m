From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the scsi tree
Date: Mon, 18 Dec 2017 08:00:37 +1100
Message-ID: <20171218080037.4367d45d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56059 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757380AbdLQVAk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 17 Dec 2017 16:00:40 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Xiaofei Tan <tanxiaofei@huawei.com>, John Garry <john.garry@huawei.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Xiang Chen <chenxiang66@hisilicon.com>

Hi James,

Commit

  9188808c7760 ("scsi: hisi_sas: fix SAS_QUEUE_FULL problem while running IO")

is missing a Signed-off-by from its author.

-- 
Cheers,
Stephen Rothwell
