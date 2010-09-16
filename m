From: Amit Shah <amit.shah@redhat.com>
Subject: Re: linux-next: manual merge of the bkl-llseek tree with the rr tree
Date: Thu, 16 Sep 2010 14:26:08 +0530
Message-ID: <20100916085608.GB8159@amit-laptop.redhat.com>
References: <20100915132646.4aef58f8.sfr@canb.auug.org.au>
 <20100916065438.GE2429@amit-laptop.redhat.com>
 <201009161020.01392.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201009161020.01392.arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>
List-Id: linux-next.vger.kernel.org

On (Thu) Sep 16 2010 [10:20:01], Arnd Bergmann wrote:
> On Thursday 16 September 2010 08:54:39 Amit Shah wrote:
> > Arnd, the device is supposed to be non-seekable so I'll add a
> > nonseekable_open() to the open() call.
> > 
> > So I guess the llseek operation should ne no_llseek instead of
> > noop_llseek.  Will you change that in your patchset?  Should I do that
> > in the patch I'll queue up?
> 
> Yes, I think it's best if you just do both changes in your patch, I'll
> drop this file from my series then.

Great, I'll queue that up.

		Amit
