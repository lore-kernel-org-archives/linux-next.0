From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Fri, 19 Feb 2016 15:09:26 +1100
Message-ID: <20160219150926.76304938@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43981 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1424034AbcBSEJ3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Feb 2016 23:09:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Luck <tony.luck@intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/x86/mm/extable.c

between commit:

  548acf19234d ("x86/mm: Expand the exception table logic to allow new handling options")

from the tip tree and commit:

  f1cd2c09ff09 ("x86/extable: use generic search and sort routines")

from the akpm-current tree.

I couldn't figure out how to fix this up, so I just dropped the
akpm-current tree patch.

-- 
Cheers,
Stephen Rothwell
