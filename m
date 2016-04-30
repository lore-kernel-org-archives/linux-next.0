From: Shannon Zhao <shannon.zhao@linaro.org>
Subject: Re: efi_enabled(EFI_PARAVIRT) use
Date: Sat, 30 Apr 2016 22:04:03 +0800
Message-ID: <5724BB53.40202@linaro.org>
References: <20160429142020.4499e185@canb.auug.org.au>
 <20160429063936.GA28320@gmail.com>
 <alpine.DEB.2.10.1604291123260.3312@sstabellini-ThinkPad-X260>
 <20160429143931.GG2839@codeblueprint.co.uk>
 <alpine.DEB.2.10.1604291547130.3312@sstabellini-ThinkPad-X260>
 <alpine.DEB.2.10.1604291634000.3312@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f180.google.com ([209.85.192.180]:35934 "EHLO
	mail-pf0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750782AbcD3OET (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 30 Apr 2016 10:04:19 -0400
Received: by mail-pf0-f180.google.com with SMTP id c189so61263077pfb.3
        for <linux-next@vger.kernel.org>; Sat, 30 Apr 2016 07:04:19 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1604291634000.3312@sstabellini-ThinkPad-X260>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Matt Fleming <matt@codeblueprint.co.uk>, Ingo Molnar <mingo@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Borislav Petkov <bp@alien8.de>

On 2016=E5=B9=B404=E6=9C=8829=E6=97=A5 23:37, Stefano Stabellini wrote:
> On Fri, 29 Apr 2016, Stefano Stabellini wrote:
>> On Fri, 29 Apr 2016, Matt Fleming wrote:
>>> On Fri, 29 Apr, at 11:34:45AM, Stefano Stabellini wrote:
>>>> On Fri, 29 Apr 2016, Ingo Molnar wrote:
>>>>> Also, it would be nice to have all things EFI in a single tree, t=
he conflicts are=20
>>>>> going to be painful! There's very little reason not to carry this=
 kind of commit:
>>>>>
>>>>>  arch/arm/xen/enlighten.c           |  6 +++++
>>>>>  drivers/firmware/efi/arm-runtime.c | 17 +++++++++-----
>>>>>  drivers/firmware/efi/efi.c         | 45 ++++++++++++++++++++++++=
++++++++------
>>>>>  3 files changed, 56 insertions(+), 12 deletions(-)
>>>>>
>>>>> in the EFI tree.
>>>>
>>>> That's true. I'll drop this commit from xentip and let Matt pick i=
t up
>>>> or request changes as he sees fit.
>>>
>>> One small change I think would be sensible to make is to expand
>>> EFI_PARAVIRT into a few more bits to clearly indicate the quirks on
>>> Xen, and in the process, to delete EFI_PARAVIRT.
>>>
>>> That should address Ingo's major concern, and also make it much eas=
ier
>>> to rework the code in a piecemeal fashion.
>>>
>>> Could somebody enumerate the things that make Xen (dom0) different =
on
>>> arm* compared with bare metal EFI boot? The list I made for x86 was=
,
>>>
>>>   1. Has no EFI memory map
>>>   2. Runtime regions do not need to be mapped
>>>   3. Cannot call SetVirtualAddressMap()
>>>   4. /sys/firmware/efi/fw_vendor is invisible
>>>
>>> The first maps to not setting EFI_MEMMAP, the second to not setting
>>> EFI_RUNTIME. If we add EFI_ALREADY_VIRTUAL and EFI_FW_VENDOR_INVISI=
BLE
>>> to efi.flags that should cover everything on x86. Does arm* require
>>> anything else?
>>
>> Xen on ARM is different, the impact should be limited:
>>
>> - there are no BootServices (ExitBootServices has already been calle=
d)
>> - RuntimeServices go via hypercalls
>>
>> The UEFI memory map is still available at an address specified on de=
vice
>> tree like on native, but the compatibility string is different
>> ("xen,uefi-mmap-start") to clarify that we are booting on Xen rather
>> than native.
>>
>> That's pretty much it, Shannon please confirm.
>=20
> This is to say that Xen on ARM might only need EFI_RUNTIME.
>=20
Yes, it needs EFI_RUNTIME_SERVICES.

Thanks,
--=20
Shannon
