From: Juergen Gross <jgross@suse.com>
Subject: Re: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Wed, 29 Mar 2017 11:54:57 +0200
Message-ID: <04988941-7db8-1579-ce77-a1be25a55eb4@suse.com>
References: <20170329143528.50c0f325@canb.auug.org.au>
 <906e3014-881c-b1c7-4943-e0ed9845aab2@suse.com>
 <20170329085945.GA11382@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:55392 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755367AbdC2JzI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Mar 2017 05:55:08 -0400
In-Reply-To: <20170329085945.GA11382@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vitaly Kuznetsov <vkuznets@redhat.com>, Andy Lutomirski <luto@kernel.org>, Mathias Krause <minipli@googlemail.com>, Thomas Garnier <thgarnie@google.com>

On 29/03/17 10:59, Ingo Molnar wrote:
> 
> * Juergen Gross <jgross@suse.com> wrote:
> 
>> On 29/03/17 05:35, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Today's linux-next merge of the xen-tip tree got a conflict in:
>>>
>>>   arch/x86/xen/enlighten.c
>>>
>>> between commits:
>>>
>>>   6415813bae75 ("x86/cpu: Drop wp_works_ok member of struct cpuinfo_x86")
>>>   69218e47994d ("x86: Remap GDT tables in the fixmap section")
>>>   b23adb7d3f7d ("x86/xen/gdt: Use X86_FEATURE_XENPV instead of globals for the GDT fixup")
>>>
>>> from the tip tree and commits:
>>>
>>>   75cd32d6093e ("x86/xen: split off enlighten_pv.c")
>>>
>>> from the xen-tip tree.
>>>
>>> I dropped the xen-tip tree for today (see other conflict reports),
>>> please get together and sort these out, thanks.

Stephen, I have rewound the linux-next branch of xen-tip to its previous
position. You can re-enable xen-tip.


Juergen
