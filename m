From: David Herrmann <dh.herrmann@gmail.com>
Subject: Re: randconfig build error with next-20150316, in samples/kdbus/kdbus-workers
Date: Mon, 16 Mar 2015 17:31:40 +0100
Message-ID: <CANq1E4Rc+Bp0mb=VxiV7Qgb1Wbz=TUExU4NwUcCsu9_DnC9pRw@mail.gmail.com>
References: <CA+r1ZhgsXRTBzHicQ3H_DUGt7dioZa+GjpWepHvemGR=UzJymg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ig0-f182.google.com ([209.85.213.182]:35859 "EHLO
	mail-ig0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755796AbbCPQbl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Mar 2015 12:31:41 -0400
In-Reply-To: <CA+r1ZhgsXRTBzHicQ3H_DUGt7dioZa+GjpWepHvemGR=UzJymg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Mack <daniel@zonque.org>, David Herrmann <dh.herrmann@googlemail.com>, Djalal Harouni <tixxdz@opendz.org>

Hi

On Mon, Mar 16, 2015 at 5:22 PM, Jim Davis <jim.epost@gmail.com> wrote:
> Building with the attached random configuration file,
>
> In file included from ./include/uapi/linux/kdbus.h:12:0,
>                  from samples/kdbus/kdbus-api.h:5,
>                  from samples/kdbus/kdbus-workers.c:79:
> ./include/uapi/linux/types.h:9:2: warning: #warning "Attempt to use
> kernel headers from user space, see
> http://kernelnewbies.org/KernelHeaders" [-Wcpp]
>  #warning "Attempt to use kernel headers from user space, see
> http://kernelnewbies.org/KernelHeaders"
>   ^
> In file included from ./include/uapi/linux/posix_types.h:4:0,
>                  from ./include/uapi/linux/types.h:13,
>                  from ./include/uapi/linux/kdbus.h:12,
>                  from samples/kdbus/kdbus-api.h:5,
>                  from samples/kdbus/kdbus-workers.c:79:
> ./include/uapi/linux/stddef.h:1:28: fatal error: linux/compiler.h: No
> such file or directory
>  #include <linux/compiler.h>
>                             ^
> compilation terminated.
> scripts/Makefile.host:91: recipe for target 'samples/kdbus/kdbus-workers' failed
> make[2]: *** [samples/kdbus/kdbus-workers] Error 1

If you build the samples in ./samples/, you need up-to-date kernel
headers. The kdbus samples rely on linux/kdbus.h to be available.

A simple "make headers_install" will copy the headers to the local
directory ./usr/ in your kernel tree. This is the preferred location
over /usr/include by all tools in the kernel tree. That is, run "make
headers_install" once and your local tree will build fine. Once your
kernel-headers in /usr/include are up-to-date, it will work just
out-of-the-box again.

In other words, if CONFIG_SAMPLES is enabled, you need the sanitized
kernel headers in your include path.

Thanks
David
