From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: linux-next: manual merge of the arm-soc tree with the usb tree
Date: Tue, 27 Aug 2013 18:30:50 +0200
Message-ID: <521CD43A.4040000@linutronix.de>
References: <20130827181353.319c150858829df1bb68d60b@canb.auug.org.au> <521C6961.9020103@linutronix.de> <CABxcv=mg6t5wPqpF3j5sr_76qfZ7N7KgpWhcKSGoPTOcaR=V6A@mail.gmail.com> <521CA888.1080909@baylibre.com> <521CAF59.1090203@linutronix.de> <521CB046.9070408@baylibre.com> <878uznxjnl.fsf@linaro.org> <521CC4E3.8030204@linutronix.de> <20130827161203.GA22852@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:38301 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751954Ab3H0Qa7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Aug 2013 12:30:59 -0400
In-Reply-To: <20130827161203.GA22852@quad.lixom.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: Kevin Hilman <khilman@linaro.org>, Benoit Cousson <bcousson@baylibre.com>, Javier Martinez Canillas <javier@dowhile0.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Felipe Balbi <balbi@ti.com>, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 08/27/2013 06:12 PM, Olof Johansson wrote:
> No. Read that email again. What Benoit said was that if Felipe was fine
> with the change _HE_ would take it. Huge difference, and one that would have
> avoided this situation.

Yes, I'm sorry.

> The only way to solve these things in the future is to make the driver handle
> both the new and the old binding. Bindings are not supposed to change in
> incompatible ways any more, unless for special circumstances and/or when the
> old binding was completely broken.
The old bindings were completly broken.

> -Olof

Sebastian
