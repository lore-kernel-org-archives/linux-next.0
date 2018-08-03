From: Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: build failure after merge of the pstore tree
Date: Thu, 2 Aug 2018 19:56:27 -0700
Message-ID: <CAGXu5jKr_M1zxirDJjbE5fzzhQyXeNWaAkGUK13RDKTBANTbPQ@mail.gmail.com>
References: <20180803110002.5942ff15@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180803110002.5942ff15@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Geliang Tang <geliangtang@gmail.com>
List-Id: linux-next.vger.kernel.org

On Thu, Aug 2, 2018 at 6:00 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Kees,
>
> After merging the pstore tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> fs/pstore/platform.o: In function `zbufsize_zstd':
> platform.c:(.text+0x172): undefined reference to `ZSTD_compressBound'
>
> Caused by commit
>
>   48ed452ca6ad ("pstore: add zstd compression support")

Yikes. I have no idea how this slipped through. allmodconfig builds
are my standard sanity-check but I clearly made some kind of error in
my scripting.

I'll get it fixed. Thanks!

-Kees

-- 
Kees Cook
Pixel Security
