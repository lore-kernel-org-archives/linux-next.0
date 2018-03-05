From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: linux-next: build failure after merge of the printk tree
Date: Mon, 5 Mar 2018 14:41:46 +0900
Message-ID: <20180305054146.GB6202@jagdpanzerIV>
References: <20180302160732.12691fbc@canb.auug.org.au>
 <20180302155454.eme5gplxdcltvwkw@pathway.suse.cz>
 <20180303144739.GA516@tigerII.localdomain>
 <20180305032005.GA4661@dhcp-128-65.nay.redhat.com>
 <CAEbi=3dz8OE_8JBZ17ihP7=YQamPPK-qewVjtYv4ZEy4jHC6ww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEbi=3dz8OE_8JBZ17ihP7=YQamPPK-qewVjtYv4ZEy4jHC6ww@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greentime Hu <green.hu@gmail.com>, Dave Young <dyoung@redhat.com>, Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Tejun Heo <tj@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On (03/05/18 13:27), Greentime Hu wrote:
[..]
> >> Opinions? Will this work?
> >
> > I would think b) is better, thanks for the fix!
> >
> Hi,
> 
> b works in nds32.
> Thanks for the fix :)

Greentime, Dave, thanks!

I'll send out a patch then.

Petr, once the patch has enough Ack/etc do you want to pick it up?
We need to merge it first, before Dave's patch.

	-ss
