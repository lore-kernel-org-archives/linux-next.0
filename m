From: Tejun Heo <tj@kernel.org>
Subject: Can you please pull percpu#for-next into linux-next?
Date: Fri, 19 Jun 2009 11:40:35 +0900
Message-ID: <4A3AFAA3.4080607@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:53988 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752264AbZFSCks (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Jun 2009 22:40:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>

Hello,

What do I need to do to get a tree pulled into linux-next rounds?  The
tree in question is

  git://git.kernel.org/pub/scm/linux/kernel/git/tj/percpu.git for-next
  http://git.kernel.org/?p=linux/kernel/git/tj/percpu.git;a=shortlog;h=for-next

and contains percpu related changes scheduled for the next (2.6.32)
merge window.  The tree touches a lot of archs and percpu users so
it'll probably cause some headache during the devel cycle.

Also, is there some guide I can read about linux-next?

Thanks.

-- 
tejun
