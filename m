From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the scsi tree
Date: Thu, 21 Dec 2017 22:05:01 +1100
Message-ID: <20171221220501.29a0d8f0@canb.auug.org.au>
References: <20171218080037.4367d45d@canb.auug.org.au>
        <yq1r2rribp4.fsf@oracle.com>
        <bd1a1faa-5876-a3c2-2f07-4cba2bcad2de@hisilicon.com>
        <yq1k1xghlra.fsf@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46115 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752568AbdLULFE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Dec 2017 06:05:04 -0500
In-Reply-To: <yq1k1xghlra.fsf@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: "chenxiang (M)" <chenxiang66@hisilicon.com>, James Bottomley <James.Bottomley@HansenPartnership.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Xiaofei Tan <tanxiaofei@huawei.com>, John Garry <john.garry@huawei.com>

Hi Martin,

On Wed, 20 Dec 2017 21:12:41 -0500 "Martin K. Petersen" <martin.petersen@oracle.com> wrote:
>
> chenxiang,
> 
> > John is on vacation. I have checked it and please add a
> > "Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>" or let me know
> > if want us to re-send this patch again .  
> 
> I fixed it up. Thanks!

Unfortunately, you have rebased (rewritten) several commits that James
has already pulled into the scsi tree ... :-(

-- 
Cheers,
Stephen Rothwell
