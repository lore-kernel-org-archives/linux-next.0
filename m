From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the pm tree
Date: Thu, 9 Jun 2016 14:34:37 +1000
Message-ID: <20160609143437.760a6b0f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jacob Pan <jacob.jun.pan@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/powercap/intel_rapl.c

between commit:

  9b1d0794b70d ("powercap / RAPL: add support for Skylake-X")

from the pm tree and commit:

  62d167330679 ("x86, powercap, rapl: Use Intel model macros intead of open-coding")
  0bb04b5f2c24 ("x86, powercap, rapl: Reorder CPU detection table")
  d40671e30cb4 ("x86, powercap, rapl: Add Skylake Server model number")

from the tip tree.

I fixed it up (I think that last tip tree commit does the same as the
pm tree one, so I used that) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell
