From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: randconfig build error with next-20150316, in
 samples/kdbus/kdbus-workers
Date: Tue, 17 Mar 2015 08:12:49 +1100
Message-ID: <1426540369.20069.1.camel@ellerman.id.au>
References: <CA+r1ZhgsXRTBzHicQ3H_DUGt7dioZa+GjpWepHvemGR=UzJymg@mail.gmail.com>
	 <CANq1E4Rc+Bp0mb=VxiV7Qgb1Wbz=TUExU4NwUcCsu9_DnC9pRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANq1E4Rc+Bp0mb=VxiV7Qgb1Wbz=TUExU4NwUcCsu9_DnC9pRw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Herrmann <dh.herrmann@gmail.com>
Cc: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Mack <daniel@zonque.org>, David Herrmann <dh.herrmann@googlemail.com>, Djalal Harouni <tixxdz@opendz.org>
List-Id: linux-next.vger.kernel.org

On Mon, 2015-03-16 at 17:31 +0100, David Herrmann wrote:
> Hi
> 
> On Mon, Mar 16, 2015 at 5:22 PM, Jim Davis <jim.epost@gmail.com> wrote:
> > Building with the attached random configuration file,
> >
> > In file included from ./include/uapi/linux/kdbus.h:12:0,
> >                  from samples/kdbus/kdbus-api.h:5,
> >                  from samples/kdbus/kdbus-workers.c:79:
> > ./include/uapi/linux/types.h:9:2: warning: #warning "Attempt to use
> > kernel headers from user space, see
> > http://kernelnewbies.org/KernelHeaders" [-Wcpp]
> >  #warning "Attempt to use kernel headers from user space, see
> > http://kernelnewbies.org/KernelHeaders"
> >   ^
> > In file included from ./include/uapi/linux/posix_types.h:4:0,
> >                  from ./include/uapi/linux/types.h:13,
> >                  from ./include/uapi/linux/kdbus.h:12,
> >                  from samples/kdbus/kdbus-api.h:5,
> >                  from samples/kdbus/kdbus-workers.c:79:
> > ./include/uapi/linux/stddef.h:1:28: fatal error: linux/compiler.h: No
> > such file or directory
> >  #include <linux/compiler.h>
> >                             ^
> > compilation terminated.
> > scripts/Makefile.host:91: recipe for target 'samples/kdbus/kdbus-workers' failed
> > make[2]: *** [samples/kdbus/kdbus-workers] Error 1
> 
> If you build the samples in ./samples/, you need up-to-date kernel
> headers. The kdbus samples rely on linux/kdbus.h to be available.
> 
> A simple "make headers_install" will copy the headers to the local
> directory ./usr/ in your kernel tree. This is the preferred location
> over /usr/include by all tools in the kernel tree. That is, run "make
> headers_install" once and your local tree will build fine. Once your
> kernel-headers in /usr/include are up-to-date, it will work just
> out-of-the-box again.
> 
> In other words, if CONFIG_SAMPLES is enabled, you need the sanitized
> kernel headers in your include path.

But the samples are also including the unsanitised headers, which I think is
what's causing the problem here.

HOSTCFLAGS_kdbus-workers.o +=           \
         -I$(objtree)/usr/include/       \
         -I$(objtree)/include/uapi/

cheers
