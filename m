From: David Rientjes <rientjes@google.com>
Subject: Re: [Patch] numa: introduce CONFIG_NUMA_SYSFS for
 drivers/base/node.c
Date: Wed, 24 Aug 2011 22:04:25 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1108242202050.576@chino.kir.corp.google.com>
References: <20110804145834.3b1d92a9eeb8357deb84bf83@canb.auug.org.au> <20110804152211.ea10e3e7.rdunlap@xenotime.net> <20110823143912.0691d442.akpm@linux-foundation.org> <4E547155.8090709@redhat.com> <20110824191430.8a908e70.rdunlap@xenotime.net>
 <4E55C221.8080100@redhat.com> <20110824205044.7ff45b6c.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp-out.google.com ([216.239.44.51]:40289 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751674Ab1HYFEa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 25 Aug 2011 01:04:30 -0400
Received: from wpaz1.hot.corp.google.com (wpaz1.hot.corp.google.com [172.24.198.65])
	by smtp-out.google.com with ESMTP id p7P54TC9000525
	for <linux-next@vger.kernel.org>; Wed, 24 Aug 2011 22:04:29 -0700
Received: from pzk32 (pzk32.prod.google.com [10.243.19.160])
	by wpaz1.hot.corp.google.com with ESMTP id p7P54AiE007266
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Wed, 24 Aug 2011 22:04:28 -0700
Received: by pzk32 with SMTP id 32so2079477pzk.33
        for <linux-next@vger.kernel.org>; Wed, 24 Aug 2011 22:04:28 -0700 (PDT)
In-Reply-To: <20110824205044.7ff45b6c.rdunlap@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Cong Wang <amwang@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org

On Wed, 24 Aug 2011, Randy Dunlap wrote:

> > Below is the updated version.
> > 
> > Thanks for testing!
> 
> Yes, that works after changing #ifdef defined(...)
> to #if defined(...)
> 
> Acked-by: Randy Dunlap <rdunlap@xenotime.net>
> 

No, it doesn't work, CONFIG_HUGETLBFS can be enabled with CONFIG_NUMA=y 
and CONFIG_SYSFS=n and that uses data structures from drivers/base/node.c 
which doesn't get compiled with this patch.
