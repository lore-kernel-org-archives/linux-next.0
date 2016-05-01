From: Shannon Zhao <shannon.zhao@linaro.org>
Subject: Re: efi_enabled(EFI_PARAVIRT) use
Date: Sun, 1 May 2016 11:24:18 +0800
Message-ID: <572576E2.7060508@linaro.org>
References: <20160429142020.4499e185@canb.auug.org.au>
 <20160429063936.GA28320@gmail.com>
 <alpine.DEB.2.10.1604291123260.3312@sstabellini-ThinkPad-X260>
 <20160429143931.GG2839@codeblueprint.co.uk>
 <CAKv+Gu_k45_r0mke6ELb3Pi05BnJiEMqweJRfsy7S55FzCpF7Q@mail.gmail.com>
 <5724BDD2.5020600@linaro.org> <20160430204420.GM2839@codeblueprint.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f173.google.com ([209.85.192.173]:35818 "EHLO
	mail-pf0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752121AbcEADY1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 30 Apr 2016 23:24:27 -0400
Received: by mail-pf0-f173.google.com with SMTP id 77so31993051pfv.2
        for <linux-next@vger.kernel.org>; Sat, 30 Apr 2016 20:24:27 -0700 (PDT)
In-Reply-To: <20160430204420.GM2839@codeblueprint.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matt Fleming <matt@codeblueprint.co.uk>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Ingo Molnar <mingo@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>

On 2016=E5=B9=B405=E6=9C=8801=E6=97=A5 04:44, Matt Fleming wrote:
>> While I still have a question, in this patch we use
>> > efi_enabled(EFI_PARAVIRT) as a condition to make fdt_find_uefi_par=
ams()
>> > and efi_get_fdt_params() execute different ways. So it needs to fi=
nd a
>> > new condition for that if we need to get rid of EFI_PARAVIRT. One =
I
>> > think is that xen_initial_domain() check. Is that fine?
> Hmm... why do you actually need to check whether you're running on a
> PV machine in fdt_find_uefi_params()?
Because the UEFI params for Dom0 are located under /hypervisor/uefi nod=
e
instead of /chosen. So it needs to check whether it's a Dom0 then searc=
h
and parse different node with different params arrays.

> Can't you infer that from the DT
> params you discover?
>=20

> I could understand maybe only accepting the "xen,uefi-system-table"
> property if IS_ENABLED(CONFIG_XEN) but surely you don't also need to
> filter based on whether you're booting a PV kernel?
>=20
> Let me put it this way: when would you see "xen,uefi-system-table" an=
d
> *not* be booting a PV kernel?
So it still needs add another check to firstly parse the fdt to see if
there is "xen,uefi-system-table" under /hypervisor/uefi node, right? I
think it's a bit redundant compared with xen_initial_domain().

Thanks,
--=20
Shannon
