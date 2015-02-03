From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] staging: ft1000: fix braces warning
Date: Tue, 03 Feb 2015 12:14:24 -0800
Message-ID: <1422994464.30476.45.camel@perches.com>
References: <1422989883-16937-1-git-send-email-bilel.dr@gmail.com>
	 <1422990308.30476.37.camel@perches.com>
	 <20150203200530.GA15325@bill-Lenovo-IdeaPad-Z510>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay0008.hostedemail.com ([216.40.44.8]:55941 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S966604AbbBCUO2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Feb 2015 15:14:28 -0500
In-Reply-To: <20150203200530.GA15325@bill-Lenovo-IdeaPad-Z510>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: bill <bilel.dr@gmail.com>
Cc: marek.belisko@gmail.com, gregkh@linuxfoundation.org, tapaswenipathak@gmail.com, gdonald@gmail.com, aybuke.147@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

On Tue, 2015-02-03 at 21:05 +0100, bill wrote:
> Ok,thank you, I will do that and resend the patch again.

I wouldn't.
It's probably better as a separate patch anyway.

btw: please don't top post.

cheers, Joe

> On Tue, Feb 03, 2015 at 11:05:08AM -0800, Joe Perches wrote:
> > On Tue, 2015-02-03 at 19:58 +0100, Bilel DRIRA wrote:
> > > This patch fix the checkpatch.pl WARNING:
> > []
> > > diff --git a/drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.c b/drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.c
> > []
> > > @@ -1963,11 +1948,10 @@ static irqreturn_t ft1000_interrupt(int irq, void *dev_id)
[]
> > trivia: the logic here is generally better inverted:
