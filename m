From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: signal.git
Date: Wed, 23 May 2012 06:22:35 +0100
Message-ID: <20120523052234.GM11775@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:34496 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751559Ab2EWFWg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 May 2012 01:22:36 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

	Sorry for not having done that earlier; the tree is at
git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal #for-next.
No non-trivial conflicts with akpm-base - only arch/*/Kconfig ones
coming from mainline.  A _lot_ of duplicates with akpm - 20 commits
from Matt and Oleg are all cherry-picked from there.

	I've included the recent uml.git pull request in there -
it's not in -next (and probably ought to be) and this time it
has a lot to do with the stuff being dealt with here.

	I hope to get task_work_add() series through that tree,
once all prereqs are there; I'll send heads-up before doing that,
since those patches are currently in akpm's patchset (and unfortunately
they do need a bunch of commits not in there to get them working on
all architectures - some of those prereqs are in this branch, some
will need to be moved to it from signal.git#master)
