From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: randconfig build error with next-20150316, in
 samples/kdbus/kdbus-workers
Date: Tue, 17 Mar 2015 13:09:01 +1100
Message-ID: <1426558141.31646.5.camel@ellerman.id.au>
References: <CA+r1ZhgsXRTBzHicQ3H_DUGt7dioZa+GjpWepHvemGR=UzJymg@mail.gmail.com>
	 <CANq1E4Rc+Bp0mb=VxiV7Qgb1Wbz=TUExU4NwUcCsu9_DnC9pRw@mail.gmail.com>
	 <1426540369.20069.1.camel@ellerman.id.au>
	 <CANq1E4S82hHRNgfnUCVYbzHku6X3kZchUNY4VRW0+YM9q_8Mbg@mail.gmail.com>
	 <1426546287.31646.1.camel@ellerman.id.au>
	 <CANq1E4RXYQJLcjf3pCu7zovw01uMnHTtMkiugjsJVQ8D=fLnVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42665 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750852AbbCQCJD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2015 22:09:03 -0400
In-Reply-To: <CANq1E4RXYQJLcjf3pCu7zovw01uMnHTtMkiugjsJVQ8D=fLnVg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Herrmann <dh.herrmann@gmail.com>
Cc: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Mack <daniel@zonque.org>, David Herrmann <dh.herrmann@googlemail.com>, Djalal Harouni <tixxdz@opendz.org>

On Tue, 2015-03-17 at 00:00 +0100, David Herrmann wrote:
> Hi
> 
> On Mon, Mar 16, 2015 at 11:51 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> > On Mon, 2015-03-16 at 23:27 +0100, David Herrmann wrote:
> >> The uapi-include only causes the warning, not the build failure.
> >
> > I don't know how you came to that conclusion?
> >
> > It fails looking for linux/compiler.h, which is only included from the kernel
> > headers, never from the exported headers.
> 
> We only include linux/kdbus.h. On sanitized headers, this will include
> linux/types.h -> linux/posix_types.h -> linux/stddef.h.
> If you use the uapi headers, then stddef.h is not sanitized and will
> still include linux/compiler.h (which is removed on sanitized
> headers). Hence, this error only occurs if you include
> uapi/linux/kdbus.h. With sanitized headers in ./usr/, the compiler
> will prefer ./usr/linux/kdbus.h and ./usr/linux/stddef.h, thus never
> including any linux/compiler.h.

Right. But if the uapi include isn't there, you don't get this build failure.
This build failure is caused by the uapi include.

> If you drop -I./include/uapi/, you will get "linux/kdbus.h not found".

Yep, which is exactly correct (unless it's provided by your distro headers).

> The error will be different, but it will not fix anything. However, if
> you run "make headers_install", everything will compile just fine even
> with -I./include/uapi/.

Well probably. But I could probably construct a scenario where something gets
pulled in from uapi, and then you've got a mixture of user & kernel headers
again.

At the end of the day there is no good reason to use include/uapi, I think we
agree on that :)

cheers
