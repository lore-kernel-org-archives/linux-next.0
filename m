From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: samples/kdbus/kdbus-workers.c and cross compiling MIPS
Date: Thu, 30 Jul 2015 09:50:09 -0400
Message-ID: <55BA2B91.5070107@windriver.com>
References: <20150729161912.GF18685@windriver.com> <CANq1E4TgWK-8JkUtOYfTOL9Dx=jWeVpA-h881TXSA3BNjp+MPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:64964 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752603AbbG3Nuc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Jul 2015 09:50:32 -0400
In-Reply-To: <CANq1E4TgWK-8JkUtOYfTOL9Dx=jWeVpA-h881TXSA3BNjp+MPw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Herrmann <dh.herrmann@gmail.com>
Cc: David Herrmann <dh.herrmann@googlemail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Mack <daniel@zonque.org>, Djalal Harouni <tixxdz@opendz.org>, linux-mips@linux-mips.org, linux-kernel <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On 2015-07-29 12:31 PM, David Herrmann wrote:
> Hi
>=20
> On Wed, Jul 29, 2015 at 6:19 PM, Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
>> Hi David,
>>
>> Does it make sense to build this sample when cross compiling?
>>
>> The reason I ask is that it has been breaking the linux-next build o=
f
>> allmodconfig for a while now, with:
>>
>>   HOSTCC  samples/kdbus/kdbus-workers
>> samples/kdbus/kdbus-workers.c: In function =E2=80=98prime_new=E2=80=99=
:
>> samples/kdbus/kdbus-workers.c:934:18: error: =E2=80=98__NR_memfd_cre=
ate=E2=80=99 undeclared (first use in this function)
>>   p->fd =3D syscall(__NR_memfd_create, "prime-area", MFD_CLOEXEC);
>>                   ^
>> samples/kdbus/kdbus-workers.c:934:18: note: each undeclared identifi=
er is reported only once for each function it appears in
>> scripts/Makefile.host:91: recipe for target 'samples/kdbus/kdbus-wor=
kers' failed
>> make[2]: *** [samples/kdbus/kdbus-workers] Error 1
>=20
> mips does have this syscall, so I assume the problem is out-of-date
> kernel headers. You can fix this by running:
>=20
>     $ make headers_install

No, let me try and clarify. Please note the emphasis on cross compiling
and automated build coverage, i.e. there is no place for manual steps.

On kernel.org there are x86 host binaries that allow a person to build
a kernel for nearly every arch:

https://www.kernel.org/pub/tools/crosstool/

These exist so developers doing treewide changes can test that their
work does not break s390 or powerpc, or ....

However, in the interest of simplicity, these compilers are created
such that they can build the self contained kernel only.  They do not
have all the headers and libc stuff needed to compile and link an
actual s390 or powerpc userspace -- for that you'd need a full sysroot.

And this is fine for 99.9% of stuff.   And it was fine for the automate=
d
builds of the linux-next tree for the MIPS architecture and the=20
allmodconfig target prior to the kdbus inclusion.

And I really don't need a s390 or powerpc sample program, hence why
I suggested we skip it when cross compiling, just like the other
commits I quoted.

The implicit rule with linux-next (and linux in general) is essentially
"You broke it, you get to fix it."   So either skipping this in the
Makefile when cross compiling, or working with Michael and the linux-ne=
xt
team to have their builders somehow skip it needs to be done by the
kdbus team.

Thanks,
Paul.
--

>=20
> This will put the sanitized headers in your local kernel tree
> "./usr/". This is preferred over "/usr" as include path for the kerne=
l
> examples, hence, everything should work fine then.
>=20
> The kernel samples/ directory is explicitly used for example programs
> for the kernel. Hence, I think it is quite fine to use new kernel
> features. Same applies to the selftests.
>=20
> I'd be fine making kdbus-workers a no-op program if __NR_memfd_create
> is not defined. But I'm not really sure that fixes real problems. I
> mean, new samples and selftests will be added by other subsystems and
> those might as well require new kernel headers.
>=20
> Thanks
> David
>=20
