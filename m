From: Steven Rostedt <srostedt@redhat.com>
Subject: Re: Warning from ring buffer code (Was: Re: linux-next: tip tree
 build warning)
Date: Mon, 14 Sep 2009 09:50:01 -0400
Message-ID: <1252936201.2964.59.camel@localhost.localdomain>
References: <20090804161640.70817ee6.sfr@canb.auug.org.au>
	 <1249403089.4634.139.camel@localhost.localdomain>
	 <20090912165300.9d257283.sfr@canb.auug.org.au>
	 <20090912073906.GA3972@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:59379 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753091AbZINNuf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Sep 2009 09:50:35 -0400
In-Reply-To: <20090912073906.GA3972@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 2009-09-12 at 09:39 +0200, Ingo Molnar wrote:
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > Now that this is in Linus' tree, can we have a fix for the waning, 
> > please?
> 
> The first warning got fixed 1.5 months ago - the second one at line 
> 797 is still there but harmless - you can ignore it for now, it will 
> be fixed.

The first warning never got fixed. The typecast was placed in the wrong
spot (my fault). I sent another patch that fixes both warnings.

-- Steve
