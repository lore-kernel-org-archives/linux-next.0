From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Mon, 28 Aug 2017 15:20:16 +1000
Message-ID: <20170828152016.635096c0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52067 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750767AbdH1FUT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Aug 2017 01:20:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Today's linux-next merge of the xen-tip tree got conflicts in:

  arch/x86/xen/xen-asm.S
  arch/x86/xen/xen-asm_64.S

between commit:

  edcb5cf84f05 ("x86/paravirt/xen: Remove xen_patch()")

from the tip tree and commits:

  ad5b8c4ba323("xen: get rid of paravirt op adjust_exception_frame")
  bd830917233b ("paravirt,xen: remove xen_patch()")

from the xen-tip tree.

I fixed it up (edcb5cf84f05 and bd830917233b ate more or less the same
patch, so I just used the latter version files) and can carry the fix
as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell
