From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: randconfig build error with next-20150316, in
 samples/kdbus/kdbus-workers
Date: Tue, 17 Mar 2015 09:51:27 +1100
Message-ID: <1426546287.31646.1.camel@ellerman.id.au>
References: <CA+r1ZhgsXRTBzHicQ3H_DUGt7dioZa+GjpWepHvemGR=UzJymg@mail.gmail.com>
	 <CANq1E4Rc+Bp0mb=VxiV7Qgb1Wbz=TUExU4NwUcCsu9_DnC9pRw@mail.gmail.com>
	 <1426540369.20069.1.camel@ellerman.id.au>
	 <CANq1E4S82hHRNgfnUCVYbzHku6X3kZchUNY4VRW0+YM9q_8Mbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52011 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755166AbbCPWva (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2015 18:51:30 -0400
In-Reply-To: <CANq1E4S82hHRNgfnUCVYbzHku6X3kZchUNY4VRW0+YM9q_8Mbg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Herrmann <dh.herrmann@gmail.com>
Cc: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Mack <daniel@zonque.org>, David Herrmann <dh.herrmann@googlemail.com>, Djalal Harouni <tixxdz@opendz.org>

On Mon, 2015-03-16 at 23:27 +0100, David Herrmann wrote:
> Hi
> 
> On Mon, Mar 16, 2015 at 10:12 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> > On Mon, 2015-03-16 at 17:31 +0100, David Herrmann wrote:
> >> Hi
> >>
> >> On Mon, Mar 16, 2015 at 5:22 PM, Jim Davis <jim.epost@gmail.com> wrote:
> >> > Building with the attached random configuration file,
> >> >
> >> > In file included from ./include/uapi/linux/kdbus.h:12:0,
> >> >                  from samples/kdbus/kdbus-api.h:5,
> >> >                  from samples/kdbus/kdbus-workers.c:79:
> >> > ./include/uapi/linux/types.h:9:2: warning: #warning "Attempt to use
> >> > kernel headers from user space, see
> >> > http://kernelnewbies.org/KernelHeaders" [-Wcpp]
> >> >  #warning "Attempt to use kernel headers from user space, see
> >> > http://kernelnewbies.org/KernelHeaders"
> >> >   ^
> >> > In file included from ./include/uapi/linux/posix_types.h:4:0,
> >> >                  from ./include/uapi/linux/types.h:13,
> >> >                  from ./include/uapi/linux/kdbus.h:12,
> >> >                  from samples/kdbus/kdbus-api.h:5,
> >> >                  from samples/kdbus/kdbus-workers.c:79:
> >> > ./include/uapi/linux/stddef.h:1:28: fatal error: linux/compiler.h: No
> >> > such file or directory
> >> >  #include <linux/compiler.h>
> >> >                             ^
> >> > compilation terminated.
> >> > scripts/Makefile.host:91: recipe for target 'samples/kdbus/kdbus-workers' failed
> >> > make[2]: *** [samples/kdbus/kdbus-workers] Error 1
> >>
> >> If you build the samples in ./samples/, you need up-to-date kernel
> >> headers. The kdbus samples rely on linux/kdbus.h to be available.
> >>
> >> A simple "make headers_install" will copy the headers to the local
> >> directory ./usr/ in your kernel tree. This is the preferred location
> >> over /usr/include by all tools in the kernel tree. That is, run "make
> >> headers_install" once and your local tree will build fine. Once your
> >> kernel-headers in /usr/include are up-to-date, it will work just
> >> out-of-the-box again.
> >>
> >> In other words, if CONFIG_SAMPLES is enabled, you need the sanitized
> >> kernel headers in your include path.
> >
> > But the samples are also including the unsanitised headers, which I think is
> > what's causing the problem here.
> 
> The uapi-include only causes the warning, not the build failure.

I don't know how you came to that conclusion?

It fails looking for linux/compiler.h, which is only included from the kernel
headers, never from the exported headers.

> There's already a fix for that queued:
> 
> http://git.kernel.org/cgit/linux/kernel/git/gregkh/char-misc.git/commit/?h=kdbus&id=526edb23cd096375683455c73b56baba34ae3f06

Fix looks good.

Though I disagree a bit with the commit message. It's not that there's "no
reason to use include/uapi", it's just that it's wrong - they're not the
exported kernel headers. But that's just nit picking.

cheers
