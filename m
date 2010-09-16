From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: FW: next build fails
Date: Fri, 17 Sep 2010 07:52:42 +1000
Message-ID: <20100917075242.e0bc4b54.sfr@canb.auug.org.au>
References: <33A307AF30D7BF4F811B1568FE7A9B18043784FF99@EXDCVYMBSTM006.EQ1STM.local>
	<20100916164442.df749cc1.sfr@canb.auug.org.au>
	<1284656407.2411.5.camel@c-dwalke-linux.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35250 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754843Ab0IPVwq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Sep 2010 17:52:46 -0400
In-Reply-To: <1284656407.2411.5.camel@c-dwalke-linux.qualcomm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Walker <dwalker@fifo99.com>
Cc: Sundar R IYER <sundar.iyer@stericsson.com>, Linus WALLEIJ <linus.walleij@stericsson.com>, Russell King <rmk@arm.linux.org.uk>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hi Daniel,

On Thu, 16 Sep 2010 10:00:07 -0700 Daniel Walker <dwalker@fifo99.com> wrote:
>
> __v7_ca9mp_proc_info should just duplicate __v7_proc_info (the one below
> it) ..

Do you mean this:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 17 Sep 2010 07:48:25 +1000
Subject: [PATCH] ARM: fix build failure for legacy PMD_FLAGS

[Updated with advice from Daniel Walker <dwalker@fifo99.com>: sfr]

Acked-by: Linus Walleij <linus.walleij@stericsson.com>
Signed-off-by: Sundar Iyer <sundar.iyer@stericsson.com>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/arm/mm/proc-v7.S |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mm/proc-v7.S b/arch/arm/mm/proc-v7.S
index 820f6ba..fc8828b 100644
--- a/arch/arm/mm/proc-v7.S
+++ b/arch/arm/mm/proc-v7.S
@@ -334,10 +334,16 @@ cpu_elf_name:
 __v7_ca9mp_proc_info:
 	.long	0x410fc090		@ Required ID value
 	.long	0xff0ffff0		@ Mask for ID
-	.long   PMD_TYPE_SECT | \
+	ALT_SMP(.long \
+		PMD_TYPE_SECT | \
 		PMD_SECT_AP_WRITE | \
 		PMD_SECT_AP_READ | \
-		PMD_FLAGS
+		PMD_FLAGS_SMP)
+	ALT_UP(.long \
+		PMD_TYPE_SECT | \
+		PMD_SECT_AP_WRITE | \
+		PMD_SECT_AP_READ | \
+		PMD_FLAGS_UP)
 	.long   PMD_TYPE_SECT | \
 		PMD_SECT_XN | \
 		PMD_SECT_AP_WRITE | \
-- 
1.7.1

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
