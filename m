From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Sep 19 (x86/kernel/cpuinfo.c)
Date: Mon, 25 Sep 2017 18:19:06 -0700
Message-ID: <46a06a76-a17c-de77-362a-99a18efaee79@infradead.org>
References: <20170919141557.03ffb2a7@canb.auug.org.au>
 <75e3d5e7-091e-9b26-47cc-36bece726b9e@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:48446 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965630AbdIZBTN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Sep 2017 21:19:13 -0400
In-Reply-To: <75e3d5e7-091e-9b26-47cc-36bece726b9e@infradead.org>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felix Schnizlein <fschnizlein@suse.com>

On 09/19/17 08:54, Randy Dunlap wrote:
> On 09/18/17 21:15, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20170918:
>>
>> Linus' tree still had its build failure for which I reverted a commit.
>>
> 
> on i386:
> 
> ../arch/x86/kernel/cpuinfo.c: In function 'cpuinfo_flags':
> ../arch/x86/kernel/cpuinfo.c:35:26: error: 'x86_cap_flags' undeclared (first use in this function)
>    if (cpu_has(cpu, i) && x86_cap_flags[i] != NULL)
>                           ^
> 
> # CONFIG_X86_FEATURE_NAMES is not set
> CONFIG_HAVE_CPUINFO_SYSFS=y
> 

Add author and driver-core maintainers.

Same error in linux-next 20170922.


-- 
~Randy
