From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Wed, 29 Mar 2017 10:59:45 +0200
Message-ID: <20170329085945.GA11382@gmail.com>
References: <20170329143528.50c0f325@canb.auug.org.au>
 <906e3014-881c-b1c7-4943-e0ed9845aab2@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:36836 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754484AbdC2I7z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Mar 2017 04:59:55 -0400
Content-Disposition: inline
In-Reply-To: <906e3014-881c-b1c7-4943-e0ed9845aab2@suse.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vitaly Kuznetsov <vkuznets@redhat.com>, Andy Lutomirski <luto@kernel.org>, Mathias Krause <minipli@googlemail.com>, Thomas Garnier <thgarnie@google.com>


* Juergen Gross <jgross@suse.com> wrote:

> On 29/03/17 05:35, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the xen-tip tree got a conflict in:
> > 
> >   arch/x86/xen/enlighten.c
> > 
> > between commits:
> > 
> >   6415813bae75 ("x86/cpu: Drop wp_works_ok member of struct cpuinfo_x86")
> >   69218e47994d ("x86: Remap GDT tables in the fixmap section")
> >   b23adb7d3f7d ("x86/xen/gdt: Use X86_FEATURE_XENPV instead of globals for the GDT fixup")
> > 
> > from the tip tree and commits:
> > 
> >   75cd32d6093e ("x86/xen: split off enlighten_pv.c")
> > 
> > from the xen-tip tree.
> > 
> > I dropped the xen-tip tree for today (see other conflict reports),
> > please get together and sort these out, thanks.
> > 
> 
> Hmm, seems to be a rather bad timing for the series of Vitaly.
> 
> What is the best way to resolve those conflicts? A rebase of Vitaly's
> patches seems to be required in any case.
> 
> Should I rebase the Xen tree on current tip? This seems to be rather
> easy, but I think this will work only if I can be sure the current tip
> tree contents will all be merged by Linus before the Xen tree.

That's certainly very likely, -tip trees all go in very early in the merge window.

> I could try to cherry pick the patches from tip where Vitaly's patches
> have conflicts with, but I think this could lead to a lot of patches
> to take.

Nor is it desirable as a workflow.

I'd suggest the following: in about a week I can guarantee a working tip:x86/mm 
base with most of the 5-level paging patches applied that you could base Xen 
patches on.

Unfortunately, right now there's at least one regression with those changes that 
needs to be properly fixed before it's a suitable base tree. The fix already 
exists, it just needs to be tested and the whole tree needs to cook for a few days 
to be dependable for Xen as a base.

> Or we could delay Vitaly's series until tip has been merged, but this
> will either delay some other Xen patches depending on (or conflicting
> with) Vitaly's patches or would make the rebase for Vitaly more
> difficult.

So my suggestion would be: could you delay 75cd32d6093e for a week, and then merge 
it on top of a pulled in tip:x86/mm? I'll send that tree to Linus on the first day 
of the merge window so there shouldn't be any ordering problems.

Thanks,

	Ingo
