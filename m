From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: linux-next: build warning after merge of the scsi tree
Date: Wed, 18 Apr 2018 19:30:59 -0400
Message-ID: <yq1r2ncm6rw.fsf@oracle.com>
References: <20180417122540.1c0a3fee@canb.auug.org.au>
        <MWHPR2101MB072925FF18BBA2F84B2EE470CEB60@MWHPR2101MB0729.namprd21.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <MWHPR2101MB072925FF18BBA2F84B2EE470CEB60@MWHPR2101MB0729.namprd21.prod.outlook.com>
        (Long Li's message of "Wed, 18 Apr 2018 21:52:32 +0000")
Sender: linux-kernel-owner@vger.kernel.org
To: Long Li <longli@microsoft.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, James Bottomley <James.Bottomley@HansenPartnership.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>
List-Id: linux-next.vger.kernel.org


Long,

> I will fix this by moving those data structure to kmalloc pre-allocated
> when channel is first created.

Sounds good. I'll drop patch 3 for now and wait for you to resubmit.

-- 
Martin K. Petersen	Oracle Linux Engineering
