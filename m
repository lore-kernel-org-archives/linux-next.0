From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the scsi tree
Date: Tue, 08 Aug 2017 16:41:36 -0700
Message-ID: <1502235696.2736.120.camel@HansenPartnership.com>
References: <20170809092730.1138bf7e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:56572 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751970AbdHHXlo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Aug 2017 19:41:44 -0400
In-Reply-To: <20170809092730.1138bf7e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>

On Wed, 2017-08-09 at 09:27 +1000, Stephen Rothwell wrote:
> Hi James,
> 
> The commit series
> 
>   94b76dcac422 ("scsi: qla2xxx: Fix system crash while triggering FW
> dump")
> to
>   b96b8da34c40 ("scsi: aacraid: Fix out of bounds in
> aac_get_name_resp")
> 
> is missing Signed-off-bys from its committer.  It looks like you have
> rebased a series from Martin ...

Yes we had to drop a commit which proved problematic in the fixes tree.
 The rule, I believe, is that only the person who transforms the email
to a git tree should be the last signoff in the commit log, even if
they're a tree pulling into another one and thereafter the signoffs go
in the merge commit, so the signoff sent by me in the signed tag when I
send the main tree to Linus is my signoff for transmitting all the
commits, which includes the rebased ones in this instance.

James
