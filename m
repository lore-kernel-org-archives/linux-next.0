From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the libata tree
Date: Thu, 21 Jul 2016 15:26:03 +1000
Message-ID: <20160721152603.4cf94e55@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39797 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750849AbcGUF0G (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Jul 2016 01:26:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tom Yan <tom.ty89@gmail.com>

Hi Tejun,

After merging the libata tree, today's linux-next build (arm
multi_v7_defconfig) produced these warning:

drivers/ata/libata-scsi.c: In function 'ata_mselect_caching':
drivers/ata/libata-scsi.c:3637:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
    if (mpage[i + 2] & 0xfb != buf[i] & 0xfb) {
                            ^
drivers/ata/libata-scsi.c: In function 'ata_mselect_control':
drivers/ata/libata-scsi.c:3702:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
    if (mpage[i + 2] & 0xfb != buf[i] & 0xfb) {
                            ^

Introduced by commit

  9b7844a8c34a ("libata-scsi: fix read-only bits checking in ata_mselect_*()")

-- 
Cheers,
Stephen Rothwell
