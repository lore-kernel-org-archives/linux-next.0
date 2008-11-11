From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 1/1] ring-buffer: buffer record on/off switch
Date: Tue, 11 Nov 2008 22:08:31 +0100
Message-ID: <20081111210831.GA16179@elte.hu>
References: <20081111200601.147669239@goodmis.org> <20081111201034.315528609@goodmis.org> <20081111125645.4f7a5827.akpm@linux-foundation.org> <alpine.DEB.1.10.0811111603590.3275@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:57366 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752130AbYKKVJE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 11 Nov 2008 16:09:04 -0500
Content-Disposition: inline
In-Reply-To: <alpine.DEB.1.10.0811111603590.3275@gandalf.stny.rr.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>, Andy Whitcroft <apw@shadowen.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, tglx@linutronix.de, torvalds@linux-foundation.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, srostedt@redhat.com


* Steven Rostedt <rostedt@goodmis.org> wrote:

> 
> On Tue, 11 Nov 2008, Andrew Morton wrote:
> 
> > On Tue, 11 Nov 2008 15:06:02 -0500
> > Steven Rostedt <rostedt@goodmis.org> wrote:
> > 
> > > +static struct file_operations rb_simple_fops = {
> > 
> > should be const...
> > 
> > Probably it isn't worth fixing.  Someone(tm) should do period sweeps -
> > 10% of our file_operationses aren't const.
> 
> Thanks, I never really thought about it.
> 
> I'll add to my todo list to send out a patch that cleans all of this 
> up. I think I'm guilty at doing this in more than one place.

Perhaps checkpatch.pl could remind us about it? a new file_operations 
struct definition should be const in 99.9% of the cases.

	Ingo
