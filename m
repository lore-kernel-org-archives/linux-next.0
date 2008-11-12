From: Andy Whitcroft <apw@shadowen.org>
Subject: Re: [PATCH 1/1] ring-buffer: buffer record on/off switch
Date: Wed, 12 Nov 2008 14:11:13 +0000
Message-ID: <20081112141113.GG8302@shadowen.org>
References: <20081111200601.147669239@goodmis.org> <20081111201034.315528609@goodmis.org> <20081111125645.4f7a5827.akpm@linux-foundation.org> <alpine.DEB.1.10.0811111603590.3275@gandalf.stny.rr.com> <20081111210831.GA16179@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753533AbYKLOLa@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20081111210831.GA16179@elte.hu>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@elte.hu>
Cc: Steven Rostedt <rostedt@goodmis.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, tglx@linutronix.de, torvalds@linux-foundation.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, srostedt@redhat.com
List-Id: linux-next.vger.kernel.org

On Tue, Nov 11, 2008 at 10:08:31PM +0100, Ingo Molnar wrote:
> 
> * Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > 
> > On Tue, 11 Nov 2008, Andrew Morton wrote:
> > 
> > > On Tue, 11 Nov 2008 15:06:02 -0500
> > > Steven Rostedt <rostedt@goodmis.org> wrote:
> > > 
> > > > +static struct file_operations rb_simple_fops = {
> > > 
> > > should be const...
> > > 
> > > Probably it isn't worth fixing.  Someone(tm) should do period sweeps -
> > > 10% of our file_operationses aren't const.
> > 
> > Thanks, I never really thought about it.
> > 
> > I'll add to my todo list to send out a patch that cleans all of this 
> > up. I think I'm guilty at doing this in more than one place.
> 
> Perhaps checkpatch.pl could remind us about it? a new file_operations 
> struct definition should be const in 99.9% of the cases.

Added to my TODO list.

-apw
