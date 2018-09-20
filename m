From: Rob Herring <robh@kernel.org>
Subject: Re: linux-next: Tree for Sep 20
Date: Thu, 20 Sep 2018 07:02:30 -0700
Message-ID: <CAL_JsqLRRCdOWABiTYHp7jupdiLfPRv95OSKWVB-HX=cevdQMg@mail.gmail.com>
References: <20180920151243.5524c6ca@canb.auug.org.au> <87d0t8jvym.fsf@concordia.ellerman.id.au>
 <20180920210711.4561abee@canb.auug.org.au> <20180920211755.1fabd744@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180920211755.1fabd744@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michael Ellerman <mpe@ellerman.id.au>, linux-next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Sep 20, 2018 at 4:18 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Michael,
>
> On Thu, 20 Sep 2018 21:10:08 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Thu, 20 Sep 2018 20:37:37 +1000 Michael Ellerman <mpe@ellerman.id.au> wrote:
> > >
> > > Oodles of:
> > >
> > >   # < make -s -j 48 ARCH=arm64 O=/kisskb/build/linux-next_arm64-allnoconfig_arm64 CROSS_COMPILE=/opt/cross/kisskb/br-aarch64-glibc-2016.08-613-ge98b4dd/bin/aarch64-linux-  allnoconfig
> > >   # make -s -j 48 ARCH=arm64 O=/kisskb/build/linux-next_arm64-allnoconfig_arm64 CROSS_COMPILE=/opt/cross/kisskb/br-aarch64-glibc-2016.08-613-ge98b4dd/bin/aarch64-linux-
> > >   /bin/sh: 1: pkg-config: not found
>       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> > don't have it installed on my build machine either ...  do we have
> > pkg-config installed in the build images?
>
> Duh! ;-)
>
> According to the commit message we gained a kconfig dependency on
> pkg-config in 4.18.  I wonder what else depends on it.
>
> Ah:
>
> "pkg-config
> ----------
>
> The build system, as of 4.18, requires pkg-config to check for installed
> kconfig tools and to determine flags settings for use in
> 'make {g,x}config'.  Previously pkg-config was being used but not
> verified or documented."

Looks like until a recent commit, this also included nconfig and
menuconfig, but those were dropped after some complaints. I'll rework
this to make things work with pkg-config.

Rob
