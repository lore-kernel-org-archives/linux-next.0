From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: manual merge of the block tree with the  tree
Date: Fri, 17 Dec 2010 09:53:27 -0500
Message-ID: <1292597607.2820.17.camel@mulgrave.site>
References: <20101217122831.39300d94.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:40737 "EHLO
	bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754854Ab0LQOxa (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Dec 2010 09:53:30 -0500
In-Reply-To: <20101217122831.39300d94.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Tejun Heo <tj@kernel.org>

On Fri, 2010-12-17 at 12:28 +1100, Stephen Rothwell wrote:
> Hi Jens,
> 
> Today's linux-next merge of the block tree got a conflict in
> drivers/scsi/sd.c between commit e765221e4b44b2141704a0ab201632446235712b
> ("[SCSI] sd: improve logic and efficiecy of media-change detection") from
> the  tree and commit c8d2e937355d02db3055c2fc203e5f017297ee1f ("sd:
> implement sd_check_events()") from the block tree.
> 
> The changes here are a bit extensive for me to figure out, so I used
> the block tree version of the conflicting code (there are other changes
> in the scsi tree as well).  I probably needs checking.

Tejun, could you respin the sd patch on top of SCSI misc, please?  (I
promise to review it speedily if you do).

Thanks,

James
