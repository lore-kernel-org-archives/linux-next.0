From: Chris Zankel <chris@zankel.net>
Subject: Re: xtensa port maintenance
Date: Wed, 08 Aug 2012 01:23:58 -0700
Message-ID: <5022221E.5020804@zankel.net>
References: <50205592.1030205@gmail.com> <5020AA5B.4080407@zankel.net> <CAMo8BfLLxBeUC-vg6sAxWLjqPt=fwsQEQgjsqqbjurT3vzo-Pw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMo8BfLLxBeUC-vg6sAxWLjqPt=fwsQEQgjsqqbjurT3vzo-Pw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-xtensa@linux-xtensa.org, linux-next@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Marc Gauthier <marc@tensilica.com>, Kirill Krinkin <kirill.krinkin@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Max,

On 08/07/2012 09:43 AM, Max Filippov wrote:
> On Tue, Aug 7, 2012 at 9:40 AM, Chris Zankel <chris@zankel.net> wrote:
>> Hi Max,
>>
>> On 08/06/2012 04:38 PM, Max Filippov wrote:
>>> AFAIK xtensa linux port is currently in bad shape: it doesn't work in the
>>> mainline, it fails to build in the linux-next. The latest working kernels
>>> for
>>> xtensa are 2.6.29...31 trees hosted at the git.linux-xtensa.org.
>> I wouldn't say it's in bad shape, I just built an vmlinux image from the
>> latest tree (3.6.0-rc1), but it might not be very stable. One of the major
>> issues is not really the kernel but  there's actually no way to build a
>> fairly recent version of the toolchain. I have been using a somewhat more
>> recent buildroot version than what is on xtensa-linux.org, but even that
>> version of buildroot is rather old now and needed a few patches.
> I've been using userspace built from the buildroot image hosted on
> linux-xtensa.org with gcc-4.4.5 + binutils-2.20.1. I use gcc-4.6.3
> (without libc) + binutils-2.22 to build the kernel. I had an impression that
> mentioned buildroot was able to produce userspace where LTP could
> run successfully for days. So, my initial plan is to use that userspace
> with mainline kernel.
Good plan!

> I have a subset thereof that builds toolchain (without libc) and the kernel.
> Buildroot gave me an impression of not very reproducible environment, perhaps
> I spent too little time on it. So I made an image and I hope that
> pre-built image
> may be used, at least in the beginning. I had to lightly patch U-boot hosted on
> linux-xtensa.org to make it work on LX60/110/200 QEMU models. I guess we
> can start with pre-built image of the bootloader too.
I'm not settled on Buildroot, but I had the best experience with it so 
far. OpenEmbedded was a real pain when I used it (it might have improved 
a lot since, though). I once even started my own build system, but it 
became fairly complicated once I wanted to build a bootable system with 
a C library and various packages.




> Ok. I'd like to have even generic patches (my current queue is mostly 
> generic) reviewed. Do you prefer to read them on github or on the 
> linux-xtensa mailing list? 
I looked over them briefly, and only had one or two questions. I'll send 
them tomorrow (our time).


Thanks,
-Chris
