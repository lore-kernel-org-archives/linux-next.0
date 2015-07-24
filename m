From: Vladimir Davydov <vdavydov@parallels.com>
Subject: Re: randconfig build error with next-20150724, in mm/page_ext.c
Date: Fri, 24 Jul 2015 19:36:12 +0300
Message-ID: <20150724163612.GK8100@esperanza>
References: <CA+r1ZhhXUi3huTQ8GJmX5EeqWV58Fsni9eKjA-wd2irckJUagA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay.parallels.com ([195.214.232.42]:42655 "EHLO
	relay.parallels.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752214AbbGXQg3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Jul 2015 12:36:29 -0400
Content-Disposition: inline
In-Reply-To: <CA+r1ZhhXUi3huTQ8GJmX5EeqWV58Fsni9eKjA-wd2irckJUagA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org

On Fri, Jul 24, 2015 at 09:27:53AM -0700, Jim Davis wrote:

> warning: (HWPOISON_INJECT && MEM_SOFT_DIRTY && IDLE_PAGE_TRACKING)
> selects PROC_PAGE_MONITOR which has unmet direct dependencies (PROC_FS
> && MMU)
> 
> mm/built-in.o: In function `page_ext_init_flatmem':
> (.init.text+0x30ef): undefined reference to `page_idle_ops'
> mm/built-in.o: In function `page_ext_init_flatmem':
> (.init.text+0x3172): undefined reference to `page_idle_ops'

This has already been reported by the kbuild test robot, see:

  [mmotm:master 260/385] warning: (HWPOISON_INJECT && ..) selects PROC_PAGE_MONITOR which has unmet direct dependencies (PROC_FS && ..)

It should be fixed by:

From: Vladimir Davydov <vdavydov@parallels.com>
Subject: [PATCH] mm/Kconfig: fix IDLE_PAGE_TRACKING dependencies

Fixes: proc-add-kpageidle-file
Signed-off-by: Vladimir Davydov <vdavydov@parallels.com>

diff --git a/mm/Kconfig b/mm/Kconfig
index db817e2c2ec8..a1de09926171 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -657,6 +657,7 @@ config DEFERRED_STRUCT_PAGE_INIT
 
 config IDLE_PAGE_TRACKING
 	bool "Enable idle page tracking"
+	depends on PROC_FS && MMU
 	select PROC_PAGE_MONITOR
 	select PAGE_EXTENSION if !64BIT
 	help
