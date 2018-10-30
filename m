From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: linux-next: manual merge of the compiler-attributes tree with the
 kbuild tree
Date: Tue, 30 Oct 2018 12:21:52 +0100
Message-ID: <CANiq72k2w2T0Cy0D--OEmE+sOPkjZtXpukBm+Mz1_xY6MCGg0A@mail.gmail.com>
References: <20181030104637.382c26d0@canb.auug.org.au> <20181030104941.4fef7dad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181030104941.4fef7dad@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, changbin.du@gmail.com
List-Id: linux-next.vger.kernel.org

On Tue, Oct 30, 2018 at 12:49 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Tue, 30 Oct 2018 10:46:37 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the compiler-attributes tree got a conflict
> > in:
> >
> >   include/linux/compiler-gcc.h
> >
> > between commit:
> >
> >   94c7dfd01652 ("kernel hacking: support building kernel with -Og optimization level")
> >
> > from the kbuild tree and commits:
> >
> >   5c67a52f3da0 ("Compiler Attributes: always use the extra-underscores syntax")
> >   989bd5000f36 ("Compiler Attributes: remove unneeded sparse (__CHECKER__) tests")
> >
> > from the compiler-attributes tree.
> >
> > I fixed it up (the latter just removed the __CHECKER__ check, so I did
> > that) and can carry the fix as necessary. This is now fixed as far as
>
> On reflection, that may not have been the correct resolution ...

>From a quick look, it seems we want:

#ifndef CONFIG_CC_OPTIMIZE_FOR_DEBUGGING
#define __compiletime_warning(message) __attribute__((__warning__(message)))
#define __compiletime_error(message) __attribute__((__error__(message)))
#endif

i.e. kbuild tree added the CONFIG_CC_OPTIMIZE_FOR_DEBUGGING guard,
while the compiler-attributes tree removed the __CHECKER__ one, so we
still need the former.

By the way, I think 94c7dfd01652 is wrong: it changes the guard also
for __latent_entropy (and it does not change the corresponding comment
at "#endif /* __CHECKER__ */").

Also, the commit message does not mention __compiletime_warning --
should that one be guarded too by CONFIG_CC_OPTIMIZE_FOR_DEBUGGING?

Cheers,
Miguel
