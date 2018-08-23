From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: linux-next: build failure after merge of the kbuild tree
Date: Thu, 23 Aug 2018 18:03:19 +0900
Message-ID: <CAK7LNAShQCMvwo-s2hDy4AkJs4=gvpa7hR22s2hC969dRkaV-w@mail.gmail.com>
References: <20180823083552.6fd372af@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180823083552.6fd372af@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

2018-08-23 7:35 GMT+09:00 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi Masahiro,
>
> After merging the kbuild tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> ld: failed to merge target specific data of file drivers/input/mouse/alps.o
> ld: drivers/input/mouse/byd.o: compiled for a big endian system and target is little endian
> ld: failed to merge target specific data of file drivers/input/mouse/byd.o
>
> and many, many more like this.
>
> Sorry, I can't easily tell what caused this.
>
> I have used the kbuild tree from next-20180822 for today.



Sorry, will fix.

I missed to change link-vmlinux.sh




diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 4bf811c..c8cf453 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -75,7 +75,7 @@ modpost_link()
                ${KBUILD_VMLINUX_LIBS}                          \
                --end-group"

-       ${LD} ${LDFLAGS} -r -o ${1} ${objects}
+       ${LD} ${KBUILD_LDFLAGS} -r -o ${1} ${objects}
 }

 # Link of vmlinux
@@ -95,7 +95,7 @@ vmlinux_link()
                        --end-group                             \
                        ${1}"

-               ${LD} ${LDFLAGS} ${LDFLAGS_vmlinux} -o ${2}     \
+               ${LD} ${KBUILD_LDFLAGS} ${LDFLAGS_vmlinux} -o ${2}      \
                        -T ${lds} ${objects}
        else
                objects="-Wl,--whole-archive                    \



-- 
Best Regards
Masahiro Yamada
