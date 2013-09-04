From: Sujit Reddy Thumma <sthumma@codeaurora.org>
Subject: Re: linux-next: build warning after merge of the scsi tree
Date: Wed, 04 Sep 2013 14:48:04 +0530
Message-ID: <5226FACC.9030107@codeaurora.org>
References: <20130902182817.87a961aa251604b630620028@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.11.231]:48901 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762196Ab3IDJSK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Sep 2013 05:18:10 -0400
In-Reply-To: <20130902182817.87a961aa251604b630620028@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Santosh Y <santoshsy@gmail.com>, Tejun Heo <tj@kernel.org>

On 9/2/2013 1:58 PM, Stephen Rothwell wrote:
> Hi James,
>
> After merging the scsi tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> drivers/scsi/ufs/ufshcd.c: In function 'ufshcd_eh_host_reset_handler':
> drivers/scsi/ufs/ufshcd.c:2740:3: warning: 'flush_work_sync' is deprecated (declared at /scratch/sfr/next/include/linux/workqueue.h:624) [-Wdeprecated-declarations]
>     flush_work_sync(&hba->eh_work);
>     ^

James, would you like to pick up follow-up patch @
http://marc.info/?l=linux-scsi&m=137819519527432&w=2
or let me update the commit c1e846ab4422 fixing this?

>
> Introduced by commit c1e846ab4422 ("[SCSI] ufs: Fix device and host reset
> methods").  flush_work_sync was deprecated by commit 43829731dd37
> ("workqueue: deprecate flush[_delayed]_work_sync()") before v3.7-rc1.
>

-- 
Regards,
Sujit
