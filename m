From: Tony Lindgren <tony@atomide.com>
Subject: Re: linux-next: manual merge of the rtc tree with the omap tree
Date: Tue, 9 Apr 2019 07:22:01 -0700
Message-ID: <20190409142201.GC2839@atomide.com>
References: <20190409152226.5fecccd1@canb.auug.org.au>
 <1e3bc22e-97b5-3f63-c202-e04cfad48222@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1e3bc22e-97b5-3f63-c202-e04cfad48222@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

* Keerthy <j-keerthy@ti.com> [190409 13:25]:
> 
> 
> On 09/04/19 10:52 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the rtc tree got a conflict in:
> > 
> >    drivers/rtc/rtc-omap.c
> > 
> > between commit:
> > 
> >    6256f7f7f217 ("rtc: OMAP: Add support for rtc-only mode")
> > 
> > from the omap tree and commit:
> > 
> >    35118b7a4ea0 ("rtc: omap: let the core handle range")
> > 
> > from the rtc tree.
> > 
> > I fixed it up (I used the latter resolution around tm2bcd() changes) and
> > can carry the fix as necessary. This is now fixed as far as linux-next
> > is concerned, but any non trivial conflicts should be mentioned to your
> > upstream maintainer when your tree is submitted for merging.  You may
> > also want to consider cooperating with the maintainer of the conflicting
> > tree to minimise any particularly complex conflicts.
> 
> 
> Thanks Stephen. I have tested with Latest next and rtc+ddr mode is
> functional with an additional fix that Tony is about to queue.
> 
> I also reviewed the rtc driver and looks fine.

Thanks, it's probably better to keep the merge conflict rather
than bring in all the rest of the rtc tree changes in this
case.

Regards,

Tony
