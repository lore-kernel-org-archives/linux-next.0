From: Daniel Cashman <dcashman@google.com>
Subject: Re: next-20151126 build: 3 failures 15 warnings (next-20151126)
Date: Thu, 26 Nov 2015 15:30:51 -0800
Message-ID: <CAJQetW5o4oMtqZ=2fqjwrNesw+0WZ==trF6AhAxGKgQvX39Vhw@mail.gmail.com>
References: <E1a1sVV-00079q-My@optimist>
	<20151126113213.GC1929@sirena.org.uk>
	<20151126151053.GK3109@e104818-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:33367 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753330AbbKZXaw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Nov 2015 18:30:52 -0500
Received: by oixx65 with SMTP id x65so53455835oix.0
        for <linux-next@vger.kernel.org>; Thu, 26 Nov 2015 15:30:52 -0800 (PST)
In-Reply-To: <20151126151053.GK3109@e104818-lin.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will.deacon@arm.com>, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org, dcashman@android.com

I think the proper course here is to make the use conditional,
assuming that there will never be a 32-bit application running if
CONFIG_COMPAT is not enabled.  Thank you Mark for catching this, and
Catalin for your suggestions.  I've just posted patch-set v4, which
addresses some of Catalin's remarks and this breakage; I'd have no
objection to removing v3 from next, especially in light of this.

Thank You,
Dan

On Thu, Nov 26, 2015 at 7:10 AM, Catalin Marinas
<catalin.marinas@arm.com> wrote:
> On Thu, Nov 26, 2015 at 11:32:13AM +0000, Mark Brown wrote:
>> Today's -next fails to build an arm64 allnoconfig due to:
>>
>> >     arm64-allnoconfig
>> > ../arch/arm64/mm/mmap.c:55:49: error: 'mmap_rnd_compat_bits' undeclared (first use in this function)
>>
>> which was introduced by a combination of 8f62c06c279a3 (mm: mmap: add
>> new /proc tunable for mmap_base ASLR) and 9411708692954 (arm64: mm:
>> support ARCH_MMAP_RND_BITS).  These add an unconditional use of
>> mmap_rnd_compat_bits which is only defined in linux/mmap.h if
>> HAVE_ARCH_MMAP_RND_COMPAT_BITS is selected but that is only enabled for
>> arm64 if COMPAT is enabled.  Either the select needs to be unconditional
>> or the use needs to be.
>
> There are other problems with these patches for arm64, I already replied
> here:
>
> http://lkml.kernel.org/g/20151125120601.GC3109@e104818-lin.cambridge.arm.com
>
> So I don't think they should be in -next.
>
> --
> Catalin



-- 
Dan Cashman
