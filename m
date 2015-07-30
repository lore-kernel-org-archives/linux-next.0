From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: samples/kdbus/kdbus-workers.c and cross compiling MIPS
Date: Thu, 30 Jul 2015 11:32:05 -0400
Message-ID: <55BA4375.7010400@windriver.com>
References: <20150729161912.GF18685@windriver.com>	<CANq1E4TgWK-8JkUtOYfTOL9Dx=jWeVpA-h881TXSA3BNjp+MPw@mail.gmail.com>	<55BA2B91.5070107@windriver.com> <CANq1E4S7awCfPaNduoG8ENHmnGhR7-VT-9LvGwREZs-h8zNmzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:60526 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751289AbbG3Pca (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Jul 2015 11:32:30 -0400
In-Reply-To: <CANq1E4S7awCfPaNduoG8ENHmnGhR7-VT-9LvGwREZs-h8zNmzQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Herrmann <dh.herrmann@gmail.com>
Cc: David Herrmann <dh.herrmann@googlemail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Mack <daniel@zonque.org>, Djalal Harouni <tixxdz@opendz.org>, linux-mips@linux-mips.org, linux-kernel <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On 2015-07-30 10:23 AM, David Herrmann wrote:
> Hi
>=20
> On Thu, Jul 30, 2015 at 3:50 PM, Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
>> On 2015-07-29 12:31 PM, David Herrmann wrote:
>>> Hi
>>>
>>> On Wed, Jul 29, 2015 at 6:19 PM, Paul Gortmaker
>>> <paul.gortmaker@windriver.com> wrote:
>>>> Hi David,
>>>>
>>>> Does it make sense to build this sample when cross compiling?
>>>>
>>>> The reason I ask is that it has been breaking the linux-next build=
 of
>>>> allmodconfig for a while now, with:
>>>>
>>>>   HOSTCC  samples/kdbus/kdbus-workers
>>>> samples/kdbus/kdbus-workers.c: In function =E2=80=98prime_new=E2=80=
=99:
>>>> samples/kdbus/kdbus-workers.c:934:18: error: =E2=80=98__NR_memfd_c=
reate=E2=80=99 undeclared (first use in this function)
>>>>   p->fd =3D syscall(__NR_memfd_create, "prime-area", MFD_CLOEXEC);
>>>>                   ^
>>>> samples/kdbus/kdbus-workers.c:934:18: note: each undeclared identi=
fier is reported only once for each function it appears in
>>>> scripts/Makefile.host:91: recipe for target 'samples/kdbus/kdbus-w=
orkers' failed
>>>> make[2]: *** [samples/kdbus/kdbus-workers] Error 1
>>>
>>> mips does have this syscall, so I assume the problem is out-of-date
>>> kernel headers. You can fix this by running:
>>>
>>>     $ make headers_install
>>
>> No, let me try and clarify. Please note the emphasis on cross compil=
ing
>> and automated build coverage, i.e. there is no place for manual step=
s.
>=20
> User-space samples in ./samples/ are compiled with HOSTCC, which is
> the compiler for the _local_ machine. Regardless of cross-compiling
> the same local compiler is used. So I cannot understand why this is
> even remotely related to cross compiling. Please elaborate.

Well, it only shows up when we cross compile for mips.  It does not
seem to be showing up for any other arch (and we cover ~10 of them).
Nor does it show up for x86 builds.  Also note that the main linux-next
build machine is actually a PowerPC host.

> Please note that this is HOSTCC running, so it does *NOT* require the
> toolchain for your cross-compiled architecture.
>=20
> Also, please tell me why your system has "linux/memfd.h" available,
> but __NR_memfd_create is undefined?

My local system is a bog standard ubuntu 14.10 and it sees it.  I dont
know what distro the linux-next IBM powerpc builder is based on but it
also sees it....

Here is what V=3D1 output looks like:

(cat /dev/null; ) > samples/kdbus/modules.order
  gcc -Wp,-MD,samples/kdbus/.kdbus-workers.d -Wall -Wmissing-prototypes=
 -Wstrict-prototypes -O2 -fomit-frame-pointer -std=3Dgnu89    -I./usr/i=
nclude -o samples/kdbus/kdbus-workers samples/kdbus/kdbus-workers.c  -l=
rt
samples/kdbus/kdbus-workers.c: In function =E2=80=98prime_new=E2=80=99:
samples/kdbus/kdbus-workers.c:934:18: error: =E2=80=98__NR_memfd_create=
=E2=80=99 undeclared (first use in this function)
  p->fd =3D syscall(__NR_memfd_create, "prime-area", MFD_CLOEXEC);
                  ^
samples/kdbus/kdbus-workers.c:934:18: note: each undeclared identifier =
is reported only once for each function it appears in
scripts/Makefile.host:91: recipe for target 'samples/kdbus/kdbus-worker=
s' failed
make[2]: *** [samples/kdbus/kdbus-workers] Error 1
scripts/Makefile.build:403: recipe for target 'samples/kdbus' failed
make[1]: *** [samples/kdbus] Error 2
Makefile:1569: recipe for target 'samples/' failed
make: *** [samples/] Error 2

and here is what is in ./usr/include:

paul@yow-lpgnfs-02:~/git/linux-head$ grep -R __NR_memfd_create ./usr/in=
clude/
=2E/usr/include/asm-generic/unistd.h:#define __NR_memfd_create 279
=2E/usr/include/asm-generic/unistd.h:__SYSCALL(__NR_memfd_create, sys_m=
emfd_create)
=2E/usr/include/asm/unistd.h:#define __NR_memfd_create            (__NR=
_Linux + 354)
=2E/usr/include/asm/unistd.h:#define __NR_memfd_create            (__NR=
_Linux + 314)
=2E/usr/include/asm/unistd.h:#define __NR_memfd_create            (__NR=
_Linux + 318)
paul@yow-lpgnfs-02:~/git/linux-head$=20

=2E.so it is in there, but presumably something wrt mips ifdeffery
means it is thrown out by cpp.

>=20
> Anyway, patch is attached. Can you verify it works?

Yes, after I fixed up the mangling from it being sent as
quoted-printable, it fixes the issue; or at least avoids it.

Tested-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Thanks,
Paul.
--

> David
>=20
> diff --git a/samples/kdbus/Makefile b/samples/kdbus/Makefile
> index 137f842..dbd9de8 100644
> --- a/samples/kdbus/Makefile
> +++ b/samples/kdbus/Makefile
> @@ -1,9 +1,13 @@
>  # kbuild trick to avoid linker error. Can be omitted if a module is =
built.
>  obj- :=3D dummy.o
>=20
> +ifndef CROSS_COMPILE
> +
>  hostprogs-$(CONFIG_SAMPLE_KDBUS) +=3D kdbus-workers
>=20
>  always :=3D $(hostprogs-y)
>=20
>  HOSTCFLAGS_kdbus-workers.o +=3D -I$(objtree)/usr/include
>  HOSTLOADLIBES_kdbus-workers :=3D -lrt
> +
> +endif
>=20
