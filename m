From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xen-tip tree with Linus' tree
Date: Wed, 7 Oct 2015 13:12:34 +1100
Message-ID: <20151007131234.3bc851eb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Vrabel <david.vrabel@citrix.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the xen-tip tree got a conflict in:

  arch/x86/xen/p2m.c

between commit:

  98dd166ea3a3 ("x86/xen/p2m: hint at the last populated P2M entry")

from Linus' tree and commit:

  c5fdd42b47ab ("x86/xen: export xen_alloc_p2m_entry()")

from the xen-tip tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/xen/p2m.c
index 660b3cfef234,4ea676a49b6b..000000000000
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@@ -619,14 -611,9 +622,15 @@@ int xen_alloc_p2m_entry(unsigned long p
  			free_p2m_page(p2m);
  	}
  
 +	/* Expanded the p2m? */
 +	if (pfn > xen_p2m_last_pfn) {
 +		xen_p2m_last_pfn = pfn;
 +		HYPERVISOR_shared_info->arch.max_pfn = xen_p2m_last_pfn;
 +	}
 +
- 	return true;
+ 	return 0;
  }
+ EXPORT_SYMBOL(xen_alloc_p2m_entry);
  
  unsigned long __init set_phys_range_identity(unsigned long pfn_s,
  				      unsigned long pfn_e)
