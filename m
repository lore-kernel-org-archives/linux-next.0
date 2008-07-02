From: "Yinghai Lu" <yhlu.kernel@gmail.com>
Subject: Re: linux-next: manual merge of the pci tree
Date: Tue, 1 Jul 2008 19:09:21 -0700
Message-ID: <86802c440807011909l739e0273t132d50de7a4e31ac@mail.gmail.com>
References: <20080701135347.6afb4a84.sfr@canb.auug.org.au>
	 <20080701055844.GB14658@elte.hu>
	 <20080701162920.9e9e5c8f.sfr@canb.auug.org.au>
	 <200807011856.09249.jbarnes@virtuousgeek.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.237]:11637 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755860AbYGBCJW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Jul 2008 22:09:22 -0400
Received: by rv-out-0506.google.com with SMTP id k40so190809rvb.1
        for <linux-next@vger.kernel.org>; Tue, 01 Jul 2008 19:09:21 -0700 (PDT)
In-Reply-To: <200807011856.09249.jbarnes@virtuousgeek.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

On Tue, Jul 1, 2008 at 6:56 PM, Jesse Barnes <jbarnes@virtuousgeek.org> wrote:
> On Monday, June 30, 2008 11:29 pm Stephen Rothwell wrote:
>> Hi Ingo,
>>
>> On Tue, 1 Jul 2008 07:58:44 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>> > hm, the commit looks a bit weird: why the ifdefs? There's nothing 64-bit
>> > about being able to dump early resources, and the CONFIG_PCI could be
>> > hidden as well.
>>
>> I added the 64 bit config test as the original patch was to setup_64.c
>> only (I think).
>>
>> +++ b/arch/x86/kernel/setup.c
>> @@ -596,6 +596,13 @@ void __init setup_arch(char **cmdline_p)
>>
>>       parse_early_param();
>>
>> +#ifdef CONFIG_X86_64
>> +#ifdef CONFIG_PCI
>> +     if (pci_early_dump_regs)
>> +             early_dump_pci_devices();
>> +#endif
>> +#endif
>
> Yeah, I think this would be safe to enable generally though (certainly useful
> to enable everwhere)... Yinghai?
>
yes. please remove #ifdef CONFIG_X86_64, so 32 bit could use that too.

YH
