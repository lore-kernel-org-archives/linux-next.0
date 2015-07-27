From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with Linus' tree
Date: Mon, 27 Jul 2015 15:26:41 +1000
Message-ID: <20150727152641.1959de99@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Ingo Molnar <mingo@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Oleg Nesterov <oleg@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/x86/mm/mpx.c

between commit:

  a89652769470 ("x86/mpx: Do not set ->vm_ops on MPX VMAs")

from Linus' tree and patch:

  "mm, mpx: add "vm_flags_t vm_flags" arg to do_mmap_pgoff()"

from the akpm tree.

I fixed it up (I used the akpm tree version of mpx_map()) and can carry
the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
