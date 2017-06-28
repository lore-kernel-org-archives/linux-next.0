From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the libata tree
Date: Wed, 28 Jun 2017 15:51:17 +1000
Message-ID: <20170628155117.5bfbf545@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58517 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750934AbdF1FvT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Jun 2017 01:51:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Minwoo Im <dn3108@gmail.com>, Bart Van Assche <bart.vanassche@wdc.com>

Hi Tejun,

After merging the libata tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/ata/libata-scsi.c: In function 'ata_scsi_var_len_cdb_xlat':
drivers/ata/libata-scsi.c:4194:1: warning: label 'unspprt_sa' defined but not used [-Wunused-label]
 unspprt_sa:
 ^

Introduced by commit

  b1ffbf854e08 ("libata: Support for an ATA PASS-THROUGH(32) command.")

-- 
Cheers,
Stephen Rothwell
