From: Juergen Gross <jgross@suse.com>
Subject: Re: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Wed, 29 Mar 2017 10:37:28 +0200
Message-ID: <906e3014-881c-b1c7-4943-e0ed9845aab2@suse.com>
References: <20170329143528.50c0f325@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170329143528.50c0f325@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vitaly Kuznetsov <vkuznets@redhat.com>, Andy Lutomirski <luto@kernel.org>, Mathias Krause <minipli@googlemail.com>, Thomas Garnier <thgarnie@google.com>
List-Id: linux-next.vger.kernel.org

On 29/03/17 05:35, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the xen-tip tree got a conflict in:
> 
>   arch/x86/xen/enlighten.c
> 
> between commits:
> 
>   6415813bae75 ("x86/cpu: Drop wp_works_ok member of struct cpuinfo_x86")
>   69218e47994d ("x86: Remap GDT tables in the fixmap section")
>   b23adb7d3f7d ("x86/xen/gdt: Use X86_FEATURE_XENPV instead of globals for the GDT fixup")
> 
> from the tip tree and commits:
> 
>   75cd32d6093e ("x86/xen: split off enlighten_pv.c")
> 
> from the xen-tip tree.
> 
> I dropped the xen-tip tree for today (see other conflict reports),
> please get together and sort these out, thanks.
> 

Hmm, seems to be a rather bad timing for the series of Vitaly.

What is the best way to resolve those conflicts? A rebase of Vitaly's
patches seems to be required in any case.

Should I rebase the Xen tree on current tip? This seems to be rather
easy, but I think this will work only if I can be sure the current tip
tree contents will all be merged by Linus before the Xen tree.

I could try to cherry pick the patches from tip where Vitaly's patches
have conflicts with, but I think this could lead to a lot of patches
to take.

Or we could delay Vitaly's series until tip has been merged, but this
will either delay some other Xen patches depending on (or conflicting
with) Vitaly's patches or would make the rebase for Vitaly more
difficult.

Thoughts?


Juergen
