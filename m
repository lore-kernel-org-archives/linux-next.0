From: Matt Fleming <matt@codeblueprint.co.uk>
Subject: Re: efi_enabled(EFI_PARAVIRT) use
Date: Sat, 30 Apr 2016 21:44:20 +0100
Message-ID: <20160430204420.GM2839@codeblueprint.co.uk>
References: <20160429142020.4499e185@canb.auug.org.au>
 <20160429063936.GA28320@gmail.com>
 <alpine.DEB.2.10.1604291123260.3312@sstabellini-ThinkPad-X260>
 <20160429143931.GG2839@codeblueprint.co.uk>
 <CAKv+Gu_k45_r0mke6ELb3Pi05BnJiEMqweJRfsy7S55FzCpF7Q@mail.gmail.com>
 <5724BDD2.5020600@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:38183 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750912AbcD3UoY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 30 Apr 2016 16:44:24 -0400
Received: by mail-wm0-f46.google.com with SMTP id g17so86246705wme.1
        for <linux-next@vger.kernel.org>; Sat, 30 Apr 2016 13:44:23 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <5724BDD2.5020600@linaro.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shannon Zhao <shannon.zhao@linaro.org>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Ingo Molnar <mingo@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>

On Sat, 30 Apr, at 10:14:42PM, Shannon Zhao wrote:
> Sure. How should I add this change? Rework this patch or add new one on
> top of it?
 
Rework this patch, please.

> Yes, in this patch we could set EFI_RUNTIME_SERVICES flag in
> fdt_find_hyper_node instead of setting EFI_PARAVIRT flag, and then bail
> out early in arm_enable_runtime_services() as you said. Then call
> xen_efi_runtime_setup() in xen_guest_init().
 
Sounds good.

> While I still have a question, in this patch we use
> efi_enabled(EFI_PARAVIRT) as a condition to make fdt_find_uefi_params()
> and efi_get_fdt_params() execute different ways. So it needs to find a
> new condition for that if we need to get rid of EFI_PARAVIRT. One I
> think is that xen_initial_domain() check. Is that fine?

Hmm... why do you actually need to check whether you're running on a
PV machine in fdt_find_uefi_params()? Can't you infer that from the DT
params you discover?

I could understand maybe only accepting the "xen,uefi-system-table"
property if IS_ENABLED(CONFIG_XEN) but surely you don't also need to
filter based on whether you're booting a PV kernel?

Let me put it this way: when would you see "xen,uefi-system-table" and
*not* be booting a PV kernel?
