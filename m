From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the access_once tree with the arm64
 tree
Date: Wed, 5 Aug 2015 14:41:39 +1000
Message-ID: <20150805144139.575dbda7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Borntraeger <borntraeger@de.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrey Konovalov <andreyknvl@google.com>, Ingo Molnar <mingo@kernel.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Will Deacon <will.deacon@arm.com>
List-Id: linux-next.vger.kernel.org

Hi Christian,

Today's linux-next merge of the access_once tree got a conflict in:

  arch/arm64/include/asm/barrier.h

between commit:

  4b3dc9679cf7 ("arm64: force CONFIG_SMP=y and remove redundant #ifdefs")

from the arm64 tree and commit:

  76695af20c01 ("locking, arch: use WRITE_ONCE()/READ_ONCE() in smp_store_release()/smp_load_acquire()")

from the access_once tree.

I fixed it up (the former removed the code modified by the latter, so I
just did that) and can carry the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
