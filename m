From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Fri, 19 Feb 2016 16:26:58 +0100
Message-ID: <CAKv+Gu-roh-fy=UCuL79E++=GmferfAZmDK0+w2XPBby9EzPpg@mail.gmail.com>
References: <20160219150926.76304938@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:35141 "EHLO
	mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161047AbcBSP06 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Feb 2016 10:26:58 -0500
Received: by mail-io0-f177.google.com with SMTP id g203so112629777iof.2
        for <linux-next@vger.kernel.org>; Fri, 19 Feb 2016 07:26:58 -0800 (PST)
In-Reply-To: <20160219150926.76304938@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tony Luck <tony.luck@intel.com>

On 19 February 2016 at 05:09, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Andrew,
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>
>   arch/x86/mm/extable.c
>
> between commit:
>
>   548acf19234d ("x86/mm: Expand the exception table logic to allow new handling options")
>
> from the tip tree and commit:
>
>   f1cd2c09ff09 ("x86/extable: use generic search and sort routines")
>
> from the akpm-current tree.
>
> I couldn't figure out how to fix this up, so I just dropped the
> akpm-current tree patch.
>

Hi Andrew,

Unfortunately, this is not the only problem currently with my extable
series. The arm64 patch now also conflicts with patches that are
queued in the arm64 tree.

So could you please drop all six of them for now? I will ask Catalin
to take the ones that are essential to the arm64 KASLR implementation
via the arm64 tree, and once that hits mainline, I will rebase and
resubmit the remaining patches.

extable-add-support-for-relative-extables-to-search-and-sort-routines.patch
alpha-extable-use-generic-search-and-sort-routines.patch
s390-extable-use-generic-search-and-sort-routines.patch
x86-extable-use-generic-search-and-sort-routines.patch
ia64-extable-use-generic-search-and-sort-routines.patch
arm64-switch-to-relative-exception-tables.patch

Thanks,
Ard.
