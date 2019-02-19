From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the asm-generic tree
Date: Tue, 19 Feb 2019 11:14:44 +0100
Message-ID: <CAK8P3a0omA-__7MLAw_SKuug_GZ0FfFPVr1Tsnx5Hb0sesv8gw@mail.gmail.com>
References: <20190219173654.47e9bc36@canb.auug.org.au> <20190219074519.GA2294@behemoth.owl.eu.com.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219074519.GA2294@behemoth.owl.eu.com.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Hugo Lefeuvre <hle@owl.eu.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Feb 19, 2019 at 8:45 AM Hugo Lefeuvre <hle@owl.eu.com> wrote:
>
> Hi Stephen, Arnd,
>
> > After merging the asm-generic tree, today's linux-next build (powerpc
> > allnoconfig) failed like this:
> > ...
> > Caused by commit
> >
> >   8e074c243ed3 ("iomap: add missing const to ioread*/iowrite addr arg")
>
> I have prepared a patch addressing this issue, and am currently building it
> with a powerpc cross compiler. I'll submit it once it's done. Please tell
> me if I should update the initial patch instead.
>
> > The const qualifiers are also missing in:
> >
> > arch/parisc/lib/iomap.c
> > arch/sh/kernel/iomap.c
>
> I also have patches for these architectures, but it is more complicated for
> me to test them with a cross compiler. Should I still submit them?

I'm not sending a pull request for this if it breaks any architectures,
so I think we need to fix them all, and I suppose we also have to
change all architectures in the same patch that changes the architecture
independent declaration, so it doesn't break intermittently.

At this point, I'd probably drop your patches from my asm-generic
tree  entirely to avoid the regression, and wait for you to resend
them all after 5.1-rc1, for inclusion in 5.2.

Can you elaborate on the original problem that you saw? Maybe
we can have a different workaround for it in the meantime.

     Arnd
