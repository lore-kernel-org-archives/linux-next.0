From: Arnd Bergmann <arnd.bergmann@linaro.org>
Subject: Re: linux-next: build failure after merge of the final tree (pwm tree related)
Date: Sat, 30 Jun 2012 19:20:21 +0000
Message-ID: <201206301920.21158.arnd.bergmann@linaro.org>
References: <20120629174826.546cc991459b12833f2aaebd@canb.auug.org.au> <20120630181006.GC23990@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:52924 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752066Ab2F3TUh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 30 Jun 2012 15:20:37 -0400
In-Reply-To: <20120630181006.GC23990@avionic-0098.adnet.avionic-design.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>

On Saturday 30 June 2012, Thierry Reding wrote:
> I hadn't thought about the allyesconfig case yet. Adding a "depends on
> !HAVE_PWM" to the PWM symbol should work and is the easiest fix to this
> kind of problem while other PWM legacy API implementations are ported to
> the PWM subsystem.
> 
> Sascha, Arnd (Cc'ed): what do you think?
> 
> I don't know if I'll get enough time to test this over the weekend but I
> should get to it when I'm back in the office on Monday.
> 
You cannot depend on a symbol in the same place that provides it -- that
would be a recursive dependency (or a paradox).

I think that all the drivers that are not converted to the common PWM
layer yet should depend on not enabling the common code. Once they
are all moved over, that dependency will go away.

	Arnd
