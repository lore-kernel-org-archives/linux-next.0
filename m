From: David Herrmann <dh.herrmann@gmail.com>
Subject: Re: randconfig build error with next-20150316, in samples/kdbus/kdbus-workers
Date: Tue, 17 Mar 2015 00:00:48 +0100
Message-ID: <CANq1E4RXYQJLcjf3pCu7zovw01uMnHTtMkiugjsJVQ8D=fLnVg@mail.gmail.com>
References: <CA+r1ZhgsXRTBzHicQ3H_DUGt7dioZa+GjpWepHvemGR=UzJymg@mail.gmail.com>
	<CANq1E4Rc+Bp0mb=VxiV7Qgb1Wbz=TUExU4NwUcCsu9_DnC9pRw@mail.gmail.com>
	<1426540369.20069.1.camel@ellerman.id.au>
	<CANq1E4S82hHRNgfnUCVYbzHku6X3kZchUNY4VRW0+YM9q_8Mbg@mail.gmail.com>
	<1426546287.31646.1.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426546287.31646.1.camel@ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Mack <daniel@zonque.org>, David Herrmann <dh.herrmann@googlemail.com>, Djalal Harouni <tixxdz@opendz.org>
List-Id: linux-next.vger.kernel.org

Hi

On Mon, Mar 16, 2015 at 11:51 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> On Mon, 2015-03-16 at 23:27 +0100, David Herrmann wrote:
>> The uapi-include only causes the warning, not the build failure.
>
> I don't know how you came to that conclusion?
>
> It fails looking for linux/compiler.h, which is only included from the kernel
> headers, never from the exported headers.

We only include linux/kdbus.h. On sanitized headers, this will include
linux/types.h -> linux/posix_types.h -> linux/stddef.h.
If you use the uapi headers, then stddef.h is not sanitized and will
still include linux/compiler.h (which is removed on sanitized
headers). Hence, this error only occurs if you include
uapi/linux/kdbus.h. With sanitized headers in ./usr/, the compiler
will prefer ./usr/linux/kdbus.h and ./usr/linux/stddef.h, thus never
including any linux/compiler.h.

If you drop -I./include/uapi/, you will get "linux/kdbus.h not found".
The error will be different, but it will not fix anything. However, if
you run "make headers_install", everything will compile just fine even
with -I./include/uapi/.

Thanks
David
