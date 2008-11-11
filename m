From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 1/1] ring-buffer: buffer record on/off switch
Date: Tue, 11 Nov 2008 16:06:43 -0500 (EST)
Message-ID: <alpine.DEB.1.10.0811111606040.3275@gandalf.stny.rr.com>
References: <20081111200601.147669239@goodmis.org> <20081111201034.315528609@goodmis.org> <20081111125645.4f7a5827.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.123]:44287 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751792AbYKKVG5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 11 Nov 2008 16:06:57 -0500
In-Reply-To: <20081111125645.4f7a5827.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, srostedt@redhat.com, Andy Whitcroft <apw@shadowen.org>


[ Added Andy on Cc ]

On Tue, 11 Nov 2008, Andrew Morton wrote:

> On Tue, 11 Nov 2008 15:06:02 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > +static struct file_operations rb_simple_fops = {
> 
> should be const...
> 
> Probably it isn't worth fixing.  Someone(tm) should do period sweeps -
> 10% of our file_operationses aren't const.

I wonder if this should be added to checkpatch?

-- Steve
