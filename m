From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: manual merge of the ftrace tree with the jc_docs
 tree
Date: Wed, 21 Mar 2018 09:15:54 -0400
Message-ID: <20180321091554.2b38ee57@gandalf.local.home>
References: <20180321153127.23737f6e@canb.auug.org.au>
        <20180321153715.3a571e5b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180321153715.3a571e5b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Changbin Du <changbin.du@intel.com>, Tom Zanussi <tom.zanussi@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Wed, 21 Mar 2018 15:37:15 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> On Wed, 21 Mar 2018 15:31:27 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the ftrace tree got a conflict in:
> > 
> >   Documentation/trace/ftrace.txt
> >   (converted to Documentation/trace/ftrace.rst)  
> 
> There was another conflict involving
> 
>   Documentation/trace/events.{txt,rst}
> 
> Unfortunately, I accidentally deleted the report email before sending
> it :-(
> 

Ug yeah. All the histogram code was ripped out of the events.txt and
a new file was created called histogram.txt. I'm guessing that should
also be converted into an .rst file.

-- Steve
