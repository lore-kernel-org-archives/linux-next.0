From: Siarhei Liakh <sliakh.lkml@gmail.com>
Subject: Re: [PATCH v6] RO/NX protection for loadable kernel modules
Date: Mon, 5 Oct 2009 07:57:59 -0400
Message-ID: <817ecb6f0910050457v5db02550m62c742f679b26577@mail.gmail.com>
References: <817ecb6f0909101950v2fc6dc6u5cbc40cd9a9dde77@mail.gmail.com>
	 <20090921214046.GA17243@redhat.com>
	 <817ecb6f0909220849t2142f6bdhdeb0180dedc646d2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932585AbZJEL6k@vger.kernel.org>
In-Reply-To: <817ecb6f0909220849t2142f6bdhdeb0180dedc646d2@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Jones <davej@redhat.com>, Siarhei Liakh <sliakh.lkml@gmail.com>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan
List-Id: linux-next.vger.kernel.org

On Tue, Sep 22, 2009 at 11:49 AM, Siarhei Liakh <sliakh.lkml@gmail.com>=
 wrote:
>> Hi Siarhei,
>> =A0I tried out this patch on 2.6.31, and got the following trace dur=
ing bootup..
>>
>> ------------[ cut here ]------------
>> WARNING: at kernel/trace/ftrace.c:1003 ftrace_bug+0x198/0x27e() (Not=
 tainted)
>> Hardware name: VGN-Z540N
> ...
>> ---[ end trace 95b33ebf87286ae6 ]---
>> ftrace faulted on writing [<ffffffffa0000193>] video_output_register=
+0x11/0x10a [output]
>>
>>
>> I guess ftrace is trying to NOP out something in the modules which
>> are marked read-only ?
>
> Entirely possible. I will review ftrace and make sure the patch
> accounts for this.

I've posted new version of the patch that also sets each module's text
as RW when ftrace preps the kernel for modifications: [PATCH v7] RO/NX
protection for loadable kernel modules

Let me know how that works for you.
Thank you.
