From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 1/1] ring-buffer: buffer record on/off switch
Date: Tue, 11 Nov 2008 16:04:36 -0500 (EST)
Message-ID: <alpine.DEB.1.10.0811111603590.3275@gandalf.stny.rr.com>
References: <20081111200601.147669239@goodmis.org> <20081111201034.315528609@goodmis.org> <20081111125645.4f7a5827.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753438AbYKKVEt@vger.kernel.org>
In-Reply-To: <20081111125645.4f7a5827.akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, mingo@elte.hu, tglx@linutronix.de, torvalds@linux-foundation.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, srostedt@redhat.com
List-Id: linux-next.vger.kernel.org


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

Thanks, I never really thought about it.

I'll add to my todo list to send out a patch that cleans all of this up. I 
think I'm guilty at doing this in more than one place.

-- Steve
