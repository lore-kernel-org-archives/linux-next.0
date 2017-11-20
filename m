From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Sun, 19 Nov 2017 20:34:58 -0800
Message-ID: <CAPcyv4gK4Ezz4sccwyKynj378RLXts0xYrLq9i7rpRA_eZyoZg@mail.gmail.com>
References: <20171120125748.156fa18b@canb.auug.org.au> <CAPcyv4hvgxndkNeUxXEQUxysiRauFqoKYmBC5EXqrU2KhnESxg@mail.gmail.com>
 <20171120153230.1738cc35@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ot0-f170.google.com ([74.125.82.170]:36099 "EHLO
        mail-ot0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750764AbdKTEe7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 19 Nov 2017 23:34:59 -0500
Received: by mail-ot0-f170.google.com with SMTP id t79so6646073ota.3
        for <linux-next@vger.kernel.org>; Sun, 19 Nov 2017 20:34:58 -0800 (PST)
In-Reply-To: <20171120153230.1738cc35@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Nov 19, 2017 at 8:32 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Dan,
>
> On Sun, 19 Nov 2017 20:25:18 -0800 Dan Williams <dan.j.williams@intel.com> wrote:
>>
>> Ugh, yes. Looks correct. I might have confused my build success
>> notifications from 0day. I'll spin out a new branch to make sure this
>> is the last of it.
>
> Thanks.
>
> While I have your attention ... did you consider using the other
> paradigm:
>
> In arch include files:
> #define pud_write       pud_write
> static inline int pud_write(pud_t pud)
>  .....
>
> Then in include/asm-generic/pgtable.h:
>
> #ifndef pud_write
> tatic inline int pud_write(pud_t pud)
> {
>         ....
> }
> #endif
>
> If you had, then the powerpc code would have worked ... ;-)
> and many of the other interfaces in include/asm-generic/pgtable.h are
> protected that way ...

I like that better. I simply cargo-culted the way pmd_write() was
defined, and should have given it a bit more thought. Andrew, I'll
respin these with Stephen's suggestion.
