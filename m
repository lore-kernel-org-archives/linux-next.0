From: Kees Cook <keescook@google.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the kspp tree
Date: Mon, 15 Jan 2018 12:07:12 -0800
Message-ID: <CAGXu5jJJyNVs6LWvyfDxW0KCkeZ8o4tGaU9eEko3F04YszxGHg@mail.gmail.com>
References: <20180115155710.36e146ab@canb.auug.org.au> <CAK8P3a2kjx2x=iC7ei9q36A9TooiZR+d4QTQkfJL6ys7XLtwiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vk0-f43.google.com ([209.85.213.43]:44054 "EHLO
        mail-vk0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750817AbeAOUHO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Jan 2018 15:07:14 -0500
Received: by mail-vk0-f43.google.com with SMTP id q62so5211987vkb.11
        for <linux-next@vger.kernel.org>; Mon, 15 Jan 2018 12:07:13 -0800 (PST)
In-Reply-To: <CAK8P3a2kjx2x=iC7ei9q36A9TooiZR+d4QTQkfJL6ys7XLtwiQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Jan 15, 2018 at 4:41 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Jan 15, 2018 at 5:57 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi Andrew,
>>
>> Today's linux-next merge of the akpm-current tree got a conflict in:
>>
>>   arch/cris/include/arch-v10/arch/bug.h
>>
>> between commit:
>>
>>   c8133e59edb0 ("cris: Mark end of BUG() implementation as unreachable")
>>
>> from the kspp tree and commit:
>>
>>   c5a1e183a75a ("bug.h: work around GCC PR82365 in BUG()")
>>
>> from the akpm-current tree.
>>
>> I fixed it up (I just used the akpm-current tree version) and can
>> carry the fix as necessary. This is now fixed as far as linux-next is
>> concerned, but any non trivial conflicts should be mentioned to your
>> upstream maintainer when your tree is submitted for merging.  You may
>> also want to consider cooperating with the maintainer of the conflicting
>> tree to minimise any particularly complex conflicts.
>
> Kees,
>
> it seems you ran into the same issue that I did, and got the same fix
> for the first BUG() variant, but I think my version for the second one
> is slightly better:
>
>  /* This just causes an oops. */
> -#define BUG() (*(int *)0 = 0)
> +#define BUG()                                                          \
> +do {                                                                   \
> +       barrier_before_unreachable();                                   \
> +       __builtin_trap();                                               \
> +} while (0)
>
> compared to yours:
>
>  /* This just causes an oops. */
> -#define BUG() (*(int *)0 = 0)
> +#define BUG()                                                          \
> +do {                                                                   \
> +       (*(int *)0 = 0);                                                \
> +       do {} while (1);                                                \
> +       unreachable();                                                  \
> +} while (0)
>
> which relies on a NULL pointer dereference to trap but otherwise
> does the same thing. The easiest solution for the conflict seems to
> be that you just drop your patch.

Oh yeah, very nice. Yeah, yours is better. I'll drop mine.

Thanks!

-Kees

-- 
Kees Cook
Pixel Security
