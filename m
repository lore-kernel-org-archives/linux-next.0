From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the scsi-mkp tree
Date: Tue, 8 Aug 2017 13:26:19 +1000
Message-ID: <20170808132619.7981b66e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36479 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751834AbdHHD0V (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Aug 2017 23:26:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ondrej Zary <linux@rainbow-software.org>, Finn Thain <fthain@telegraphics.com.au>

Hi Martin,

Commit

  facfc963ae92 ("scsi: g_NCR5380: Two DTC436 PDMA workarounds")

is missing a Signed-off-by from its author.

-- 
Cheers,
Stephen Rothwell
