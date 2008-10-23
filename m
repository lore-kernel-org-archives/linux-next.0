From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: Current suspend issues on Lenovo X200
Date: Fri, 24 Oct 2008 00:06:19 +0200
Message-ID: <200810240006.19857.rjw@sisk.pl>
References: <20081023204326.GB4175@denkbrett.schottelius.org> <20081023210707.GA5089@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:41141 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751589AbYJWWB4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Oct 2008 18:01:56 -0400
In-Reply-To: <20081023210707.GA5089@denkbrett.schottelius.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nico Schottelius <nico-linux-next@schottelius.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thursday, 23 of October 2008, Nico Schottelius wrote:
> First of all, this was wrong:
> 
> Nico -telmich- Schottelius [Thu, Oct 23, 2008 at 10:43:26PM +0200]:
> >  - 2.6.27: system freeze instead of wakeup
> >    -> shows parts of the X screen, but does not react on ping
> 
> System does not freeze, but reboots instead.
> 
> Tried next-20081023 and 2.6.27 with acpi_sleep=s3_bios:
> 
> - suspend and wakeup on console works fine for both!
> - no X running on next
> - 2.6.27 + X -> reboot on wakeup

Let me guess, you have a NVidia graphics?

Rafael
