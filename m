From: David Herrmann <dh.herrmann@gmail.com>
Subject: Re: samples/kdbus/kdbus-workers.c and cross compiling MIPS
Date: Wed, 29 Jul 2015 18:31:02 +0200
Message-ID: <CANq1E4TgWK-8JkUtOYfTOL9Dx=jWeVpA-h881TXSA3BNjp+MPw@mail.gmail.com>
References: <20150729161912.GF18685@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-la0-f51.google.com ([209.85.215.51]:34519 "EHLO
	mail-la0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750814AbbG2QbE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2015 12:31:04 -0400
In-Reply-To: <20150729161912.GF18685@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: David Herrmann <dh.herrmann@googlemail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Mack <daniel@zonque.org>, Djalal Harouni <tixxdz@opendz.org>, linux-mips@linux-mips.org, linux-kernel <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

Hi

On Wed, Jul 29, 2015 at 6:19 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> Hi David,
>
> Does it make sense to build this sample when cross compiling?
>
> The reason I ask is that it has been breaking the linux-next build of
> allmodconfig for a while now, with:
>
>   HOSTCC  samples/kdbus/kdbus-workers
> samples/kdbus/kdbus-workers.c: In function =E2=80=98prime_new=E2=80=99=
:
> samples/kdbus/kdbus-workers.c:934:18: error: =E2=80=98__NR_memfd_crea=
te=E2=80=99 undeclared (first use in this function)
>   p->fd =3D syscall(__NR_memfd_create, "prime-area", MFD_CLOEXEC);
>                   ^
> samples/kdbus/kdbus-workers.c:934:18: note: each undeclared identifie=
r is reported only once for each function it appears in
> scripts/Makefile.host:91: recipe for target 'samples/kdbus/kdbus-work=
ers' failed
> make[2]: *** [samples/kdbus/kdbus-workers] Error 1

mips does have this syscall, so I assume the problem is out-of-date
kernel headers. You can fix this by running:

    $ make headers_install

This will put the sanitized headers in your local kernel tree
"./usr/". This is preferred over "/usr" as include path for the kernel
examples, hence, everything should work fine then.

The kernel samples/ directory is explicitly used for example programs
for the kernel. Hence, I think it is quite fine to use new kernel
features. Same applies to the selftests.

I'd be fine making kdbus-workers a no-op program if __NR_memfd_create
is not defined. But I'm not really sure that fixes real problems. I
mean, new samples and selftests will be added by other subsystems and
those might as well require new kernel headers.

Thanks
David
