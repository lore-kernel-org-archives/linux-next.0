From: Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: build failure after merge of the security tree
Date: Wed, 16 Aug 2017 20:24:24 -0700
Message-ID: <CAGXu5j+RQDASj+pVSxv5tN7p071qfgtvqh3atjmb=0akXJwVHw@mail.gmail.com>
References: <20170817125140.7d705af8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:33831 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751622AbdHQDY0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Aug 2017 23:24:26 -0400
Received: by mail-it0-f44.google.com with SMTP id m34so787475iti.1
        for <linux-next@vger.kernel.org>; Wed, 16 Aug 2017 20:24:25 -0700 (PDT)
In-Reply-To: <20170817125140.7d705af8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Morris <jmorris@namei.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Aug 16, 2017 at 7:51 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi James,
>
> After merging the security tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> In file included from samples/seccomp/bpf-fancy.c:12:0:
> samples/seccomp/bpf-fancy.c: In function 'main':
> samples/seccomp/bpf-helper.h:47:26: error: 'SECCOMP_RET_KILL_THREAD' undeclared (first use in this function)
>   BPF_STMT(BPF_RET+BPF_K, SECCOMP_RET_KILL_THREAD)
>                           ^
> ./usr/include/linux/filter.h:48:59: note: in definition of macro 'BPF_STMT'
>  #define BPF_STMT(code, k) { (unsigned short)(code), 0, 0, k }
>                                                            ^
> samples/seccomp/bpf-fancy.c:41:3: note: in expansion of macro 'DENY'
>    DENY,  /* Don't passthrough into a label */
>    ^~~~
> samples/seccomp/bpf-helper.h:47:26: note: each undeclared identifier is reported only once for each function it appears in
>   BPF_STMT(BPF_RET+BPF_K, SECCOMP_RET_KILL_THREAD)
>                           ^
> ./usr/include/linux/filter.h:48:59: note: in definition of macro 'BPF_STMT'
>  #define BPF_STMT(code, k) { (unsigned short)(code), 0, 0, k }
>                                                            ^
> samples/seccomp/bpf-fancy.c:41:3: note: in expansion of macro 'DENY'
>    DENY,  /* Don't passthrough into a label */
>    ^~~~
>
> [Note: this is a cross build, if that is relevant ...]
>
> Presumably caused by commit
>
>   fd76875ca289 ("seccomp: Rename SECCOMP_RET_KILL to SECCOMP_RET_KILL_THREAD")
>
> I have used the security tree from next-20170816 for today.

Hmmm, I think we've had problems like this before due to samples being
built before the headers have been installed. Regardless, I'll
un-rename that macro in the samples...

-Kees

-- 
Kees Cook
Pixel Security
