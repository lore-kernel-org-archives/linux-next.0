From: Kees Cook <keescook@google.com>
Subject: =?UTF-8?Q?Re=3A_redefinition_of_=E2=80=98native=5Fpud=5Fclear=E2=80=99_error_on_?=
        =?UTF-8?Q?x86?=
Date: Tue, 14 Feb 2017 11:31:16 -0800
Message-ID: <CAGXu5jKpNZNdxPfPKSuE+oAHdXp8Rgv0tD_o-bR=as-N4YaPxQ@mail.gmail.com>
References: <CAJ1xhMXXcqi9mo4jQG5bT03ocP9aXwn2d0DMKTiA_-bCnwiLcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-it0-f47.google.com ([209.85.214.47]:36517 "EHLO
        mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751495AbdBNTbS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Feb 2017 14:31:18 -0500
Received: by mail-it0-f47.google.com with SMTP id c7so46854668itd.1
        for <linux-next@vger.kernel.org>; Tue, 14 Feb 2017 11:31:17 -0800 (PST)
In-Reply-To: <CAJ1xhMXXcqi9mo4jQG5bT03ocP9aXwn2d0DMKTiA_-bCnwiLcA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Kapshuk <alexander.kapshuk@gmail.com>, Matthew Wilcox <mawilcox@microsoft.com>, Dave Jiang <dave.jiang@intel.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next <linux-next@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>

On Tue, Feb 14, 2017 at 8:14 AM, Alexander Kapshuk
<alexander.kapshuk@gmail.com> wrote:
> I'm getting this error on x86 when compiling next-20170214.
> Any advice on how to fix this would be much appreciated.
>
>   time make -j2
> ...
> CC      arch/x86/kernel/asm-offsets.s
>   GEN     scripts/gdb/linux/constants.py
> In file included from ./include/linux/mm.h:68:0,
>                  from ./include/linux/suspend.h:8,
>                  from arch/x86/kernel/asm-offsets.c:12:
> ./arch/x86/include/asm/pgtable.h:66:26: error: redefinition of
> =E2=80=98native_pud_clear=E2=80=99
>  #define pud_clear(pud)   native_pud_clear(pud)
>                           ^
> ./arch/x86/include/asm/pgtable-3level.h:128:20: note: in expansion of
> macro =E2=80=98pud_clear=E2=80=99
>  static inline void pud_clear(pud_t *pudp)
>                     ^
> In file included from ./arch/x86/include/asm/pgtable_32.h:44:0,
>                  from ./arch/x86/include/asm/pgtable.h:581,
>                  from ./include/linux/mm.h:68,
>                  from ./include/linux/suspend.h:8,
>                  from arch/x86/kernel/asm-offsets.c:12:
> ./arch/x86/include/asm/pgtable-3level.h:124:20: note: previous
> definition of =E2=80=98native_pud_clear=E2=80=99 was here
>  static inline void native_pud_clear(pud_t *pudp)
>                     ^
> make[1]: *** [Kbuild:82: arch/x86/kernel/asm-offsets.s] Error 1
> make: *** [Makefile:1033: prepare0] Error 2
>
> real 0m10.637s
> user 0m9.466s
> sys 0m2.752s

Seems like it's related to "mm, x86: add support for PUD-sized
transparent hugepages".

-Kees

--=20
Kees Cook
Pixel Security
