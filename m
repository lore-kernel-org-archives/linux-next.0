From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Wed, 29 Mar 2017 14:36:18 +1100
Message-ID: <20170329143618.3e8154c6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58177 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751497AbdC2DgV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Mar 2017 23:36:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Vrabel <david.vrabel@citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Garnier <thgarnie@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Xiong Zhang <xiong.y.zhang@intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Hi all,

Today's linux-next merge of the xen-tip tree got a conflict in:

  arch/x86/xen/mmu.c

between commits:

  69218e47994d ("x86: Remap GDT tables in the fixmap section")
  907cd4390290 ("x86/xen: Change __xen_pgd_walk() and xen_cleanmfnmap() to support p4d")
  f2a6a7050109 ("x86: Convert the rest of the code to support p4d_t")

from the tip tree and commit:

  48a09cbf855e ("x86/xen: split off mmu_pv.c")

from the xen-tip tree.

I dropped the xen-tip tree for today, please get together and sort
these conflicts out.
-- 
Cheers,
Stephen Rothwell
