From: John Garry <john.garry@huawei.com>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Date: Mon, 11 Feb 2019 09:24:59 +0000
Message-ID: <e2f8faf4-143f-2d1d-efe8-bd30b593a2fd@huawei.com>
References: <20190211153127.09756262@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211153127.09756262@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, James Bottomley <James.Bottomley@HansenPartnership.com>, Xiang Chen <chenxiang66@hisilicon.com>
List-Id: linux-next.vger.kernel.org

On 11/02/2019 04:31, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the scsi-mkp tree got a conflict in:
>
>   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
>
> between commit:
>
>   7bb25a89aad2 ("scsi: hisi_sas: Set protection parameters prior to adding SCSI host")
>
> from Linus' tree and commit:
>
>   b3cce125cb1e ("scsi: hisi_sas: Add support for DIX feature for v3 hw")
>
> from the scsi-mkp tree.
>
> I fixed it up (I think - see below) and can carry the fix as necessary.
> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>

The merge looks ok, thanks

JFYI, I did mention in the relevant patchset cover letter that the 
series depends on commit 7bb25a89aad2 ("scsi: hisi_sas: Set protection 
parameters prior to adding SCSI host"), which was not on Martin's 5.1 
queue. The series seems to apply cleanly to that same branch without 
this patch.

John
