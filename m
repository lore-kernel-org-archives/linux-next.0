From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the scsi tree
Date: Thu, 21 Dec 2017 07:11:40 -0800
Message-ID: <1513869100.3132.1.camel@HansenPartnership.com>
References: <20171218080037.4367d45d@canb.auug.org.au>
         <yq1r2rribp4.fsf@oracle.com>
         <bd1a1faa-5876-a3c2-2f07-4cba2bcad2de@hisilicon.com>
         <yq1k1xghlra.fsf@oracle.com> <20171221220501.29a0d8f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:59388 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753129AbdLUPLn (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Dec 2017 10:11:43 -0500
In-Reply-To: <20171221220501.29a0d8f0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: "chenxiang (M)" <chenxiang66@hisilicon.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Xiaofei Tan <tanxiaofei@huawei.com>, John Garry <john.garry@huawei.com>

On Thu, 2017-12-21 at 22:05 +1100, Stephen Rothwell wrote:
> Hi Martin,
> 
> On Wed, 20 Dec 2017 21:12:41 -0500 "Martin K. Petersen" <martin.peter
> sen@oracle.com> wrote:
> > 
> > 
> > chenxiang,
> > 
> > > 
> > > John is on vacation. I have checked it and please add a
> > > "Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>" or let me
> > > know if want us to re-send this patch again .  
> > 
> > I fixed it up. Thanks!
> 
> Unfortunately, you have rebased (rewritten) several commits that
> James has already pulled into the scsi tree ... :-(

That's OK ... the problem isn't fixable without a rebase, as you know
and since this is the merge window tree, we're well away from the point
of merging it.

James
