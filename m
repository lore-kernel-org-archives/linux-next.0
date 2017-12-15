From: Vincent Pelletier <plr.vincent@gmail.com>
Subject: Re: linux-next: Tree for Dec 14 (usb/dwc3)
Date: Fri, 15 Dec 2017 14:53:32 +0000
Message-ID: <20171215145325.7c4cd727@gmail.com>
References: <20171214180617.5bbff2ec@canb.auug.org.au>
        <9d07169a-c00d-e302-f373-f4431899941b@infradead.org>
        <87wp1ol81e.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87wp1ol81e.fsf@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hello,

On Fri, 15 Dec 2017 10:17:17 +0200, Felipe Balbi <balbi@kernel.org>
wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
> > On 12/13/2017 11:06 PM, Stephen Rothwell wrote:  
> >> Hi all,
> >> 
> >> Changes since 20171213:
> >>   
> >
> > on i386:
> >
> > ERROR: "__tracepoint_dwc3_writel" [drivers/usb/dwc3/dwc3.ko] undefined!
> > ERROR: "__tracepoint_dwc3_readl" [drivers/usb/dwc3/dwc3.ko] undefined!
> >
> >
> >
> > I can send the randconfig file is you need it.  
> 
> please do. write/readl tracepoints haven't changed in ages :-)

Could it be related to this patch ?
  https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git/commit/?h=next&id=204ec1af6257a52fb80f43317f949b345040f9d1
It does touch dwc3_writel & dwc3_readl.
-- 
Vincent Pelletier
