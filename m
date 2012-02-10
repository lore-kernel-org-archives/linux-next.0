From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Fri, 10 Feb 2012 09:43:59 -0800
Message-ID: <20120210174359.GB5128@kroah.com>
References: <20120210155800.ccef418fd5c2f2b87a5d6315@canb.auug.org.au>
 <20120210052947.GA2068@kroah.com>
 <80f07411-179e-4fe9-b591-32fbcaac414b@default>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <80f07411-179e-4fe9-b591-32fbcaac414b@default>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Magenheimer <dan.magenheimer@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Seth Jennings <sjenning@linux.vnet.ibm.com>, Nitin Gupta <ngupta@vflare.org>, Konrad Wilk <konrad.wilk@oracle.com>
List-Id: linux-next.vger.kernel.org

On Fri, Feb 10, 2012 at 09:21:46AM -0800, Dan Magenheimer wrote:
> > From: Greg KH [mailto:greg@kroah.com]
> > Subject: Re: linux-next: build failure after merge of the staging tree
> > 
> > On Fri, Feb 10, 2012 at 03:58:00PM +1100, Stephen Rothwell wrote:
> > > Hi Greg,
> > >
> > > After merging the staging tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > >
> > > drivers/staging/ramster/ramster_o2net.c: In function 'ramster_remote_async_get_request_handler':
> > > drivers/staging/ramster/ramster_o2net.c:91:2: error: implicit declaration of function
> > 'o2net_force_data_magic' [-Werror=implicit-function-declaration]
> > > drivers/staging/ramster/ramster_o2net.c: In function 'ramster_remote_put':
> > > drivers/staging/ramster/ramster_o2net.c:250:2: error: implicit declaration of function
> > 'o2net_nn_from_num' [-Werror=implicit-function-declaration]
> > > drivers/staging/ramster/zcache-main.c:40:64: fatal error: ../zram/xvmalloc.h: No such file or
> > directory
> > >
> > > Caused by commits ba351b02ab11 ("staging: ramster: local compression +
> > > tmem") and 14a3cd58dd4f ("staging: ramster: ramster-specific new files").
> > >
> > > I have used the version of the staging tree from next-20120209 for today.
> > 
> > Ugh, I wonder why it builds here, very odd.
> > 
> > Dan, care to send me a patch to fix this?
> 
> > > drivers/staging/ramster/zcache-main.c:40:64: fatal error: ../zram/xvmalloc.h: No such
> 
> Hmmm... it appears that Seth's zsmalloc patch for drivers/staging/zcache
> removed xvmalloc.[ch] from drivers/staging/zram while drivers/staging/ramster
> is still depending on it. :-(  I hadn't planned for both ramster
> and zsmalloc-replacing-xvmalloc to be merged at the same time... I guess
> this is exactly the kind of problem linux-next is designed to wring out!
> 
> Greg, FOR NOW, PLEASE JUST REVERT the ramster patchset from staging-next.
> I am working on a v5 anyway and will roll in a copy of the xvmalloc.[ch]
> code into it for now and, since Seth's patch should be in linux-next
> by the time I am done (hopefully next week), I can test build ramster v5
> with linux-next to ensure all the above problems are resolved before
> resubmitting.
> 
> (Seth, I could also switch ramster v5 to depend on zsmalloc instead of
> xvmalloc, but since I've done all my ramster testing on xvmalloc,
> I think I would prefer to make that transition later.)
> 
> Sorry, Stephen and Greg, for the hassle!

Ok, now reverted, what a mess...

greg k-h
