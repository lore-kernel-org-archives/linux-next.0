From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: linux-next: manual merge of the compiler-attributes tree with the
 kbuild tree
Date: Wed, 31 Oct 2018 00:53:08 +0900
Message-ID: <CAK7LNARsV=GbwERyy_TViiYB_Go1GqYC2_GNbtvhoArSo1zgsg@mail.gmail.com>
References: <20181030104637.382c26d0@canb.auug.org.au> <20181030104941.4fef7dad@canb.auug.org.au>
 <CANiq72k2w2T0Cy0D--OEmE+sOPkjZtXpukBm+Mz1_xY6MCGg0A@mail.gmail.com> <20181030150412.peayixjav2lvbp4s@mail.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181030150412.peayixjav2lvbp4s@mail.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Changbin Du <changbin.du@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Oct 31, 2018 at 12:06 AM Changbin Du <changbin.du@gmail.com> wrote:
>
> On Tue, Oct 30, 2018 at 12:21:52PM +0100, Miguel Ojeda wrote:
> > On Tue, Oct 30, 2018 at 12:49 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Hi all,
> > >
> > > On Tue, 30 Oct 2018 10:46:37 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > Today's linux-next merge of the compiler-attributes tree got a conflict
> > > > in:
> > > >
> > > >   include/linux/compiler-gcc.h
> > > >
> > > > between commit:
> > > >
> > > >   94c7dfd01652 ("kernel hacking: support building kernel with -Og optimization level")
> > > >
> > > > from the kbuild tree and commits:
> > > >
> > > >   5c67a52f3da0 ("Compiler Attributes: always use the extra-underscores syntax")
> > > >   989bd5000f36 ("Compiler Attributes: remove unneeded sparse (__CHECKER__) tests")
> > > >
> > > > from the compiler-attributes tree.
> > > >
> > > > I fixed it up (the latter just removed the __CHECKER__ check, so I did
> > > > that) and can carry the fix as necessary. This is now fixed as far as
> > >
> > > On reflection, that may not have been the correct resolution ...
> >
> > From a quick look, it seems we want:
> >
> > #ifndef CONFIG_CC_OPTIMIZE_FOR_DEBUGGING
> > #define __compiletime_warning(message) __attribute__((__warning__(message)))
> > #define __compiletime_error(message) __attribute__((__error__(message)))
> > #endif
> >
> > i.e. kbuild tree added the CONFIG_CC_OPTIMIZE_FOR_DEBUGGING guard,
> > while the compiler-attributes tree removed the __CHECKER__ one, so we
> > still need the former.
> >
> > By the way, I think 94c7dfd01652 is wrong: it changes the guard also
> > for __latent_entropy (and it does not change the corresponding comment
> > at "#endif /* __CHECKER__ */").
> >
> > Also, the commit message does not mention __compiletime_warning --
> > should that one be guarded too by CONFIG_CC_OPTIMIZE_FOR_DEBUGGING?
> >
> To avoid future possible warning, __compiletime_warning should also be
> guarded. So I did the flow change so __latent_entropy is not affected.
>
> --- a/include/linux/compiler-gcc.h
> +++ b/include/linux/compiler-gcc.h
> @@ -85,9 +85,11 @@
>
>  #define __compiletime_object_size(obj) __builtin_object_size(obj, 0)
>
> -#if !defined(__CHECKER__) && !defined(CONFIG_CC_OPTIMIZE_FOR_DEBUGGING)
> +#if !defined(__CHECKER__)
> +#if !defined(CONFIG_CC_OPTIMIZE_FOR_DEBUGGING)
>  #define __compiletime_warning(message) __attribute__((warning(message)))
>  #define __compiletime_error(message) __attribute__((error(message)))
> +#endif
>
>  #ifdef LATENT_ENTROPY_PLUGIN
>  #define __latent_entropy __attribute__((latent_entropy))
>


OK, I locally fixed it up.

I hope it will be fine for tomorrow's linux-next

Thanks.

-- 
Best Regards
Masahiro Yamada
