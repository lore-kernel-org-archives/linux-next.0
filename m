From: Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Date: Thu, 11 Oct 2018 19:18:55 -0700
Message-ID: <CAGXu5jKVnDhu5sv+K+W=AWg0BqtTfoK9=1m6u-0dpDxP9ow74Q@mail.gmail.com>
References: <20181012131444.605564b5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181012131444.605564b5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

On Thu, Oct 11, 2018 at 7:14 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the tip tree got a conflict in:
>
>   arch/x86/mm/pgtable.c
>
> between commit:
>
>   184d47f0fd36 ("x86/mm: Avoid VLA in pgd_alloc()")
>
> from Linus' tree and commit:
>
>   1be3f247c288 ("x86/mm: Avoid VLA in pgd_alloc()")
>
> from the tip tree.
>
> I fixed it up (I used the version from Linus' tree) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.

Ingo, it looks like that commit needs to be split up again ... Linus's
tree still needs the fix for the fix?

-Kees

>
> --
> Cheers,
> Stephen Rothwell



-- 
Kees Cook
Pixel Security
