From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for May 26 (syscalls is85/ia32 on x86_64)
Date: Mon, 26 May 2014 10:41:35 -0700
Message-ID: <53837CCF.7010807@infradead.org>
References: <20140526193819.2ba7bc07@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:54934 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751558AbaEZRli (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 May 2014 13:41:38 -0400
In-Reply-To: <20140526193819.2ba7bc07@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, X86 ML <x86@kernel.org>

On 05/26/2014 02:38 AM, Stephen Rothwell wrote:
> Hi all,
> 
> The powerpc allyesconfig is again broken more than usual.
> 
> Changes since 20140523:
> 

I get lots of build errors (and have for the past week of so)
like this:


  CC      arch/x86/kernel/asm-offsets.s
In file included from ../arch/x86/kernel/asm-offsets.c:27:0:
../arch/x86/kernel/asm-offsets_64.c:15:29: fatal error: asm/syscalls_32.h: No such file or directory
compilation terminated.
make[2]: *** [arch/x86/kernel/asm-offsets.s] Error 1


when CONFIG_X86_X32_ABI is not enabled.

-- 
~Randy
