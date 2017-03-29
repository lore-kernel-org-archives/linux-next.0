From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Wed, 29 Mar 2017 12:41:52 +0200
Message-ID: <20170329104152.GA28476@gmail.com>
References: <20170329143528.50c0f325@canb.auug.org.au>
 <906e3014-881c-b1c7-4943-e0ed9845aab2@suse.com>
 <20170329085945.GA11382@gmail.com>
 <04988941-7db8-1579-ce77-a1be25a55eb4@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <04988941-7db8-1579-ce77-a1be25a55eb4@suse.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Juergen Gross <jgross@suse.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vitaly Kuznetsov <vkuznets@redhat.com>, Andy Lutomirski <luto@kernel.org>, Mathias Krause <minipli@googlemail.com>, Thomas Garnier <thgarnie@google.com>
List-Id: linux-next.vger.kernel.org


* Juergen Gross <jgross@suse.com> wrote:

> On 29/03/17 10:59, Ingo Molnar wrote:
> > 
> > * Juergen Gross <jgross@suse.com> wrote:
> > 
> >> On 29/03/17 05:35, Stephen Rothwell wrote:
> >>> Hi all,
> >>>
> >>> Today's linux-next merge of the xen-tip tree got a conflict in:
> >>>
> >>>   arch/x86/xen/enlighten.c
> >>>
> >>> between commits:
> >>>
> >>>   6415813bae75 ("x86/cpu: Drop wp_works_ok member of struct cpuinfo_x86")
> >>>   69218e47994d ("x86: Remap GDT tables in the fixmap section")
> >>>   b23adb7d3f7d ("x86/xen/gdt: Use X86_FEATURE_XENPV instead of globals for the GDT fixup")
> >>>
> >>> from the tip tree and commits:
> >>>
> >>>   75cd32d6093e ("x86/xen: split off enlighten_pv.c")
> >>>
> >>> from the xen-tip tree.
> >>>
> >>> I dropped the xen-tip tree for today (see other conflict reports),
> >>> please get together and sort these out, thanks.
> 
> Stephen, I have rewound the linux-next branch of xen-tip to its previous
> position. You can re-enable xen-tip.

Thank you!

	Ingo
