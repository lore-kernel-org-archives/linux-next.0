From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the scsi-mkp tree
Date: Wed, 20 Jun 2018 12:37:53 -0400
Message-ID: <yq1h8lxe7mm.fsf@oracle.com>
References: <20180619211533.1dddf9b0@canb.auug.org.au>
        <yq1y3fadxiz.fsf@oracle.com>
        <20180620145436.4deb9079@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180620145436.4deb9079@canb.auug.org.au> (Stephen Rothwell's
        message of "Wed, 20 Jun 2018 14:54:36 +1000")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jitendra Bhivare <jitendra.bhivare@broadcom.com>, Ketan Mukadam <ketan.mukadam@broadcom.com>
List-Id: linux-next.vger.kernel.org


Stephen,

>> Fixed, thanks!
>
> Unfortunately, James had already merged your tree :-(

James' script will drop the offending original commit when I amend
something in the SCSI tree. So the discrepancy will go away next time he
updates.

-- 
Martin K. Petersen	Oracle Linux Engineering
