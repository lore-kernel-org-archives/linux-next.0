From: Tejun Heo <tj@kernel.org>
Subject: merge conflict resolution for pm-freezer
Date: Mon, 28 Nov 2011 15:30:55 -0800
Message-ID: <20111128233055.GF3858@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:32941 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754374Ab1K1XbB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 28 Nov 2011 18:31:01 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>, sfr@canb.auug.org.au
Cc: linux-pm@vger.kernel.org, linux-next@vger.kernel.org

Hello, Rafael, Stephen.

Linus just pulled cgroup fixes which conflicts with pm-freezer.  The
resolution is mostly trivial.  The cgroup fix changes frozen() test to
is_task_frozen_enough() while pm-freezer commit prepends "freezing()
&& " to it.  They just need to be combined into "freezing() &&
is_task_frozen_enough()".

The following git branch contains merged branch.  I pulled the current
linus/master a34815b96 "Merge branch 'for-3.2-fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup" into
pm-freezer and resolved the conflict described above.

  git://git.kernel.org/pub/scm/linux/kernel/git/tj/misc.git pm-freezer-merge

Rafael, please feel free to pull or resolve in any way you see fit.

Thanks.

-- 
tejun
