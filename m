From: Eial Czerwacki <eial@scalemp.com>
Subject: Re: [PATCH v2] x86/build: Build VSMP support only if CONFIG_PCI is
 selected
Date: Mon, 5 Nov 2018 08:39:22 +0200
Message-ID: <b7d4f31c-ac0c-ccda-4994-e3612fd28799@scalemp.com>
References: <2130cd90-2c8f-2fc4-0ac8-81a5aea153b2@scalemp.com>
 <alpine.DEB.2.21.1811042202530.10744@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.1811042202530.10744@nanos.tec.linutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Juergen Gross <jgross@suse.com>, Randy Dunlap <rdunlap@infradead.org>, "Shai Fultheim (Shai@ScaleMP.com)" <Shai@ScaleMP.com>, Andrew Morton <akpm@linux-foundation.org>, "broonie@kernel.org" <broonie@kernel.org>, "mhocko@suse.cz" <mhocko@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "mm-commits@vger.kernel.org" <mm-commits@vger.kernel.org>, X86 ML <x86@kernel.org>, Oren Twaig <oren@scalemp.com>
List-Id: linux-next.vger.kernel.org

Greetings Thomas,

On 11/04/2018 11:05 PM, Thomas Gleixner wrote:
> Eial,
> 
> On Thu, 1 Nov 2018, Eial Czerwacki wrote:
> 
>> Subject: x86/build: Build VSMP support only if CONFIG_PCI is selected
> 
> That's not what the patch does, right?
> 
you are correct, I'll resend it with a more appropriate subject.

>> vsmp dependency on pv_irq_ops removed some years ago, so now let's clean
>> it up from vsmp_64.c.
>>
>> In short, "cap & ctl & (1 << 4)" was always returning 0, as such we can
>> remove all the PARAVIRT/PARAVIRT_XXL code handling that.
>>
>> However, the rest of the code depends on CONFIG_PCI, so fix it accordingly.
>> in addition, rename set_vsmp_pv_ops to set_vsmp_ctl.
>>
>> Signed-off-by: Eial Czerwacki <eial@scalemp.com>
>> Acked-by: Shai Fultheim <shai@scalemp.com>
> 
> Unfortunately that patch does not apply. It's white space damaged, i.e. all
> tabs are converted to spaces.
> 
> Thanks,
> 
> 	tglx
> 

weird, it got applied without any issues on latest git, I'll verify it
applies well.

Eial.
