From: David Herrmann <dh.herrmann@gmail.com>
Subject: Re: samples/kdbus/kdbus-workers.c and cross compiling MIPS
Date: Thu, 30 Jul 2015 16:23:52 +0200
Message-ID: <CANq1E4S7awCfPaNduoG8ENHmnGhR7-VT-9LvGwREZs-h8zNmzQ@mail.gmail.com>
References: <20150729161912.GF18685@windriver.com>
	<CANq1E4TgWK-8JkUtOYfTOL9Dx=jWeVpA-h881TXSA3BNjp+MPw@mail.gmail.com>
	<55BA2B91.5070107@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55BA2B91.5070107@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: David Herrmann <dh.herrmann@googlemail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Mack <daniel@zonque.org>, Djalal Harouni <tixxdz@opendz.org>, linux-mips@linux-mips.org, linux-kernel <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi

On Thu, Jul 30, 2015 at 3:50 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> On 2015-07-29 12:31 PM, David Herrmann wrote:
>> Hi
>>
>> On Wed, Jul 29, 2015 at 6:19 PM, Paul Gortmaker
>> <paul.gortmaker@windriver.com> wrote:
>>> Hi David,
>>>
>>> Does it make sense to build this sample when cross compiling?
>>>
>>> The reason I ask is that it has been breaking the linux-next build =
of
>>> allmodconfig for a while now, with:
>>>
>>>   HOSTCC  samples/kdbus/kdbus-workers
>>> samples/kdbus/kdbus-workers.c: In function =E2=80=98prime_new=E2=80=
=99:
>>> samples/kdbus/kdbus-workers.c:934:18: error: =E2=80=98__NR_memfd_cr=
eate=E2=80=99 undeclared (first use in this function)
>>>   p->fd =3D syscall(__NR_memfd_create, "prime-area", MFD_CLOEXEC);
>>>                   ^
>>> samples/kdbus/kdbus-workers.c:934:18: note: each undeclared identif=
ier is reported only once for each function it appears in
>>> scripts/Makefile.host:91: recipe for target 'samples/kdbus/kdbus-wo=
rkers' failed
>>> make[2]: *** [samples/kdbus/kdbus-workers] Error 1
>>
>> mips does have this syscall, so I assume the problem is out-of-date
>> kernel headers. You can fix this by running:
>>
>>     $ make headers_install
>
> No, let me try and clarify. Please note the emphasis on cross compili=
ng
> and automated build coverage, i.e. there is no place for manual steps=
=2E

User-space samples in ./samples/ are compiled with HOSTCC, which is
the compiler for the _local_ machine. Regardless of cross-compiling
the same local compiler is used. So I cannot understand why this is
even remotely related to cross compiling. Please elaborate.
Please note that this is HOSTCC running, so it does *NOT* require the
toolchain for your cross-compiled architecture.

Also, please tell me why your system has "linux/memfd.h" available,
but __NR_memfd_create is undefined?

Anyway, patch is attached. Can you verify it works?
David

diff --git a/samples/kdbus/Makefile b/samples/kdbus/Makefile
index 137f842..dbd9de8 100644
--- a/samples/kdbus/Makefile
+++ b/samples/kdbus/Makefile
@@ -1,9 +1,13 @@
 # kbuild trick to avoid linker error. Can be omitted if a module is bu=
ilt.
 obj- :=3D dummy.o

+ifndef CROSS_COMPILE
+
 hostprogs-$(CONFIG_SAMPLE_KDBUS) +=3D kdbus-workers

 always :=3D $(hostprogs-y)

 HOSTCFLAGS_kdbus-workers.o +=3D -I$(objtree)/usr/include
 HOSTLOADLIBES_kdbus-workers :=3D -lrt
+
+endif
