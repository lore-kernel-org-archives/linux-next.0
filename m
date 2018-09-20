From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: Tree for Sep 20
Date: Thu, 20 Sep 2018 20:37:37 +1000
Message-ID: <87d0t8jvym.fsf@concordia.ellerman.id.au>
References: <20180920151243.5524c6ca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180920151243.5524c6ca@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, robh@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Changes since 20180919:
>
> Dropped trees: xarray, ida (temporarily)
>
> The input-current tree lost its build failure.
>
> I still disabled building some samples in the vfs tree.
>
> Non-merge commits (relative to Linus' tree): 4279
>  4792 files changed, 166265 insertions(+), 93138 deletions(-)

Oodles of:

  # < make -s -j 48 ARCH=arm64 O=/kisskb/build/linux-next_arm64-allnoconfig_arm64 CROSS_COMPILE=/opt/cross/kisskb/br-aarch64-glibc-2016.08-613-ge98b4dd/bin/aarch64-linux-  allnoconfig
  # make -s -j 48 ARCH=arm64 O=/kisskb/build/linux-next_arm64-allnoconfig_arm64 CROSS_COMPILE=/opt/cross/kisskb/br-aarch64-glibc-2016.08-613-ge98b4dd/bin/aarch64-linux-  
  /bin/sh: 1: pkg-config: not found
  make[3]: pkg-config: Command not found
  /kisskb/src/scripts/dtc/yamltree.c:23:10: fatal error: yaml.h: No such file or directory
   #include <yaml.h>
            ^~~~~~~~
  compilation terminated.
  make[3]: *** [scripts/Makefile.host:107: scripts/dtc/yamltree.o] Error 1
  make[3]: *** Waiting for unfinished jobs....
  make[2]: *** [/kisskb/src/scripts/Makefile.build:536: scripts/dtc] Error 2
  make[2]: *** Waiting for unfinished jobs....
  make[1]: *** [/kisskb/src/Makefile:1067: scripts] Error 2
  make: *** [Makefile:146: sub-make] Error 2

http://kisskb.ellerman.id.au/kisskb/head/a0cb0cabe4bbeacf5ed9e81a41abcbae47ba925a/


I guess we've got a yaml dependency now?

cheers
