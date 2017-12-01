From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Date: Thu, 30 Nov 2017 21:14:25 -0500
Message-ID: <yq1tvxb9ou6.fsf@oracle.com>
References: <20171130125121.7d16ef43@canb.auug.org.au>
        <20171130125511.6313f7d3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:45817 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751007AbdLACOn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Nov 2017 21:14:43 -0500
In-Reply-To: <20171130125511.6313f7d3@canb.auug.org.au> (Stephen Rothwell's
        message of "Thu, 30 Nov 2017 12:55:11 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ching Huang <ching2048@areca.com.tw>, Kees Cook <keescook@chromium.org>


Stephen,

> That should have been arcmsr_set_iop_datetime, sorry.  I will fix it
> tomorrow if you haven't rebased onto v4.15-rc1 by then :-)

I had such a huge pile of patches in the queue that I was compelled to
begin 4.16 early. I had meant to rebase that tree to rc1 before
switching my for-next branch over from 4.15 fixes. But I completely
forgot when I pushed, sorry!

Will fix things up tomorrow...

-- 
Martin K. Petersen	Oracle Linux Engineering
