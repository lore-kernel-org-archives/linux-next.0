From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xtensa tree with the arm64 and tip
 trees
Date: Mon, 24 Aug 2015 11:10:54 +1000
Message-ID: <20150824111054.4bad5fba@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60023 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753614AbbHXBK5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 23 Aug 2015 21:10:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Zankel <chris@zankel.net>, Catalin Marinas <catalin.marinas@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>

Hi Chris,

Today's linux-next merge of the xtensa tree got a conflict in:

  arch/xtensa/include/asm/atomic.h

between commit:

  2a3ed90f428c ("xtensa: Provide atomic_{or,xor,and}")

from the arm64 and tip trees and commit:

  38fef73c21d1 ("xtensa: implement fake NMI")

from the xtensa tree.

I fixed it up (I dropped the latter's definitions of
atomic_{set,clear}_mask) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
