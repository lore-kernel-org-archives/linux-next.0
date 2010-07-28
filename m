From: Tejun Heo <tj@kernel.org>
Subject: linux-next: please pull in from lost-spurious-irq branch
Date: Wed, 28 Jul 2010 15:50:55 +0200
Message-ID: <4C5035BF.9040904@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:55748 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751894Ab0G1NvC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Jul 2010 09:51:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

Hello, Stephen.

If possible, can you please pull the following branch into linux-next?

  git://git.kernel.org/pub/scm/linux/kernel/git/tj/misc.git lost-spurious-irq

It's scheduled to go through tip/genirq, so once it shows up in tip,
the above branch can be dropped from linux-next.  As the merge window
is closing in, I'm hoping to get it tested enough in linux-next.  The
branch is based on rc3 but merges without conflict into the current
mainline.

Thank you.

-- 
tejun
