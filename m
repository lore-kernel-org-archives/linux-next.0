From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: linux-next: please add queue for removal of __cpuinit and friends.
Date: Tue, 25 Jun 2013 11:27:02 -0400
Message-ID: <20130625152702.GA27288@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:55261 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751264Ab3FYP0T (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Jun 2013 11:26:19 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hi Stephen,

Would you please add the patch queue below to linux-next for
the remainder of this week and the two weeks of the merge window?

It is the patch queue for removal of __cpuinit ; a git repository
of patches with a series file that can be browsed here:

  http://git.kernel.org/cgit/linux/kernel/git/paulg/cpuinit-delete.git

or cloned directly from here:

  git://git.kernel.org/pub/scm/linux/kernel/git/paulg/cpuinit-delete.git

and the deletion and merge strategy was described here previously:

  https://lkml.org/lkml/2013/6/20/513

I have been tracking it manually myself by re-applying it locally
to the daily linux-next tree each day for a while now (you can see
patch refresh history in the repo for anyone wishing that level of
detail).

I do not expect any significant changes to the repository going forward.
Perhaps adding a couple more "Acked-by:" tags, and dropping a couple
patches for when maintainers request to carry them locally.  So I hope
it should not be a big burden.  And it is a one-shot tree as well.

Thanks,
Paul.
--
