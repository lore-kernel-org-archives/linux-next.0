From: Arnd Bergmann <arnd.bergmann@linaro.org>
Subject: Re: linux-next: build failure after merge of the final tree (pwm tree related)
Date: Tue, 3 Jul 2012 09:00:53 +0000
Message-ID: <201207030900.53470.arnd.bergmann@linaro.org>
References: <20120629174826.546cc991459b12833f2aaebd@canb.auug.org.au> <201206301920.21158.arnd.bergmann@linaro.org> <CAMuHMdVBs=i5i02_AxZ7CHBukmrj-ik-EjDTG58hZaLkxkc+dQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:59355 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753951Ab2GCJA5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Jul 2012 05:00:57 -0400
In-Reply-To: <CAMuHMdVBs=i5i02_AxZ7CHBukmrj-ik-EjDTG58hZaLkxkc+dQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thierry Reding <thierry.reding@avionic-design.de>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>

On Tuesday 03 July 2012, Geert Uytterhoeven wrote:
> > I think that all the drivers that are not converted to the common PWM
> > layer yet should depend on not enabling the common code. Once they
> > are all moved over, that dependency will go away.
> 
> Hence you cannot have a single kernel image that contains both legacy and new
> drivers. I don't know whether there's any such combination that makes sense,
> though.

No, it's not a problem really: Before the new layer was added, any combination
of PWM drivers would conflict, the entire point of the common PWM code is
to make it possible that to put some drivers into the same kernel. Over time
I'd hope that all drivers get moved over, so we can have any combination.

	Arnd
