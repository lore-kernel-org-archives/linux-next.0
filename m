From: Kees Cook <keescook@google.com>
Subject: Re: linux-next: manual merge of the kspp tree with the arm64 tree
Date: Sun, 17 Jul 2016 22:14:06 -0700
Message-ID: <CAGXu5jLxOeJqjGuumGQ-dsAbM+NUR6m=o5OASJKSMGLGfM68OQ@mail.gmail.com>
References: <20160718125944.19ebe679@canb.auug.org.au> <CAGXu5jL-=N8cxoLmfNhG-1Pa864MQBbue1SyBQo-HsuOH41_nQ@mail.gmail.com>
 <20160718150602.1c8f1896@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:38899 "EHLO
	mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750837AbcGRFOJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 18 Jul 2016 01:14:09 -0400
Received: by mail-wm0-f43.google.com with SMTP id o80so99059936wme.1
        for <linux-next@vger.kernel.org>; Sun, 17 Jul 2016 22:14:08 -0700 (PDT)
In-Reply-To: <20160718150602.1c8f1896@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Yang Shi <yang.shi@linaro.org>

On Sun, Jul 17, 2016 at 10:06 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Kees,
>
> On Sun, 17 Jul 2016 21:49:40 -0700 Kees Cook <keescook@google.com> wrote:
>>
>> If I'm reading correctly, this second fixup is wrong. It should read;
>>
>>     kasan_check_read(from, n);
>>     check_object_size(from, n, true);
>>     return __arch_copy_to_user(to, from, n);
>>
>> (i.e. fix double space between "return" and "__arch_copy..." in both
>> chunks and add check_object_size() calls after the kasan calls in both
>> chunks.
>
> Yep, sorry.  I will fix it up tomorrow.

Cool, thanks! :)

-Kees

-- 
Kees Cook
Brillo & Chrome OS Security
