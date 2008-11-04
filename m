From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: 2.6.28-rc3(-next20081103) suspend issues on Lenovo X200
Date: Mon, 3 Nov 2008 17:04:25 -0800
Message-ID: <200811031704.25717.jbarnes@virtuousgeek.org>
References: <20081103153945.GA20618@denkbrett.schottelius.org> <200811040155.59933.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-35.bluehost.com ([69.89.18.155]:45406 "HELO
	outbound-mail-35.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752171AbYKDBEc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Nov 2008 20:04:32 -0500
In-Reply-To: <200811040155.59933.rjw@sisk.pl>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Monday, November 3, 2008 4:55 pm Rafael J. Wysocki wrote:
> On Monday, 3 of November 2008, Nico -telmich- Schottelius wrote:
> > Updating my last post, system now runs with
> > the new Debian xserver-xorg-intel package:
> >
> > 2.6.28-rc3 and 2.6.28-rc3-next-20081103: acpi_sleep=s3_bios
> >    - suspend on console works
> >    - wakeup on console works
> >    - xorg (intel 2.3.2-2+lenny5) works
> >    - suspend on xorg works
> >    - wakeup on xorg is BROKEN:
> >       - console (kernel messages) is seen for a few seconds
> >       - kernel switches back to X
> >       - screen is partly drawn: X cursor is shown, background, no windows
> >       - system hard reboots after about 20 seconds (watchdog?)
> >
> > The Debian packages includes the lates G45 bugfix:
> >
> > http://packages.debian.org/changelogs/pool/main/x/xserver-xorg-video-inte
> >l/xserver-xorg-video-intel_2.3.2-2+lenny5/changelog
> >
> > So I'm waiting for your input on where to update what next ;-)
>
> Jesse, any ideas?  Can that be related to the DRM problem with radeon?

On many machines, we've found that re-POSTing the video device is incompatible 
with the i915 driver's suspend/resume functionality.  So things like s3_bios 
and vbetool shouldn't be used if the i915 driver works by itself.

-- 
Jesse Barnes, Intel Open Source Technology Center
