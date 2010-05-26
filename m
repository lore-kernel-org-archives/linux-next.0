From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: linux-next: build warning in Linus'tree
Date: Wed, 26 May 2010 19:31:06 +0200
Message-ID: <OFE9F7159D.A4D62F91-ONC125772F.005CB786-C125772F.00603B6C@transmode.se>
References: <20100526110506.f2f4f22c.sfr@canb.auug.org.au> <20100525182040.f1882d0a.akpm@linux-foundation.org> <20100526140900.5b091c16.sfr@canb.auug.org.au> <OFC00BDFAC.5596A841-ONC125772F.0022984D-C125772F.0023AF14@transmode.se> <20100525234116.71889c71.akpm@linux-foundation.org> <20100526171424.447fac18.sfr@canb.auug.org.au> <OFE5212A1C.B62E8E51-ONC125772F.00371EE7-C125772F.0038EEC8@transmode.se> <alpine.LFD.2.00.1005260828320.3689@i5.linux-foundation.org> <OF6B2D521C.109F3133-ONC125772F.00576DF0-C125772F.005B18F3@transmode.se> <alpine.LFD.2.00.1005260939030.3689@i5.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.00.1005260939030.3689@i5.linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

Linus Torvalds <torvalds@linux-foundation.org> wrote on 2010/05/26 18:46:11:
>
> On Wed, 26 May 2010, Joakim Tjernlund wrote:
> >
> > 1) It silently breaks when neither of {__LITTLE_,__BIG}_ENDIAN (or both)are
> >    defined depending on the endianess of the target CPU.
> >    The glibc model generates a compile error if you forget to include __BYTE_ORDER.
>
> Umm. Except when it doesn't (yes, Linux has the "Wundefined" thing, and
> has had for a long time). I've seen the glibc model do the wrong thing
> exactly because traditional C semantics is "undefined symbol is 0 in
> evaluations"
>
> Try compiling this
>
>    #include <stdio.h>
>
>    #if NOT_HERE == NOT_THERE
>    int main()
>    {
>       printf("Hello world!\n");
>    }
>    #endif
>
> and even with -Wall it compiles perfectly happily.

Ouch! But here -Wundef really helps.

>
> So no. The glibc model is _not_ any better in practice.

In the kernel it is since it breaks the compile. The breakage
my patch introduced is a sign of that, right?

>
> > 2) It clashes with user space so one cannot use it in exported header files.
>
> Which is annoying, I agree. But you shouldn't generally use kernel headers
> for user space anyway, much less export anything that is byteorder-

Not in general, but my case could have been avoided, I sure there are others
too. Why else does some header files bother with __BYTE_ORDER?

> specific. So anybody who has this problem is likely doing something iffy
> to begin with.

hmm, so then I guess the existing use of __BYTE_ORDER in the
kernel should be removed?

>
> Besides, you can solve it cleanly by simply avoiding the crazy glibc
> semantics entirely. IOW, the CONFIG_BIG_ENDIAN option I suggested (and

CONFIG_BIG_ENDIAN would have helped me with my lib/crc32.c problem
but it does not prevent silent breakage so I figured the glibc model
would be better.
Is it such a big difference, readability wise, between
  #ifdef CONFIG_BIG_ENDIAN
and
  #if __BYTE_ORDER == __BIG_ENDIAN
that you rather risk silent breakage?

> again, you should damn well not export things that depend on it to user
> space - there are architectures where user-space might be switchable)

Such arch exists but does any of them run linux in both modes?

  Jocke
