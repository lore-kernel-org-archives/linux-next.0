From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: linux-next: manual merge of the pwm tree with the leds tree
Date: Fri, 23 May 2014 10:42:18 +0200
Message-ID: <20140523084218.GA13642@piout.net>
References: <20140522192423.1d9899dd@canb.auug.org.au>
 <20140523071940.GC6310@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:51677 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751038AbaEWImW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 23 May 2014 04:42:22 -0400
Content-Disposition: inline
In-Reply-To: <20140523071940.GC6310@ulmo>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>, Bryan Wu <cooloney@gmail.com>

On 23/05/2014 at 09:19:41 +0200, Thierry Reding wrote :
> On Thu, May 22, 2014 at 07:24:23PM +1000, Stephen Rothwell wrote:
> > Hi Thierry,
> > 
> > Today's linux-next merge of the pwm tree got a conflict in
> > drivers/leds/leds-pwm.c between commit 5f7b03dc2ab5 ("leds: leds-pwm:
> > provide a common function to setup a single led-pwm device") from the
> > leds tree and commit 81225bed3273 ("leds: leds-pwm: retrieve configured
> > PWM period") from the pwm tree.
> > 
> > I fixed it up (I think - see below) and can carry the fix as necessary
> > (no action is required).
> 
> The resolution below looks good to me. Thanks!
> 
> Alexandre, Bryan, as far as I can tell there are no dependencies between
> this patch and the rest of the series that Alexandre sent, so perhaps it
> would be a better idea to take this particular patch via Bryan's leds
> tree?
> 
> Then again the resolution looks like something that Linus can reasonably
> handle, so maybe things are fine as-is.
> 

I'm fine with either solution, tell me if you want me to rebase my
patch.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
