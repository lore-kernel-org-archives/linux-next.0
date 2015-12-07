From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Mon, 7 Dec 2015 19:06:24 +1100
Message-ID: <20151207190624.6590824c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60022 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753549AbbLGIG0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Dec 2015 03:06:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/x86/mm/pgtable.c

between commit:

  d6ccc3ec9525 ("x86/paravirt: Remove paravirt ops pmd_update[_defer] and pte_update_defer")

from the tip tree and commit:

  275461f0db1f ("x86, thp: remove infrastructure for handling splitting PMDs")

from the akpm-current tree.

I fixed it up (I removed the function (pmdp_splitting_flush) removed by
the latter) and can carry the fix as necessary (no action is required).



-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
