From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the scsi tree
Date: Thu, 25 Jan 2018 15:18:19 -0800
Message-ID: <1516922299.3044.55.camel@HansenPartnership.com>
References: <20180126093914.4afaed4c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:46670 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751431AbeAYXSW (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 25 Jan 2018 18:18:22 -0500
In-Reply-To: <20180126093914.4afaed4c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Darren Trapp <darren.trapp@cavium.com>, Himanshu Madhani <himanshu.madhani@cavium.com>

On Fri, 2018-01-26 at 09:39 +1100, Stephen Rothwell wrote:
> Hi Martin,
> 
> Today's linux-next merge of the scsi-mkp tree got a conflict in:
> 
>   drivers/scsi/qla2xxx/qla_init.c
> 
> between commit:
> 
>   07a21872cf2b ("scsi: qla2xxx: Fix queue ID for async abort with
> Multiqueue")
> 
> from the scsi tree and commit:
> 
>   b027a5ace443 ("scsi: qla2xxx: Fix queue ID for async abort with
> Multiqueue")
> 
> from the scsi-mkp tree.
> 
> Looks like you have updated your tree after James has merged it :-(

OK, I pulled my tree into sync now.  I also added the postmerge tree,
which I can rebase if it causes you similar problems (it's based on the
block tree).

James
