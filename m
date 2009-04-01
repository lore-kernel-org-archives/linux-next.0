From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the tracing tree with the parisc
	tree
Date: Wed, 1 Apr 2009 13:05:12 +0200
Message-ID: <20090401110512.GB15442@elte.hu>
References: <20090401113740.7f425e02.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:52110 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758048AbZDALFs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 1 Apr 2009 07:05:48 -0400
Content-Disposition: inline
In-Reply-To: <20090401113740.7f425e02.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Helge Deller <deller@gmx.de>, Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org, Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>, Steven Rostedt <srostedt@redhat.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the tracing tree got a conflict in
> arch/parisc/include/asm/ftrace.h between commit
> d75f054a2cf0614ff63d534ff21ca8eaab41e713 ("parisc: add ftrace (function
> and graph tracer) functionality") from the parisc tree and commit
> c79a61f55773d2519fd0525bf58385f7d20752d3 ("tracing: make CALLER_ADDRx
> overwriteable") from the tracing tree.
> 
> The former adds a non-trivial version of the file, so I used that.

You need to be careful, the two trees likely cannot be combined like 
that, ftrace will likely stop working on parisc because you combine 
old-parisc with new-ftrace.

If the two trees are integrated without forward-porting the parisc 
ftrace port to the new facilities, then it's safer to do a trivial 
patch that disables the ftrace bits on parisc.

	Ingo
