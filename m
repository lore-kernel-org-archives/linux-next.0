From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the scsi-mkp tree
Date: Thu, 24 Aug 2017 15:59:16 +1000
Message-ID: <20170824155916.5b058cb7@canb.auug.org.au>
References: <20170824155756.2ff7ba58@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44093 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751038AbdHXF7S (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Aug 2017 01:59:18 -0400
In-Reply-To: <20170824155756.2ff7ba58@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dick Kennedy <dick.kennedy@broadcom.com>, James Smart <james.smart@broadcom.com>

Hi all,

[Just adding Dick and James to the cc list]

On Thu, 24 Aug 2017 15:57:56 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the scsi-mkp tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> drivers/scsi/lpfc/lpfc_nvmet.c:1457:1: warning: 'lpfc_nvmet_replenish_context' defined but not used [-Wunused-function]
>  lpfc_nvmet_replenish_context(struct lpfc_hba *phba,
>  ^
> 
> Introduced by commit
> 
>   9a38e4f1c82f ("scsi: lpfc: Fix MRQ > 1 context list handling")

-- 
Cheers,
Stephen Rothwell
