From: Matt Fleming <matt@codeblueprint.co.uk>
Subject: Re: efi_enabled(EFI_PARAVIRT) use
Date: Sun, 1 May 2016 14:26:20 +0100
Message-ID: <20160501132620.GT2839@codeblueprint.co.uk>
References: <20160429142020.4499e185@canb.auug.org.au>
 <20160429063936.GA28320@gmail.com>
 <alpine.DEB.2.10.1604291123260.3312@sstabellini-ThinkPad-X260>
 <20160429143931.GG2839@codeblueprint.co.uk>
 <CAKv+Gu_k45_r0mke6ELb3Pi05BnJiEMqweJRfsy7S55FzCpF7Q@mail.gmail.com>
 <5724BDD2.5020600@linaro.org>
 <20160430204420.GM2839@codeblueprint.co.uk>
 <572576E2.7060508@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:38324 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751086AbcEAN0X (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 1 May 2016 09:26:23 -0400
Received: by mail-wm0-f52.google.com with SMTP id g17so104728824wme.1
        for <linux-next@vger.kernel.org>; Sun, 01 May 2016 06:26:22 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <572576E2.7060508@linaro.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shannon Zhao <shannon.zhao@linaro.org>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Ingo Molnar <mingo@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>

On Sun, 01 May, at 11:24:18AM, Shannon Zhao wrote:
> Because the UEFI params for Dom0 are located under /hypervisor/uefi node
> instead of /chosen. So it needs to check whether it's a Dom0 then search
> and parse different node with different params arrays.
 
Why can't you search both nodes? Would you ever expect to see both for
a Dom0 kernel?

> So it still needs add another check to firstly parse the fdt to see if
> there is "xen,uefi-system-table" under /hypervisor/uefi node, right? I
> think it's a bit redundant compared with xen_initial_domain().

Sometimes you really do need to check xen_initial_domain(), but I do
not think this is such a case. And if we can get by without adding
that check, the code will be better for it.
