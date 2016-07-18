From: Kees Cook <keescook@google.com>
Subject: Re: linux-next: manual merge of the kspp tree with the arm64 tree
Date: Sun, 17 Jul 2016 21:49:40 -0700
Message-ID: <CAGXu5jL-=N8cxoLmfNhG-1Pa864MQBbue1SyBQo-HsuOH41_nQ@mail.gmail.com>
References: <20160718125944.19ebe679@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:37209 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751326AbcGREtn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 18 Jul 2016 00:49:43 -0400
Received: by mail-wm0-f51.google.com with SMTP id i5so98561079wmg.0
        for <linux-next@vger.kernel.org>; Sun, 17 Jul 2016 21:49:42 -0700 (PDT)
In-Reply-To: <20160718125944.19ebe679@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Yang Shi <yang.shi@linaro.org>

On Sun, Jul 17, 2016 at 7:59 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Kees,
>
> Today's linux-next merge of the kspp tree got a conflict in:
>
>   arch/arm64/include/asm/uaccess.h
>
> between commit:
>
>   bffe1baff5d5 ("arm64: kasan: instrument user memory access API")
>
> from the arm64 tree and commit:
>
>   b19e7f50f056 ("arm64/uaccess: Enable hardened usercopy")
>
> from the kspp tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc arch/arm64/include/asm/uaccess.h
> index 5e834d10b291,1779cbdb7838..000000000000
> --- a/arch/arm64/include/asm/uaccess.h
> +++ b/arch/arm64/include/asm/uaccess.h
> @@@ -264,14 -276,14 +264,15 @@@ extern unsigned long __must_check __cle
>
>   static inline unsigned long __must_check __copy_from_user(void *to, const void __user *from, unsigned long n)
>   {
>  +      kasan_check_write(to, n);
> -       return  __arch_copy_from_user(to, from, n);
> +       check_object_size(to, n, false);
> +       return __arch_copy_from_user(to, from, n);
>   }
>
>   static inline unsigned long __must_check __copy_to_user(void __user *to, const void *from, unsigned long n)
>   {
>  -      check_object_size(from, n, true);
>  +      kasan_check_read(from, n);
> -       return  __arch_copy_to_user(to, from, n);
> +       return __arch_copy_to_user(to, from, n);

If I'm reading correctly, this second fixup is wrong. It should read;

    kasan_check_read(from, n);
    check_object_size(from, n, true);
    return __arch_copy_to_user(to, from, n);

(i.e. fix double space between "return" and "__arch_copy..." in both
chunks and add check_object_size() calls after the kasan calls in both
chunks.

-Kees

-- 
Kees Cook
Brillo & Chrome OS Security
