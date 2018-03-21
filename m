From: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: Re: linux-next: manual merge of the ftrace tree with the jc_docs
 tree
Date: Wed, 21 Mar 2018 15:55:52 -0500
Message-ID: <1521665752.31081.10.camel@tzanussi-mobl.amr.corp.intel.com>
References: <20180321153127.23737f6e@canb.auug.org.au>
         <20180321153715.3a571e5b@canb.auug.org.au>
         <20180321091554.2b38ee57@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180321091554.2b38ee57@gandalf.local.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jonathan Corbet <corbet@lwn.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Changbin Du <changbin.du@intel.com>
List-Id: linux-next.vger.kernel.org

On Wed, 2018-03-21 at 09:15 -0400, Steven Rostedt wrote:
> On Wed, 21 Mar 2018 15:37:15 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > On Wed, 21 Mar 2018 15:31:27 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Today's linux-next merge of the ftrace tree got a conflict in:
> > > 
> > >   Documentation/trace/ftrace.txt
> > >   (converted to Documentation/trace/ftrace.rst)  
> > 
> > There was another conflict involving
> > 
> >   Documentation/trace/events.{txt,rst}
> > 
> > Unfortunately, I accidentally deleted the report email before sending
> > it :-(
> > 
> 
> Ug yeah. All the histogram code was ripped out of the events.txt and
> a new file was created called histogram.txt. I'm guessing that should
> also be converted into an .rst file.
> 

Yeah, linux-next has changes to Documentation/trace/* that converts
those files to .rst, which linux-trace/frace/core doesn't have.

I've rebased the inter-event patches to linux-next/next-20180320 to
reflect those changes, which affect 9 of the files in the patchset.  The
updated patchset is here:

https://github.com/tzanussi/linux-trace-inter-event.git tzanussi/next-20180320-inter-event-v10                                               
https://github.com/tzanussi/linux-trace-inter-event/tree/tzanussi/next-20180320-inter-event-v10

I can repost the whole thing as v10, or whatever makes sense here.

Thanks,

Tom

> -- Steve
