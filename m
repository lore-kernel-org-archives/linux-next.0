From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: 2.6.28-rc3(-next20081103) suspend issues on Lenovo X200
Date: Tue, 4 Nov 2008 01:55:59 +0100
Message-ID: <200811040155.59933.rjw@sisk.pl>
References: <20081103153945.GA20618@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:43766 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753128AbYKDAvN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 3 Nov 2008 19:51:13 -0500
In-Reply-To: <20081103153945.GA20618@denkbrett.schottelius.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>, Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Monday, 3 of November 2008, Nico -telmich- Schottelius wrote:
> Updating my last post, system now runs with
> the new Debian xserver-xorg-intel package:
> 
> 2.6.28-rc3 and 2.6.28-rc3-next-20081103: acpi_sleep=s3_bios
>    - suspend on console works
>    - wakeup on console works
>    - xorg (intel 2.3.2-2+lenny5) works
>    - suspend on xorg works
>    - wakeup on xorg is BROKEN:
>       - console (kernel messages) is seen for a few seconds
>       - kernel switches back to X
>       - screen is partly drawn: X cursor is shown, background, no windows
>       - system hard reboots after about 20 seconds (watchdog?)
> 
> The Debian packages includes the lates G45 bugfix:
> 
> http://packages.debian.org/changelogs/pool/main/x/xserver-xorg-video-intel/xserver-xorg-video-intel_2.3.2-2+lenny5/changelog
> 
> So I'm waiting for your input on where to update what next ;-)

Jesse, any ideas?  Can that be related to the DRM problem with radeon?

Thanks,
Rafael
