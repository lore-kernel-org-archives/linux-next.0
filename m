From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Multiple for-next branches from same tree
Date: Thu, 7 Mar 2013 11:33:54 +0530
Message-ID: <51382DCA.5010209@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hermes.synopsys.com ([198.182.44.81]:49235 "EHLO
	hermes.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750769Ab3CGGEH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Mar 2013 01:04:07 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>

Hi Stephen,

With ARC arch merged in 3.9-rc1 I feel the need for a revised workflow.

I intend to have 2 branches for -next exposure: for-curr and for-next.
* for-curr would contain the bug fixes for this release to be sent to Linus at
some point in time.
* for-next obviously is next release stuff and will be rebased off for-curr.

The other strategy, personally less preferred, is to keep only for-next and tag it
at right cut off point when sending pull request to Linus. Do you see any
semantical differences in the two approaches.

One (hypothetical) scenario that comes to my mind is that if for-curr introduces a
conflict, which for-next fixes up somehow, that would still be caught in both the
cases.

Comments !

Thx,
-Vineet
