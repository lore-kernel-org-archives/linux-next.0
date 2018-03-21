From: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: Re: linux-next: manual merge of the ftrace tree with the jc_docs
 tree
Date: Wed, 21 Mar 2018 18:09:34 -0500
Message-ID: <1521673774.6961.4.camel@tzanussi-mobl.amr.corp.intel.com>
References: <20180321153127.23737f6e@canb.auug.org.au>
         <20180321153715.3a571e5b@canb.auug.org.au>
         <20180321091554.2b38ee57@gandalf.local.home>
         <1521665752.31081.10.camel@tzanussi-mobl.amr.corp.intel.com>
         <20180322092108.0d821abc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180322092108.0d821abc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Changbin Du <changbin.du@intel.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Thu, 2018-03-22 at 09:21 +1100, Stephen Rothwell wrote:
> Hi Tom,
> 
> On Wed, 21 Mar 2018 15:55:52 -0500 Tom Zanussi <tom.zanussi@linux.intel.com> wrote:
> >
> > Yeah, linux-next has changes to Documentation/trace/* that converts
> > those files to .rst, which linux-trace/frace/core doesn't have.
> > 
> > I've rebased the inter-event patches to linux-next/next-20180320 to
> > reflect those changes, which affect 9 of the files in the patchset.  The
> > updated patchset is here:
> > 
> > https://github.com/tzanussi/linux-trace-inter-event.git tzanussi/next-20180320-inter-event-v10                                               
> > https://github.com/tzanussi/linux-trace-inter-event/tree/tzanussi/next-20180320-inter-event-v10
> > 
> > I can repost the whole thing as v10, or whatever makes sense here.
> 
> Thanks, I assume that they apply on top of the jc_docs tree as well
> (git://git.lwn.net/linux.git#docs-next).  If so, then I can use them as
> merge resolutions, or Steve can rebase his tree (minus your old
> patches) on top of the (hopefully unchanging) jc_docs tree and then he
> could apply your patches there.
> 

Yes, just checked and they do apply on top of the jc_docs branch
mentioned.

Thanks,

Tom 
