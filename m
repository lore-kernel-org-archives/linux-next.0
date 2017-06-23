From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: enabling COMPILE_TEST support for GCC plugins in v4.11
Date: Fri, 23 Jun 2017 15:43:58 +1000
Message-ID: <871sqbqmw1.fsf@concordia.ellerman.id.au>
References: <CAGXu5jLEg_4oOyT-rB8QaaYos854xp39_hNf7haNp=8frcPS0Q@mail.gmail.com> <CAP=VYLrOu8Yjzds2cHcii=kX5-i5xV3GUkLR9yhxBdJBw31F0Q@mail.gmail.com> <CAGXu5jLuuoCpaQ82nK=pFWEeRrm86=vozyS=3nPN=Lw+2uUHQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43081 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754396AbdFWFoA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 23 Jun 2017 01:44:00 -0400
In-Reply-To: <CAGXu5jLuuoCpaQ82nK=pFWEeRrm86=vozyS=3nPN=Lw+2uUHQg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@google.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Tony Breeds <tony@bakeyournoodle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@kernel.org>, info@kernelci.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will.deacon@arm.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, LKML <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>, Fengguang Wu <fengguang.wu@intel.com>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Laura Abbott <labbott@redhat.com>, "x86@kernel.org" <x86@kernel.org>

[Old thread just popped up in my inbox]

Kees Cook <keescook@google.com> writes:
> On Thu, Dec 8, 2016 at 5:52 PM, Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
>> On Thu, Dec 8, 2016 at 2:00 PM, Kees Cook <keescook@google.com> wrote:
>>> Hi,
>>>
>>> I'd like to get the GCC plugins building under
>>> allyesconfig/allmodconfig for -next soon (with the intention of
>>> landing the change in v4.11). Specifically, I intend to revert
>>> a519167e753e ("gcc-plugins: disable under COMPILE_TEST").
>>
>> If I recall correctly, I noted that the plugins broke the kernel.org
>> cross compiler toolchains which led to the above disable.
>
> Do you mean these?
> https://www.kernel.org/pub/tools/crosstool/

I think those are the ones Paul is talking about.

Those were mostly built by Tony, who is know, sadly, an Openstack
developer and for some reason doesn't seem to have time to build
toolchains for kernel hackers :P


As folks may have seen on LWN, there are now pre-built toolchains for
many architectures available from the Free Electrons guys, so that may
help to unblock this situation somewhat:

http://toolchains.free-electrons.com/


cheers
