From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for May 7 (argh)
Date: Thu, 08 May 2014 09:54:44 -0700
Message-ID: <536BB6D4.8020309@infradead.org>
References: <20140507173341.753d8ccf4fe033abd513f98f@canb.auug.org.au> <536A9CF2.90906@infradead.org> <CA+r1ZhiUj3G44MWoacLg6fWD-eDFZ=3L8QbwuBvOB2JWAURDqQ@mail.gmail.com> <20140508080251.64eed8b579e307c25c46e27f@canb.auug.org.au> <CA+r1Zhg4TKBkV8fZ+uUj9yy_0fWYNrrSLuL9ZEYppQBUKRm6jQ@mail.gmail.com> <20140508011030.GT19657@tassilo.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:53593 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752428AbaEHQyt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 May 2014 12:54:49 -0400
In-Reply-To: <20140508011030.GT19657@tassilo.jf.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andi Kleen <ak@linux.intel.com>, Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Michal Marek <mmarek@suse.cz>

On 05/07/2014 06:10 PM, Andi Kleen wrote:
>>>>> ps2mult.c:(.exit.text+0x8f): multiple definition of `cleanup_module'
>>>>> ps2mult.c:(.init.text+0xbc8): multiple definition of `init_module'
>>>>> ipack.c:(.exit.text+0x0): multiple definition of `cleanup_module'
>>>>> ipack.c:(.init.text+0x0): multiple definition of `init_module'
>>>>> mcb-core.c:(.text+0x40d): multiple definition of `cleanup_module'
>>>>> mcb-core.c:(.text+0x3fb): multiple definition of `init_module'
>>>>
> 
> It sounds like it misdetects your binutils. LTO should
> disable itself when your binutils cannot handle it. Can you send me
> the full build log and output of ld --version and gcc --version
> please?

Hi Andi,

I see this message:
scripts/Makefile.lto:82: "WARNING: GCC 0407 too old for LTO/WHOPR. CONFIG_LTO disabled"

so that seems to be working OK.

I think that the init_module/cleanup_module problems are due to some errors
in my automated scripts.  Sorry about that.  Please ignore my original report.


-- 
~Randy
