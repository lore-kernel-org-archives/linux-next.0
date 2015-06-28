From: Vineet Gupta <vineetg76@gmail.com>
Subject: Re: arc build failures in -next due to ARCv2 patch
Date: Sun, 28 Jun 2015 20:46:19 +0530
Message-ID: <55900FC3.8040101@gmail.com>
References: <558DE739.4020804@roeck-us.net> <C2D7FE5348E1B147BCA15975FBA23075665A8A84@IN01WEMBXB.internal.synopsys.com> <558EB037.1030308@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:33749 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752587AbbF1PQZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 28 Jun 2015 11:16:25 -0400
Received: by padev16 with SMTP id ev16so92328822pad.0
        for <linux-next@vger.kernel.org>; Sun, 28 Jun 2015 08:16:25 -0700 (PDT)
In-Reply-To: <558EB037.1030308@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <private@roeck-us.net>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Cc: "arc-linux-dev@synopsys.com" <arc-linux-dev@synopsys.com>

On Saturday 27 June 2015 07:46 PM, Guenter Roeck wrote:
> Hi Vineet,
>=20
> On 06/27/2015 04:42 AM, Vineet Gupta wrote:
>> hi,
>>
>> Sorry for top posting / html - web client access from home.
> Another Microsoft victim ? That is why I dislike sending e-mail
> from my company account.

Now trying personal email - hopefully this comes out ok.


>> Thx for reporting the issue - I have pushed a fix (also attached) wh=
ich shd cure
>> it (don't have exactly similar oldish gcc at hand).
>=20
> Not that old, really, it just isn't configured for ARCv2. Question is=
 if I need two
> separate compilers or if I can configure it to support both v1 and v2=
=2E

The compiler itself can support both - however issue is multilib'ing / =
libgcc. The
elf32 compiler is multilib'ed - but we've been using the uclibc compile=
r (with
just the right toggles) to build the kernel as well (to avoid having to=
 use 2
toolchains for kernel / user etc).

long story short - ATM, we need 2 different compilers to build legacy A=
RCompact,
and newer ARCv2.


>> This slipped thru the cracks as newer gcc for legacy ARCompact can s=
till
>> tolerate the new toggles.
>=20
> Something like the following would avoid the ifdef in the Makefile an=
d also check
> if the option
> is supported by the compiler.
>=20
> config ARC_NO_LL64
>     default y
>     depends on !ARC_HAS_LL64 && ISA_ARCV2
>=20
> ...
>=20
> cflags-$(CONFIG_ARC_NO_LL64) +=3D $(call cc-option, -mno-ll64)

OK - we can do a future sweep of makefile to change other such ifdefs.
=46or now please use a simpler fix.

>=20
>=20
> Your patch uses ${} instead of $() - does the make command accept/und=
erstand that ?


/me slaps myself - I mindlessly applied an existing broken pattern to f=
ix this.
That is now fixed as well 2 other makefile constructs which were broken=
 in similar
way.

>=20
>> I will get back to you on Monday about how to go about including sup=
port for a
>> newer gcc for ARCv2 build test as well.
> Looking forward to it, though I hope I can just built a toolchain for=
 HS38.
>=20
> After applying your patch, I get
>=20
> arch/arc/kernel/process.c: In function =91arch_cpu_idle=92:
> arch/arc/kernel/process.c:51:26: error: =91ARCV2_IRQ_DEF_PRIO=92 unde=
clared (first use
> in this function)
>    const int arg =3D 0x10 | ARCV2_IRQ_DEF_PRIO;
>                =20

Yep, sorry for lousy work, there are bits n pieces moved from our inter=
nal 3.18 to
4.1-X for upstreaming - hence the wreckage of transition.

=46ixed that and 2 commits pushed after verifying both configs build an=
d boot on
simulator.

Thx,
-Vineet

                      ^
>=20
> Thanks,
> Guenter
>=20
>> Thx,
>> -Vineet
>> ________________________________________
>> From: Guenter Roeck [private@roeck-us.net]
>> Sent: Saturday, June 27, 2015 5:28 AM
>> To: linux-next@vger.kernel.org
>> Cc: Vineet Gupta
>> Subject: arc build failures in -next due to ARCv2 patch
>>
>> Hi,
>>
>> my arc test builds in -next now fail with
>>
>> cc1: error: unrecognized command line option "-mno-ll64"
>> make[2]: *** [scripts/mod/empty.o] Error 1
>> make[1]: *** [scripts/mod] Error 2
>> make[1]: *** Waiting for unfinished jobs....
>> cc1: error: unrecognized command line option "-mno-ll64"
>> make[1]: *** [kernel/bounds.s] Error 1
>>
>> due to commit 'ARCv2: Support for ARCv2 ISA and HS38x cores'.
>>
>> This is with gcc 4.8.3 built from buildroot.
>>
>> Do I now need a new compiler / toolchain to build the kernel ?
>> Any chance to make this change compatible to work with older
>> compilers ?
>>
>> Thanks,
>> Guenter
>>
>=20
