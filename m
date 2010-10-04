From: Sachin Sant <sachinp@in.ibm.com>
Subject: [-next: Oct 4] s390x build break (kernel/power/process.o)
Date: Mon, 04 Oct 2010 14:04:13 +0530
Message-ID: <4CA99185.3020900@in.ibm.com>
References: <20101004113638.a7f8517b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp09.au.ibm.com ([202.81.31.142]:36404 "EHLO
	e23smtp09.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753105Ab0JDIeV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Oct 2010 04:34:21 -0400
In-Reply-To: <20101004113638.a7f8517b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-s390@vger.kernel.org
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Heiko Carstens <heiko.carstens@de.ibm.com>

Today's next fails to build on a s390x box with

kernel/power/process.c: In function try_to_freeze_tasks:
kernel/power/process.c:82: error: implicit declaration of function pm_check_wakeup_events

The code in question was added via following commit

commit a87bcded7c384857f4f83f38d666c9bf5c7c9727
PM: Allow wakeup events to abort freezing of tasks

CONFIG_PM_SLEEP is not enabled in the config.

Thanks
-Sachin


-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
