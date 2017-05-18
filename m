From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: git merges of tags
Date: Fri, 19 May 2017 09:23:36 +1000
Message-ID: <20170519092202.6b0f9a57@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54665 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752741AbdERXXj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 18 May 2017 19:23:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Git Mailing list <git@vger.kernel.org>

Hi all,

Just a reminder that if you are merging Linus' tree (or any tree
really) via a tag, git was changed some time ago so that merging a tag
will not do a fast forward (there is a good reason for this - I just
can't recall it ATM).  This is a problem when your current head of
branch has been merged into (e.g.) Linus' tree and then you do "git
merge <tag>" on a tag that is later than the merge point.  You end up
with an unnecessary merge commit rather than just fast forwarding.

To do the fast forward, try "git merge <tag>^{}" ... (unfortunately
doing "git merge --ff <tag>" also does not do a fast forward - it also
doesn't fail, it unexpectedly just creates a merge commit :-().
-- 
Cheers,
Stephen Rothwell
