From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: linux-next: build warning after merge of the fsi tree
Date: Tue, 24 Jul 2018 10:05:41 +0200
Message-ID: <20180724080541.GA29845@kroah.com>
References: <20180724160356.7f5a018d@canb.auug.org.au>
 <e3a66e2364db2e5439ca8e08cb0def3195d303a4.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e3a66e2364db2e5439ca8e08cb0def3195d303a4.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Jul 24, 2018 at 04:39:19PM +1000, Benjamin Herrenschmidt wrote:
> On Tue, 2018-07-24 at 16:03 +1000, Stephen Rothwell wrote:
> > Hi Benjamin,
> > 
> > After merging the fsi tree, today's linux-next build (x86_64 allmodconfig)
> > produced this warning:
> 
> Ah thanks. It's a pair of missing "z" qualifiers in those dev_dbg.
> 
> This normally won't show as this driver can only be enabled on 32-bit
> ARM, but COMPILE_TEST will allow you to build it on x86_64 thus
> triggering the warning.
> 
> I've pushed a fix in the fsi tree.
> 
> Greg, do you want a new signed tag with the fix or that can wait
> for my next pull request ? I have a last bunch of chardev conversions
> and object lifetime fixes being reviewed that I was thinking of sending
> later this week.

Later this week is fine.

thanks,

greg k-h
