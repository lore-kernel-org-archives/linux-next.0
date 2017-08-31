From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Thu, 31 Aug 2017 10:01:23 -0400
Message-ID: <1e7c28e3-d0f6-ac40-fb72-7b95d17379f5@oracle.com>
References: <20170831142654.47f17cd7@canb.auug.org.au>
 <alpine.DEB.2.20.1708311009020.1874@nanos>
 <alpine.DEB.2.20.1708311057260.1874@nanos>
 <b8a39692-160e-a15a-158f-74fd5255348b@suse.com>
 <alpine.DEB.2.20.1708311359510.1874@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1708311359510.1874@nanos>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <Xen-devel@lists.xensource.com>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 08/31/2017 08:00 AM, Thomas Gleixner wrote:
> On Thu, 31 Aug 2017, Juergen Gross wrote:
>>> I've applied it on top of tip:x86/apic and fixed up the merge conflicts
>>> mindlessly. Patch below.
>>>
>>> Juergen, can you please check the result?
>> You missed the updates to arch/x86/xen/xen-asm_64.S and the declarations
>> of the xen specific trap entries in arch/x86/include/asm/traps.h
> I'll try that again later today, unless you beat me to it.
>

https://marc.info/?l=linux-kernel&m=150296063131595&w=2 should also be
picked up by the tip tree then since it applies on top of the
adjust_exception_frame patch. I will revert it from Xen tree as well.

-boris
