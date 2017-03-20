From: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: linux-next: build warnings after merge of the akpm-current tree
Date: Mon, 20 Mar 2017 10:05:54 +0100
Message-ID: <CACT4Y+b-dQYkeDg127hqRfVhTyxrDEP5vR07cH6=ei+9jtTNyg@mail.gmail.com>
References: <20170320162226.47c6e3ed@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vk0-f43.google.com ([209.85.213.43]:33789 "EHLO
        mail-vk0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753409AbdCTJPW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Mar 2017 05:15:22 -0400
Received: by mail-vk0-f43.google.com with SMTP id d188so66606487vka.0
        for <linux-next@vger.kernel.org>; Mon, 20 Mar 2017 02:14:49 -0700 (PDT)
In-Reply-To: <20170320162226.47c6e3ed@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Herbert Xu <herbert@gondor.apana.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mahipal Challa <Mahipal.Challa@cavium.com>, Jan Glauber <jglauber@cavium.com>

On Mon, Mar 20, 2017 at 6:22 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Andrew,
>
> After merging the akpm-current tree, today's linux-next build (x86_64
> allmodconfig) produced these warnings:
>
> drivers/crypto/cavium/zip/zip_main.c: In function 'zip_show_stats':
> drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'long long int' [-Wformat=]
>     seq_printf(s, "        ZIP Device %d Stats\n"
>                   ^
> drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'long long int' [-Wformat=]
> drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expects argument of type 'long int', but argument 6 has type 'long long int' [-Wformat=]
> drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expects argument of type 'long int', but argument 7 has type 'long long int' [-Wformat=]
> drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expects argument of type 'long int', but argument 10 has type 'long long int' [-Wformat=]
> drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expects argument of type 'long int', but argument 11 has type 'long long int' [-Wformat=]
> drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expects argument of type 'long int', but argument 12 has type 'long long int' [-Wformat=]
> drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expects argument of type 'long int', but argument 13 has type 'long long int' [-Wformat=]
> drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expects argument of type 'long int', but argument 14 has type 'long long int' [-Wformat=]
> drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expects argument of type 'long int', but argument 15 has type 'long long int' [-Wformat=]
>
> Introduced by commit
>
>   09ae5d37e093 ("crypto: zip - Add Compression/Decompression statistics")
>
> from the crypto tree interacting with commit
>
>   3f4ca3d25e1a ("asm-generic, x86: wrap atomic operations")
>
> from the akpm-current tree.
>
> This latter commit changed atomic64read() from "long" to "long long"
> on x86_64.

Hi,

Previously atomic operations returned different types on 32/64 bits. I
think that was pretty unfortunate and could actually lead to lots of
such warnings (as there were no single format specifier that one could
use portably), and was difficult to wrap. So I used "unsigned long
long" for all operations.
I actually suspect that the new zip_main.c code would cause a similar
warning on 32 bits even without my change, because atomic ops already
returned unsigned long long there.
So I think we need to fix zip_main.c.
