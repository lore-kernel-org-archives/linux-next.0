From: Pavel Machek <pavel@suse.cz>
Subject: Re: 2.6.28-rc4 suspend issues on Lenovo X200
Date: Wed, 19 Nov 2008 17:53:04 +0100
Message-ID: <20081119165304.GA2009@ucw.cz>
References: <20081114115451.GB4877@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754500AbYKSQxZ@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20081114115451.GB4877@denkbrett.schottelius.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri 2008-11-14 12:54:51, Nico -telmich- Schottelius wrote:
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

Seems like a X problem to me.... can you try to run X with fbdev
driver?

> It would be nice, if someone could CC me to
> 
>    'nico-linux-lenovox200-suspend at schottelius.org'

Cc yourself, I always do group replies...
								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
