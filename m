From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Sun, 19 Nov 2017 20:25:18 -0800
Message-ID: <CAPcyv4hvgxndkNeUxXEQUxysiRauFqoKYmBC5EXqrU2KhnESxg@mail.gmail.com>
References: <20171120125748.156fa18b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:44717 "EHLO
        mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751050AbdKTEZT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 19 Nov 2017 23:25:19 -0500
Received: by mail-oi0-f43.google.com with SMTP id a132so5336178oih.11
        for <linux-next@vger.kernel.org>; Sun, 19 Nov 2017 20:25:19 -0800 (PST)
In-Reply-To: <20171120125748.156fa18b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Nov 19, 2017 at 5:57 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Andrew,
>
> After merging the akpm-current tree, today's linux-next build (powerpc64
> allnoconfig) failed like this:
>
> In file included from arch/powerpc/include/asm/book3s/64/mmu
> -hash.h:24:0,
>                  from arch/powerpc/include/asm/book3s/64/mmu.h:30,
>                  from arch/powerpc/include/asm/mmu.h:305,
>                  from arch/powerpc/include/asm/lppaca.h:36,
>                  from arch/powerpc/include/asm/paca.h:21,
>                  from arch/powerpc/include/asm/current.h:16,
>                  from include/linux/sched.h:12,
>                  from arch/powerpc/kernel/asm-offsets.c:17:
> arch/powerpc/include/asm/book3s/64/pgtable.h:844:35: error: expected declaration specifiers or '...' before 'pud_pte'
>  #define pud_write(pud)  pte_write(pud_pte(pud))
>                                    ^
> include/asm-generic/pgtable.h:817:19: note: in expansion of macro 'pud_write'
>  static inline int pud_write(pud_t pud)
>                    ^
>
> Caused by commit
>
>   5292abe86ee6 ("mm: fix device-dax pud write-faults triggered by get_user_pages()")
>
> grep is your friend ... there may be more fixes needed.

Ugh, yes. Looks correct. I might have confused my build success
notifications from 0day. I'll spin out a new branch to make sure this
is the last of it.
