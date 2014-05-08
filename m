From: Andi Kleen <ak@linux.intel.com>
Subject: Re: linux-next: Tree for May 7 (argh)
Date: Wed, 7 May 2014 18:10:30 -0700
Message-ID: <20140508011030.GT19657@tassilo.jf.intel.com>
References: <20140507173341.753d8ccf4fe033abd513f98f@canb.auug.org.au>
 <536A9CF2.90906@infradead.org>
 <CA+r1ZhiUj3G44MWoacLg6fWD-eDFZ=3L8QbwuBvOB2JWAURDqQ@mail.gmail.com>
 <20140508080251.64eed8b579e307c25c46e27f@canb.auug.org.au>
 <CA+r1Zhg4TKBkV8fZ+uUj9yy_0fWYNrrSLuL9ZEYppQBUKRm6jQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:60438 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751800AbaEHBKc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 7 May 2014 21:10:32 -0400
Content-Disposition: inline
In-Reply-To: <CA+r1Zhg4TKBkV8fZ+uUj9yy_0fWYNrrSLuL9ZEYppQBUKRm6jQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <rdunlap@infradead.org>, linux-next <linux-next@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Michal Marek <mmarek@suse.cz>

> >> > ps2mult.c:(.exit.text+0x8f): multiple definition of `cleanup_module'
> >> > ps2mult.c:(.init.text+0xbc8): multiple definition of `init_module'
> >> > ipack.c:(.exit.text+0x0): multiple definition of `cleanup_module'
> >> > ipack.c:(.init.text+0x0): multiple definition of `init_module'
> >> > mcb-core.c:(.text+0x40d): multiple definition of `cleanup_module'
> >> > mcb-core.c:(.text+0x3fb): multiple definition of `init_module'
> >>

It sounds like it misdetects your binutils. LTO should
disable itself when your binutils cannot handle it. Can you send me
the full build log and output of ld --version and gcc --version
please?

-andi

-- 
ak@linux.intel.com -- Speaking for myself only
