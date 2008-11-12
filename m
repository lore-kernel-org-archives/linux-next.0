From: "Rob Latham" <rlatham@gmail.com>
Subject: Re: 2.6.28-rc3(-next20081103) suspend issues on Lenovo X200
Date: Wed, 12 Nov 2008 14:49:56 -0600
Message-ID: <67f22cb80811121249n300177c8l26a57aaf0030120b@mail.gmail.com>
References: <20081103153945.GA20618@denkbrett.schottelius.org>
	 <200811040155.59933.rjw@sisk.pl>
	 <200811031704.25717.jbarnes@virtuousgeek.org>
	 <20081105173132.GA4289@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.172]:34467 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752844AbYKLUt5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 12 Nov 2008 15:49:57 -0500
Received: by wf-out-1314.google.com with SMTP id 27so584149wfd.4
        for <linux-next@vger.kernel.org>; Wed, 12 Nov 2008 12:49:56 -0800 (PST)
In-Reply-To: <20081105173132.GA4289@denkbrett.schottelius.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>, Jesse Barnes <jbarnes@virtuousgeek.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-next@vger.kernel.org, LKML <linux-k>

On Wed, Nov 5, 2008 at 11:31 AM, Nico -telmich- Schottelius
<nico-linux-next@schottelius.org> wrote:
> When running xorg the system freezes on wakeup and hard reboots after
> 20 seconds (again: looks like some kind of watchdog, though I am not
> aware of anything like that in the X200).
>
> Sincerly,
>
> Nico (again: looks like some kind of watchdog, though I am not
> aware of anything like that in the X200).

Hi Nico, all.

I've had good results disabling one core before suspending, and then
enabling the extra core after wakeup.   The watchdog in that case
might not be the intel driver at all, but rather something in the
kernel that kicks in in such conditions?

http://ubuntuforums.org/showpost.php?p=6105510&postcount=12

(I put the "sleep before enabling 2nd core" in the background and for
a longer period of time)

Suspending/resuming in this single-core mode has worked really well
for me for the last day or so.

Hope that helps  point to the root cause...
==rob
