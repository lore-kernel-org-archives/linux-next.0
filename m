From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: 2.6.28-rc4 suspend issues on Lenovo X200
Date: Sun, 16 Nov 2008 00:24:44 +0100
Message-ID: <200811160024.45156.rjw@sisk.pl>
References: <20081114115451.GB4877@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:41269 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751815AbYKOXTo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 15 Nov 2008 18:19:44 -0500
In-Reply-To: <20081114115451.GB4877@denkbrett.schottelius.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jesse Barnes <jbarnes@virtuousgeek.org>

On Friday, 14 of November 2008, Nico -telmich- Schottelius wrote:
> Hello!
> 
> Using 2.6.28-rc4 and *NO* acpi_sleep=s3_bios:
> 
>    - suspend and wakeup on console works (!)
>       -> this is new, before screen was black after wakeup
>    - suspend on x11 works
>      wakeup on x11 freezes, causes automatic reboot
>    - switch away from x11 to console,
>      suspend on console:
>          wakeup -> works
>          switch to x11 -> freeze & reboot
> 
> It would be nice, if someone could CC me to
> 
>    'nico-linux-lenovox200-suspend at schottelius.org'
> 
> if there is some progress made. Currently it's just getting
> me tired always having to fsck the filesystem after a suspend
> try.

Well, given that you appear to be the only person able to reproduce this
problem, it'll rather be difficult to debug it without your help.

Thanks,
Rafael
