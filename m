From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the tip tree
Date: Thu, 7 Apr 2016 15:26:03 +1000
Message-ID: <20160407152603.173426e5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35351 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751509AbcDGF0G (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Apr 2016 01:26:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi all,

After merging the tip tree, today's linux-next build (powerpc ppc44x_defconfig)
produced this warning:

mm/gup.c: In function 'get_user_pages_fast':
mm/gup.c:1510:20: warning: unused variable 'mm' [-Wunused-variable]
  struct mm_struct *mm = current->mm;
                    ^

Introduced by commit

  dc8cfd957d85 ("mm/gup: Remove the macro overload API migration helpers from the get_user*() APIs")

-- 
Cheers,
Stephen Rothwell
