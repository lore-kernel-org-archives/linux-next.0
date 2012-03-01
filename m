From: Mark Salter <msalter@redhat.com>
Subject: build failure in linux-next
Date: Thu, 01 Mar 2012 11:11:41 -0500
Message-ID: <1330618302.2453.7.camel@deneb.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:38743 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753959Ab2CAQLp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 1 Mar 2012 11:11:45 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel <linux-kernel@vger.kernel.org>, siddhesh.poyarekar@gmail.com, Andrew Morton <akpm@linux-foundation.org>

In linux-next, this breaks nommu builds:

commit b8665bd461ecdc561e7c95d039567d0a79208226
Author: Siddhesh Poyarekar <siddhesh.poyarekar@gmail.com>
Date:   Sat Feb 25 12:28:09 2012 +1100

    procfs: mark thread stack correctly in proc/<pid>/maps
    
I think this was merged into linux-next from the -mm tree.

There are unbalanced parens in fs/proc/task_nommu.c which leads to this
when building:

fs/proc/task_nommu.c: In function 'nommu_vma_show':
fs/proc/task_nommu.c:177:2: warning: no return statement in function returning non-void
fs/proc/task_nommu.c: At top level:
fs/proc/task_nommu.c:179:14: error: expected ')' before '\xa'
fs/proc/task_nommu.c:180:2: error: expected identifier or '(' before 'return'
fs/proc/task_nommu.c:181:1: error: expected identifier or '(' before '}' token
