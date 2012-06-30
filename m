From: Arnd Bergmann <arnd.bergmann@linaro.org>
Subject: Re: linux-next: build failure after merge of the final tree (pwm tree related)
Date: Sat, 30 Jun 2012 20:12:32 +0000
Message-ID: <201206302012.32476.arnd.bergmann@linaro.org>
References: <20120629174826.546cc991459b12833f2aaebd@canb.auug.org.au> <201206301920.21158.arnd.bergmann@linaro.org> <20120630194139.GA24300@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:51728 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751158Ab2F3UMn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 30 Jun 2012 16:12:43 -0400
In-Reply-To: <20120630194139.GA24300@avionic-0098.mockup.avionic-design.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>

On Saturday 30 June 2012, Thierry Reding wrote:
> > I think that all the drivers that are not converted to the common PWM
> > layer yet should depend on not enabling the common code. Once they
> > are all moved over, that dependency will go away.
> 
> Right. That's exactly what I meant. If we add depends on !HAVE_PWM to
> the PWM symbol that should result in both options conflicting, and
> therefore not being built at the same time.

But I would add it to all other ones then, not the generic one!

One question though: if the generic pwm implementation does not set
HAVE_PWM, how can a driver check its presence?

	Arnd
