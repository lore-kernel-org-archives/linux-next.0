From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mips tree with Linus' tree
Date: Tue, 3 Jan 2017 11:26:45 +1100
Message-ID: <20170103112645.453786f5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>
List-Id: linux-next.vger.kernel.org

Hi Ralf,

Today's linux-next merge of the mips tree got a conflict in:

  arch/mips/kernel/mips_ksyms.c

between commit:

  7c0f6ba682b9 ("Replace <asm/uaccess.h> with <linux/uaccess.h> globally")

from Linus' tree and commit:

  238f9fbc3244 ("MIPS: Export {copy, clear}_page functions alongside their definitions")

from the mips tree.

I fixed it up (I just deleted the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
