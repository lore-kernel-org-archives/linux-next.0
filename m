From: Neil Horman <nhorman@tuxdriver.com>
Subject: Re: linux-next: net tree build warning
Date: Fri, 22 May 2009 06:31:58 -0400
Message-ID: <20090522103158.GA967@hmsreliant.think-freely.org>
References: <20090522151642.e79e22ee.sfr@canb.auug.org.au> <20090521.233038.195647453.davem@davemloft.net> <20090522182024.cfe48be4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58]:56765 "EHLO
	smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751000AbZEVKcI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 22 May 2009 06:32:08 -0400
Content-Disposition: inline
In-Reply-To: <20090522182024.cfe48be4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

On Fri, May 22, 2009 at 06:20:24PM +1000, Stephen Rothwell wrote:
> Hi Dave,
> 
> On Thu, 21 May 2009 23:30:38 -0700 (PDT) David Miller <davem@davemloft.net> wrote:
> >
> > I just pushed the following to fix this:
> > 
> > net: Fix arg to trace_napi_poll() in netpoll.
> 
> Thanks. I remerged the net tree at the end of linux-next today in case
> anyone was doing any testing over the weekend. 
> 
Damnit, thanks for the fixup guys.
Neil
