From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: manual merge of the nvdimm tree with the tip tree
Date: Tue, 26 Jun 2018 09:06:32 -0700
Message-ID: <CAPcyv4hdpkFGHZ4sv7Od-ezMXg8JZg+-E=CEsmN1tea+z75hkg@mail.gmail.com>
References: <20180626121853.0b4ce17c@canb.auug.org.au> <alpine.DEB.2.21.1806261217140.2204@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.1806261217140.2204@nanos.tec.linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@suse.de>
List-Id: linux-next.vger.kernel.org

On Tue, Jun 26, 2018 at 3:21 AM, Thomas Gleixner <tglx@linutronix.de> wrote:
> On Tue, 26 Jun 2018, Stephen Rothwell wrote:
>> Today's linux-next merge of the nvdimm tree got a conflict in:
>>
>>   arch/x86/kernel/cpu/mcheck/mce.c
>>
>> between commit:
>>
>>   d3d6923cd1ae ("x86/mce: Carve out the crashing_cpu check")
>>
>> from the tip tree and commit:
>>
>>   f6785eac562b ("x86/memory_failure: Introduce {set,clear}_mce_nospec()")
>>
>> from the nvdimm tree.
>
> Dan, we have rules how to deal with that stuff and there is no excuse for
> you to collect random patches and apply them as you see fit. Stop this
> please.
>

Yes, it was stale from the merge window when I was getting late 0day
and -next testing coverage. I held them back from the merge window
precisely due to lack of acks and review comments. My mistake was not
immediately pulling them down from my -next branch when it was clear
that I needed to circle back and try again for 4.19.

> MCE/RAS patches have a well established and working route and if something
> in your tree really depends on this, which I'm not seeing at all, then
> there are well documented and established procedures to do that.

Sorry, again I had no intention of bypassing x86 and the offending
patches have been pulled from my -next branch.

I need them for teaching memory_failure() how to handle DAX and
persistent memory. The primary challenge DAX and PMEM pose to the
existing error handling flow is that the errors can be repaired and
that the same poison pages can be accessed safely through the
device-driver with memcpy_mcsafe().
