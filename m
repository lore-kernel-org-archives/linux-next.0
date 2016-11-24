From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-ppc-paulus tree with the
 powerpc tree
Date: Thu, 24 Nov 2016 13:53:53 +1100
Message-ID: <20161124135353.570f943a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Suraj Jitindar Singh <sjitindarsingh@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Paul,

Today's linux-next merge of the kvm-ppc-paulus tree got a conflict in:

  arch/powerpc/mm/pgtable-radix.c

between commit:

  555c16328ae6 ("powerpc/mm: Correct process and partition table max size")

from the powerpc tree and commit:

  9d66195807ac ("powerpc/64: Provide functions for accessing POWER9 partition table")

from the kvm-ppc-paulus tree.

I fixed it up (the latter removed the code modified by the former) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
