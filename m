From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the mailbox tree
Date: Thu, 31 Aug 2017 03:15:04 +1000
Message-ID: <20170831031504.4fb9835f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Anup Patel <anup.patel@broadcom.com>
List-Id: linux-next.vger.kernel.org

Hi Jassi,

Commits

da91001cab90 ("mailbox: bcm-flexrm-mailbox: Set IRQ affinity hint for FlexRM ring IRQs")
6bee3ba26d4d ("mailbox: bcm-flexrm-mailbox: Add debugfs support")
73c28265c82b ("mailbox: bcm-flexrm-mailbox: Fix mask used in CMPL_START_ADDR_VALUE()")
33001f4ee950 ("mailbox: bcm-flexrm-mailbox: Use bitmap instead of IDA")
30e871dc417e ("mailbox: bcm-flexrm-mailbox: Use txdone_ack instead of txdone_poll")

are missing a Signed-off-by from their committer.

-- 
Cheers,
Stephen Rothwell
