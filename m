From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH -next-20080709] fixup stop_machine use cpu mask vs
	ftrace
Date: Fri, 11 Jul 2008 09:46:03 +0200
Message-ID: <20080711074602.GB27849@elte.hu>
References: <200807081756.47140.rusty@rustcorp.com.au> <for-27-patch0-1@bga.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:58867 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750897AbYGKHqm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 11 Jul 2008 03:46:42 -0400
Content-Disposition: inline
In-Reply-To: <for-27-patch0-1@bga.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Milton Miller <miltonm@bga.com>
Cc: Ingo Molnar <mingo@redhat.com>, Rusty Russell <rusty@rustcorp.com.au>, linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>


* Milton Miller <miltonm@bga.com> wrote:

> Hi Rusty, Ingo.
> 
> Rusty's patch [PATCH 3/3] stop_machine: use cpu mask rather than magic 
> numbers didn't find kernel/trace/ftrace.c in -next, causing an 
> immediate almost NULL pointer dereference in ftrace_dynamic_init.

Rusty - what's going on here? Please do not change APIs like that, which 
cause code to crash. Either do a compatible API change, or change it 
over in a way that causes clear build failures, not crashes.

	Ingo
