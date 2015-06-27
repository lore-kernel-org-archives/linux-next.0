From: Guenter Roeck <private@roeck-us.net>
Subject: Re: arc build failures in -next due to ARCv2 patch
Date: Sat, 27 Jun 2015 07:16:23 -0700
Message-ID: <558EB037.1030308@roeck-us.net>
References: <558DE739.4020804@roeck-us.net> <C2D7FE5348E1B147BCA15975FBA23075665A8A84@IN01WEMBXB.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:50822 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752544AbbF0OQc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 27 Jun 2015 10:16:32 -0400
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075665A8A84@IN01WEMBXB.internal.synopsys.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Cc: "arc-linux-dev@synopsys.com" <arc-linux-dev@synopsys.com>

Hi Vineet,

On 06/27/2015 04:42 AM, Vineet Gupta wrote:
> hi,
>
> Sorry for top posting / html - web client access from home.
Another Microsoft victim ? That is why I dislike sending e-mail
from my company account.

> Thx for reporting the issue - I have pushed a fix (also attached) whi=
ch shd cure it (don't have exactly similar oldish gcc at hand).

Not that old, really, it just isn't configured for ARCv2. Question is i=
f I need two
separate compilers or if I can configure it to support both v1 and v2.

> This slipped thru the cracks as newer gcc for legacy ARCompact can st=
ill tolerate the new toggles.

Something like the following would avoid the ifdef in the Makefile and =
also check if the option
is supported by the compiler.

config ARC_NO_LL64
     default y
     depends on !ARC_HAS_LL64 && ISA_ARCV2

=2E..

cflags-$(CONFIG_ARC_NO_LL64) +=3D $(call cc-option, -mno-ll64)


Your patch uses ${} instead of $() - does the make command accept/under=
stand that ?

> I will get back to you on Monday about how to go about including supp=
ort for a newer gcc for ARCv2 build test as well.
Looking forward to it, though I hope I can just built a toolchain for H=
S38.

After applying your patch, I get

arch/arc/kernel/process.c: In function =91arch_cpu_idle=92:
arch/arc/kernel/process.c:51:26: error: =91ARCV2_IRQ_DEF_PRIO=92 undecl=
ared (first use in this function)
    const int arg =3D 0x10 | ARCV2_IRQ_DEF_PRIO;
                                       ^

Thanks,
Guenter

> Thx,
> -Vineet
> ________________________________________
> From: Guenter Roeck [private@roeck-us.net]
> Sent: Saturday, June 27, 2015 5:28 AM
> To: linux-next@vger.kernel.org
> Cc: Vineet Gupta
> Subject: arc build failures in -next due to ARCv2 patch
>
> Hi,
>
> my arc test builds in -next now fail with
>
> cc1: error: unrecognized command line option "-mno-ll64"
> make[2]: *** [scripts/mod/empty.o] Error 1
> make[1]: *** [scripts/mod] Error 2
> make[1]: *** Waiting for unfinished jobs....
> cc1: error: unrecognized command line option "-mno-ll64"
> make[1]: *** [kernel/bounds.s] Error 1
>
> due to commit 'ARCv2: Support for ARCv2 ISA and HS38x cores'.
>
> This is with gcc 4.8.3 built from buildroot.
>
> Do I now need a new compiler / toolchain to build the kernel ?
> Any chance to make this change compatible to work with older
> compilers ?
>
> Thanks,
> Guenter
>
