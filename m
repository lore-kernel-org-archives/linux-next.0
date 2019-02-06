From: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: linux-next: Fixes tag needs some work in the scsi-fixes tree
Date: Wed, 06 Feb 2019 09:25:12 +0530
Message-ID: <87tvhhmuzj.fsf@vajain21.in.ibm.com>
References: <20190206072033.3d04f96b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190206072033.3d04f96b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Martin,
>
> In commit
>
>   bb61b843ffd4 ("scsi: cxlflash: Prevent deadlock when adapter probe fails")
>
> Fixes tag
>
>   Fixes: c21e0bbfc485("cxlflash: Base support for IBM CXL Flash Adapter")
>
> has these problem(s):
>
>   - missing space between the SHA1 and the subject
Thanks for catching this Stephen. I am surprised that the checkpatch.pl
script didnt catch this.

Martin, should I resend the patch with this fixed ?

Thanks,
-- 
Vaibhav Jain <vaibhav@linux.ibm.com>
Linux Technology Center, IBM India Pvt. Ltd.
