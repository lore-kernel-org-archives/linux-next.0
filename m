From: Shannon Zhao <shannon.zhao@linaro.org>
Subject: Re: efi_enabled(EFI_PARAVIRT) use
Date: Sat, 30 Apr 2016 22:14:42 +0800
Message-ID: <5724BDD2.5020600@linaro.org>
References: <20160429142020.4499e185@canb.auug.org.au>
 <20160429063936.GA28320@gmail.com>
 <alpine.DEB.2.10.1604291123260.3312@sstabellini-ThinkPad-X260>
 <20160429143931.GG2839@codeblueprint.co.uk>
 <CAKv+Gu_k45_r0mke6ELb3Pi05BnJiEMqweJRfsy7S55FzCpF7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f177.google.com ([209.85.192.177]:36048 "EHLO
	mail-pf0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751225AbcD3OPA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 30 Apr 2016 10:15:00 -0400
Received: by mail-pf0-f177.google.com with SMTP id c189so61335874pfb.3
        for <linux-next@vger.kernel.org>; Sat, 30 Apr 2016 07:15:00 -0700 (PDT)
In-Reply-To: <CAKv+Gu_k45_r0mke6ELb3Pi05BnJiEMqweJRfsy7S55FzCpF7Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Matt Fleming <matt@codeblueprint.co.uk>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Ingo Molnar <mingo@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>

On 2016=E5=B9=B404=E6=9C=8829=E6=97=A5 22:53, Ard Biesheuvel wrote:
> On 29 April 2016 at 16:39, Matt Fleming <matt@codeblueprint.co.uk> wr=
ote:
>> On Fri, 29 Apr, at 11:34:45AM, Stefano Stabellini wrote:
>>> On Fri, 29 Apr 2016, Ingo Molnar wrote:
>>>> Also, it would be nice to have all things EFI in a single tree, th=
e conflicts are
>>>> going to be painful! There's very little reason not to carry this =
kind of commit:
>>>>
>>>>  arch/arm/xen/enlighten.c           |  6 +++++
>>>>  drivers/firmware/efi/arm-runtime.c | 17 +++++++++-----
>>>>  drivers/firmware/efi/efi.c         | 45 +++++++++++++++++++++++++=
+++++++------
>>>>  3 files changed, 56 insertions(+), 12 deletions(-)
>>>>
>>>> in the EFI tree.
>>>
>>> That's true. I'll drop this commit from xentip and let Matt pick it=
 up
>>> or request changes as he sees fit.
>>
>> One small change I think would be sensible to make is to expand
>> EFI_PARAVIRT into a few more bits to clearly indicate the quirks on
>> Xen, and in the process, to delete EFI_PARAVIRT.
>>
Sure. How should I add this change? Rework this patch or add new one on
top of it?

>> That should address Ingo's major concern, and also make it much easi=
er
>> to rework the code in a piecemeal fashion.
>>
>> Could somebody enumerate the things that make Xen (dom0) different o=
n
>> arm* compared with bare metal EFI boot? The list I made for x86 was,
>>
>>   1. Has no EFI memory map
>>   2. Runtime regions do not need to be mapped
>>   3. Cannot call SetVirtualAddressMap()
>>   4. /sys/firmware/efi/fw_vendor is invisible
>>
>> The first maps to not setting EFI_MEMMAP, the second to not setting
>> EFI_RUNTIME. If we add EFI_ALREADY_VIRTUAL and EFI_FW_VENDOR_INVISIB=
LE
>> to efi.flags that should cover everything on x86. Does arm* require
>> anything else?
>=20
> I already proposed when this patch was first under review to make the
> arm_enable_runtime_services() function bail early without error if th=
e
> EFI_RUNTIME_SERVICES flag is already set, and the xen code could set
> that bit as well when it installs its paravirtualized alternatives. I
> don't remember exactly why that was shot down, though, but I think it
> is the only reason this code introduces references to EFI_PARAVIRT in
> the first place.
>=20
Yes, in this patch we could set EFI_RUNTIME_SERVICES flag in
fdt_find_hyper_node instead of setting EFI_PARAVIRT flag, and then bail
out early in arm_enable_runtime_services() as you said. Then call
xen_efi_runtime_setup() in xen_guest_init().

While I still have a question, in this patch we use
efi_enabled(EFI_PARAVIRT) as a condition to make fdt_find_uefi_params()
and efi_get_fdt_params() execute different ways. So it needs to find a
new condition for that if we need to get rid of EFI_PARAVIRT. One I
think is that xen_initial_domain() check. Is that fine?

Thanks,
--=20
Shannon
