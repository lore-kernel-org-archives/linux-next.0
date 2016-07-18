From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the powerpc tree
Date: Mon, 18 Jul 2016 15:55:04 +1000
Message-ID: <20160718155504.19225365@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <kvm-owner@vger.kernel.org>
Sender: kvm-owner@vger.kernel.org
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, Paul Mackerras <paulus@ozlabs.org>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  arch/powerpc/kernel/idle_book3s.S

between commit:

  69c592ed40d3 ("powerpc/opal: Add real mode call wrappers")

from the powerpc tree and commit:

  fd7bacbca47a ("KVM: PPC: Book3S HV: Fix TB corruption in guest exit path on HMI interrupt")

from the kvm tree.

I fixed it up (on Michael's advise, I used the version form the kvm tree)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
