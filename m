From: Joe Perches <joe@perches.com>
Subject: Re: [RFC PATCH -next] Fix printk_once build errors due to
 __read_mostly
Date: Wed, 30 Oct 2013 06:46:50 -0700
Message-ID: <1383140810.12439.69.camel@joe-AO722>
References: <1383128301-20231-1-git-send-email-james.hogan@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay0098.hostedemail.com ([216.40.44.98]:54843 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751611Ab3J3Nqy (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Oct 2013 09:46:54 -0400
In-Reply-To: <1383128301-20231-1-git-send-email-james.hogan@imgtec.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Hogan <james.hogan@imgtec.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linux-metag@vger.kernel.org

On Wed, 2013-10-30 at 10:18 +0000, James Hogan wrote:
> Commit 3e39c1ab04ba (printk: mark printk_once test variable
> __read_mostly) added __read_mostly to the __print_once bool in the
> printk_once() macro, but __read_mostly is defined in <linux/cache.h>
> which isn't included from <linux/printk.h>. This results in build errors
> like this:
> 
> arch/metag/mm/l2cache.c: In function 'meta_l2c_setup':
> arch/metag/mm/l2cache.c:56: error: '__read_mostly' undeclared
> 
> This is fixed by adding an include of <linux/cache.h> from
> <linux/printk.h> since I don't think printk_once() users should need to
> include <linux/cache.h> for it to work.
> 
> Note that this actually adds a recursive include, since <linux/cache.h>
> includes <linux/kernel.h>, which includes <linux/printk.h>. The actual
> dependencies are all in macros so it doesn't actually seem to result in
> any build failures, but it's clearly less than ideal.

Thanks James.

Oh well.  Pity about the recursive #include.
It seems most every actual use of __read_mostly gets
that cache.h include indirectly.

Perhaps it's better just to remove the __read_mostly patch
as the __read_mostly value is pretty low.

Andrew, could you please remove my __read_mostly patch?

I preferred that printk.h not be a file that
could be independently used via #include.

https://lkml.org/lkml/2011/5/25/331
https://lkml.org/lkml/2011/5/25/333

and that only kernel.h should be used.

Maybe that's still a better approach.
