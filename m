From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the pm tree
Date: Tue, 15 Mar 2016 12:55:36 +1100
Message-ID: <20160315125536.6e0698a6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Colin Ian King <colin.king@canonical.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  tools/power/x86/turbostat/turbostat.c

between commit:

  58cc30a4e608 ("tools/power turbostat: fix compiler warnings")

from the pm tree and commit:

  1b69317d2dc8 ("tools/power turbostat: fix various build warnings")

from the tip tree.

I fixed it up (I arbitrarily used the pm tree version) and can carry
the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell
