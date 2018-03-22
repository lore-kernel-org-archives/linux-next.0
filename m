From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: manual merge of the ftrace tree with the jc_docs
 tree
Date: Thu, 22 Mar 2018 09:41:17 -0400
Message-ID: <20180322094117.37f3a2fd@gandalf.local.home>
References: <20180321153127.23737f6e@canb.auug.org.au>
        <20180321153715.3a571e5b@canb.auug.org.au>
        <20180321091554.2b38ee57@gandalf.local.home>
        <1521665752.31081.10.camel@tzanussi-mobl.amr.corp.intel.com>
        <20180322092108.0d821abc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180322092108.0d821abc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Changbin Du <changbin.du@intel.com>
List-Id: linux-next.vger.kernel.org

On Thu, 22 Mar 2018 09:21:08 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > I can repost the whole thing as v10, or whatever makes sense here.  
> 
> Thanks, I assume that they apply on top of the jc_docs tree as well
> (git://git.lwn.net/linux.git#docs-next).  If so, then I can use them as
> merge resolutions, or Steve can rebase his tree (minus your old
> patches) on top of the (hopefully unchanging) jc_docs tree and then he
> could apply your patches there.

Too late for a rebase. I've already run it through my tests and posted,
I don't rebase anything that goes to linux-next unless there's a really
good reason to do so. I don't think this is one.

I'll just make sure Linus knows about it and have a link to point to
the proper end results. He's stated he's fine with those kinds of
solutions. And since this is only a documentation conflict, we don't
need to worry about mistakes causing subtle behavior with the kernel.

-- Steve
