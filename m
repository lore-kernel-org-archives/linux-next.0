From: Shannon Zhao <zhaoshenglong@huawei.com>
Subject: Re: [Xen-devel] efi_enabled(EFI_PARAVIRT) use
Date: Tue, 3 May 2016 17:13:52 +0800
Message-ID: <57286BD0.2000809@huawei.com>
References: <20160429142020.4499e185@canb.auug.org.au> <20160429063936.GA28320@gmail.com> <alpine.DEB.2.10.1604291123260.3312@sstabellini-ThinkPad-X260> <20160429143931.GG2839@codeblueprint.co.uk> <CAKv+Gu_k45_r0mke6ELb3Pi05BnJiEMqweJRfsy7S55FzCpF7Q@mail.gmail.com> <5724BDD2.5020600@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from szxga03-in.huawei.com ([119.145.14.66]:30438 "EHLO
	szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751419AbcECJPk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 May 2016 05:15:40 -0400
In-Reply-To: <5724BDD2.5020600@linaro.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shannon Zhao <shannon.zhao@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Matt Fleming <matt@codeblueprint.co.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jeremy Fitzhardinge <jeremy@goop.org>, Stefano Stabellini <sstabellini@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Xen Devel <Xen-devel@lists.xensource.com>, Borislav Petkov <bp@alien8.de>, linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>



On 2016/4/30 22:14, Shannon Zhao wrote:
>> I already proposed when this patch was first under review to make the
>> > arm_enable_runtime_services() function bail early without error if the
>> > EFI_RUNTIME_SERVICES flag is already set, and the xen code could set
>> > that bit as well when it installs its paravirtualized alternatives. I
>> > don't remember exactly why that was shot down, though, but I think it
>> > is the only reason this code introduces references to EFI_PARAVIRT in
>> > the first place.
>> > 
> Yes, in this patch we could set EFI_RUNTIME_SERVICES flag in
> fdt_find_hyper_node instead of setting EFI_PARAVIRT flag, and then bail
> out early in arm_enable_runtime_services() as you said. Then call
> xen_efi_runtime_setup() in xen_guest_init().

Hi Ard,

If it sets EFI_RUNTIME_SERVICES flag in fdt_find_hyper_node and in
arm_enable_runtime_services() it checks whether it's a Dom0 through
xen_init_domain() and the EFI_RUNTIME_SERVICES flag is set, then call
xen_efi_runtime_setup(). Is it ok?

Thanks,
-- 
Shannon
