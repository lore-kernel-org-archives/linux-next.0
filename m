From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Date: Fri, 12 Oct 2018 12:47:44 +0200
Message-ID: <20181012104744.GA105548@gmail.com>
References: <20181012131444.605564b5@canb.auug.org.au>
 <CAGXu5jKVnDhu5sv+K+W=AWg0BqtTfoK9=1m6u-0dpDxP9ow74Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGXu5jKVnDhu5sv+K+W=AWg0BqtTfoK9=1m6u-0dpDxP9ow74Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>
Cc: Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org


* Kees Cook <keescook@chromium.org> wrote:

> On Thu, Oct 11, 2018 at 7:14 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi all,
> >
> > Today's linux-next merge of the tip tree got a conflict in:
> >
> >   arch/x86/mm/pgtable.c
> >
> > between commit:
> >
> >   184d47f0fd36 ("x86/mm: Avoid VLA in pgd_alloc()")
> >
> > from Linus' tree and commit:
> >
> >   1be3f247c288 ("x86/mm: Avoid VLA in pgd_alloc()")
> >
> > from the tip tree.
> >
> > I fixed it up (I used the version from Linus' tree) and can carry the
> > fix as necessary. This is now fixed as far as linux-next is concerned,
> > but any non trivial conflicts should be mentioned to your upstream
> > maintainer when your tree is submitted for merging.  You may also want
> > to consider cooperating with the maintainer of the conflicting tree to
> > minimise any particularly complex conflicts.

This is the correct resolution, thanks Stephen!

> Ingo, it looks like that commit needs to be split up again ... Linus's
> tree still needs the fix for the fix?

-next still had the old commit, I've now refreshed tip:auto-latest so the
conflict should go away in the next iteration.

Linus's tree has the correct fix.

Thanks,

	Ingo
