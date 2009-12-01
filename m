From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: percpu error in linux-next (CONFIG_SMP=n)
Date: Tue, 01 Dec 2009 10:30:26 -0800
Message-ID: <4B1560C2.8040603@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:30569 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752513AbZLASbg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2009 13:31:36 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

hi Tejun,

drivers/base/cpu.c: line 100: fails to build when CONFIG_SMP=n:

	addr = per_cpu_ptr_to_phys(per_cpu_ptr(crash_notes, cpunum));

Can you suggest a fix for that, please?

thanks,
-- 
~Randy
