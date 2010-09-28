From: Dan Magenheimer <dan.magenheimer@oracle.com>
Subject: cleancache into linux-next, target for 2.6.37 merge window?
Date: Tue, 28 Sep 2010 12:31:18 -0700 (PDT)
Message-ID: <40229210-a2a6-41ab-9a88-bde956ebc66c@default>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:48849 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753935Ab0I1Tbn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 28 Sep 2010 15:31:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi --

The "cleancache" patchset crosses multiple subsystem boundaries and
at the recent filesystem/storage/mm summit, people suggested that
after the patchset has stabilized, I should just submit it to
linux-next and then directly to Linus.  The latest version has received
no further suggestions or comments.  Previous versions received
a great deal of review and comment from a wide variety of maintainers
across all the impacted subsystems, as documented in the commit logs.

Would it be possible to include the following tree in the linux-next
build process?

git://git.kernel.org/pub/scm/linux/kernel/git/djm/tmem.git#linux-next

The patchset applies cleanly against both 2.6.36-rc3 and -rc5.
Against next-20100928, I see two very minor merge conflicts in
mm/Kconfig and include/linux/fs.h due to minor changes from other
trees.

Thanks,
Dan Magenheimer
dan.magenheimer@oracle.com
