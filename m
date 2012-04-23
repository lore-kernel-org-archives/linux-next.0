From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Update to SCSI trees for Linux Next
Date: Mon, 23 Apr 2012 11:43:41 +0100
Message-ID: <1335177821.4191.17.camel@dabdike.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:51846 "EHLO
	bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755126Ab2DWKnr (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Apr 2012 06:43:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-scsi <linux-scsi@vger.kernel.org>

Hi Stephen

Just to let you know that SCSI is moving on to a single tree model from
now on.  The new tree is

git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git

And the branch for next is for-next.

Could you drop both the scsi-misc-2.6 and scsi-rc-fixes-2.6 tree, please
because I'll send everything through this for-next branch.

For the time being, could you keep the scsi-post-merge-2.6 tree?  It's
easier when resolving conflicts amongst other trees to use a separate
git tree (although we haven't actually had to use this one for a while).

Thanks,

James
