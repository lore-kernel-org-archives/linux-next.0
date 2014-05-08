From: Andi Kleen <ak@linux.intel.com>
Subject: Re: linux-next: Tree for May 7 (argh)
Date: Thu, 8 May 2014 10:08:51 -0700
Message-ID: <20140508170851.GU19657@tassilo.jf.intel.com>
References: <20140507173341.753d8ccf4fe033abd513f98f@canb.auug.org.au>
 <536A9CF2.90906@infradead.org>
 <CA+r1ZhiUj3G44MWoacLg6fWD-eDFZ=3L8QbwuBvOB2JWAURDqQ@mail.gmail.com>
 <20140508080251.64eed8b579e307c25c46e27f@canb.auug.org.au>
 <CA+r1Zhg4TKBkV8fZ+uUj9yy_0fWYNrrSLuL9ZEYppQBUKRm6jQ@mail.gmail.com>
 <20140508011030.GT19657@tassilo.jf.intel.com>
 <CA+r1ZhjErMWqVY5kSfMqLUAeQNMQhLXdwRMY2ro-OQMzbgEX9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:61118 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751856AbaEHRKj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 8 May 2014 13:10:39 -0400
Content-Disposition: inline
In-Reply-To: <CA+r1ZhjErMWqVY5kSfMqLUAeQNMQhLXdwRMY2ro-OQMzbgEX9g@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <rdunlap@infradead.org>, linux-next <linux-next@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Michal Marek <mmarek@suse.cz>

On Thu, May 08, 2014 at 10:05:35AM -0700, Jim Davis wrote:
> On 5/7/14, Andi Kleen <ak@linux.intel.com> wrote:
> 
> > It sounds like it misdetects your binutils. LTO should
> > disable itself when your binutils cannot handle it. Can you send me
> > the full build log and output of ld --version and gcc --version
> > please?
> 
> With next-20140518 I am getting
> 
> buildlog-1399568101.txt:/home/jim/linux/scripts/Makefile.lto:76:
> "WARNING: Too old linker version 22400000 for kernel LTO. You need
> Linux binutils. CONFIG_LTO disabled."

Ok so LTO is not active, and you still get errors.

That is odd.

> 
> I don't recall seeing that when the problems first started, but I
> didn't save a buildlog from back then...

Please send a full build log / config

-Andi
