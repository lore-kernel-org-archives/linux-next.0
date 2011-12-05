From: Tejun Heo <tj@kernel.org>
Subject: [PATCH pm/linux-next] cgroup_freezer: drop unnecessary freezing()
 from try_to_freeze_cgroup()
Date: Mon, 5 Dec 2011 13:32:04 -0800
Message-ID: <20111205213204.GL627@google.com>
References: <20111128233055.GF3858@google.com>
 <201111302051.54501.rjw@sisk.pl>
 <20111201185322.GC13173@google.com>
 <201112012242.58090.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:33034 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751455Ab1LEVcP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Dec 2011 16:32:15 -0500
Content-Disposition: inline
In-Reply-To: <201112012242.58090.rjw@sisk.pl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: sfr@canb.auug.org.au, linux-pm@vger.kernel.org, linux-next@vger.kernel.org

986b11c3ee "Merge branch 'pm-freezer' of ..." added unnecessary
freezing() test in try_to_freeze_cgroup() while merging.  Drop it.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
This shouldn't be harmful but still is unnecessary.

Thanks.

 kernel/cgroup_freezer.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- work/kernel/cgroup_freezer.c	2011-12-05 13:25:34.156948390 -0800
+++ misc/kernel/cgroup_freezer.c	2011-12-05 13:26:58.787447558 -0800
@@ -283,7 +283,7 @@
 	while ((task = cgroup_iter_next(cgroup, &it))) {
 		if (!freeze_task(task))
 			continue;
-		if (freezing(task) && is_task_frozen_enough(task))
+		if (is_task_frozen_enough(task))
 			continue;
 		if (!freezing(task) && !freezer_should_skip(task))
 			num_cant_freeze_now++;
