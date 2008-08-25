From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: ftrace tree build failure
Date: Mon, 25 Aug 2008 08:09:35 +0200
Message-ID: <20080825060934.GB14993@elte.hu>
References: <20080825130117.33fe34bc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:33351 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751395AbYHYGJx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 02:09:53 -0400
Content-Disposition: inline
In-Reply-To: <20080825130117.33fe34bc.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> x86_64-unknown-linux-gnu-objcopy: unrecognized option `--globalize-symbol'
> 
> Introduced by commit 46483cdbb5dc06d84d9572bac1b90f6744c7fc95 ("ftrace:
> create __mcount_loc section").
> 
> The currently documented minimum requirements for binutils is 2.12.
> 
> $ x86_64-unknown-linux-gnu-objcopy --version
> GNU objcopy 2.16.1
> 
> For now I have reverted commit c2ffd56692cc4b762c175fad69b70a4ec0dfca3f
> ("ftrace: enable using mcount recording on x86") since that is the least
> intrusive thing to do and the above change depends on
> CONFIG_FTRACE_MCOUNT_RECORD.

ok. The binutils i've used for testing is 2.18 and this is indeed a new 
option since 2.17. Steve?

	Ingo
