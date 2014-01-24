From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: manual merge of the scsi tree with Linus' tree
Date: Thu, 23 Jan 2014 18:22:42 -0800
Message-ID: <1390530162.15909.14.camel@dabdike.int.hansenpartnership.com>
References: <20140124130547.323ce38edc8dedfd653534b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:43731 "EHLO
	bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751162AbaAXCWo (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Jan 2014 21:22:44 -0500
In-Reply-To: <20140124130547.323ce38edc8dedfd653534b7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Stephen M.Cameron" <scameron@beardog.cce.hp.com>

On Fri, 2014-01-24 at 13:05 +1100, Stephen Rothwell wrote:
> Hi James,
> 
> Today's linux-next merge of the scsi tree got conflicts in
> drivers/scsi/hpsa.c and drivers/scsi/hpsa.h between commits from Linus'
> tree and commits from the scsi tree.
> 
> This has happened because what you submitted to Linus differed
> significantly to what is in the scsi tree in linux-next.  :-(
> 
> I have just dropped the scsi tree for now.

Hm, sorry about that.  It looks like there was a failed push of the
for-next branch five weeks ago when I rebased to drop a pm80xx commit.
This also caused it to be six commits behind (five hpsa and one ipr)
because they were added after the rebase.

Not sure what else to do except "will try harder in future".

James
