From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the scsi-mkp tree
Date: Wed, 27 Sep 2017 13:27:08 +1000
Message-ID: <20170927132708.7bf8c37c@canb.auug.org.au>
References: <20170926140947.0ee82f2d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40123 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S966992AbdI0D1M (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Sep 2017 23:27:12 -0400
In-Reply-To: <20170926140947.0ee82f2d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jason Yan <yanaijie@huawei.com>

Hi James,

On Tue, 26 Sep 2017 14:09:47 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the scsi-mkp tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/scsi/hisi_sas/hisi_sas_main.c: In function 'hisi_sas_controller_reset':
> drivers/scsi/hisi_sas/hisi_sas_main.c:1049:24: warning: unused variable 'sas_ha' [-Wunused-variable]
>   struct sas_ha_struct *sas_ha = &hisi_hba->sha;
>                         ^
> 
> Introduced by commit
> 
>   042ebd293b86 ("scsi: libsas: kill useless ha_event and do some cleanup")

This warning now exists in the scsi tree.
-- 
Cheers,
Stephen Rothwell
