From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: build failure after merge of the kgdb tree
Date: Thu, 20 May 2010 18:23:41 -0700
Message-ID: <20100521012340.GA12372@core.coreip.homeip.net>
References: <20100323150443.608ad7f0.sfr@canb.auug.org.au>
 <20100325154307.9cdeae10.sfr@canb.auug.org.au>
 <201003242159.25770.dmitry.torokhov@gmail.com>
 <20100521102158.bf6df441.sfr@canb.auug.org.au>
 <4BF5D8AF.6010408@windriver.com>
 <20100521110938.7bbbbf59.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100521110938.7bbbbf59.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jason Wessel <jason.wessel@windriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, May 21, 2010 at 11:09:38AM +1000, Stephen Rothwell wrote:
> Hi Jason,
> 
> On Thu, 20 May 2010 19:49:51 -0500 Jason Wessel <jason.wessel@windriver.com> wrote:
> >
> > Before brute force toggling it, it seems we should check the value and
> > restore it after the execution of handle_sysrq().
> 
> Indeed, at the time I couldn't find an easy way to do that.
> 
> > I'll have to look and see if there is an access function for this.
> 
> Great, thanks.

I would not mind re-exporting sysrq_on() again.

-- 
Dmitry
