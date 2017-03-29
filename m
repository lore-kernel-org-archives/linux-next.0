From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Wed, 29 Mar 2017 14:35:28 +1100
Message-ID: <20170329143528.50c0f325@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60443 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751497AbdC2Dfc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Mar 2017 23:35:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Vrabel <david.vrabel@citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vitaly Kuznetsov <vkuznets@redhat.com>, Andy Lutomirski <luto@kernel.org>, Mathias Krause <minipli@googlemail.com>, Thomas Garnier <thgarnie@google.com>

Hi all,

Today's linux-next merge of the xen-tip tree got a conflict in:

  arch/x86/xen/enlighten.c

between commits:

  6415813bae75 ("x86/cpu: Drop wp_works_ok member of struct cpuinfo_x86")
  69218e47994d ("x86: Remap GDT tables in the fixmap section")
  b23adb7d3f7d ("x86/xen/gdt: Use X86_FEATURE_XENPV instead of globals for the GDT fixup")

from the tip tree and commits:

  75cd32d6093e ("x86/xen: split off enlighten_pv.c")

from the xen-tip tree.

I dropped the xen-tip tree for today (see other conflict reports),
please get together and sort these out, thanks.
-- 
Cheers,
Stephen Rothwell
