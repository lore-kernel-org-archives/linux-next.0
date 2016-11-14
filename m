From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the driver-core tree with the pm tree
Date: Mon, 14 Nov 2016 22:07:06 +0100
Message-ID: <8505055.Ay02BoB5Vi@vostro.rjw.lan>
References: <20161114130902.532c3c64@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:43122 "EHLO
        cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S933275AbcKNU7d (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Nov 2016 15:59:33 -0500
In-Reply-To: <20161114130902.532c3c64@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>

On Monday, November 14, 2016 01:09:02 PM Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in:
> 
>   drivers/base/power/main.c
> 
> between commit:
> 
>   6f75c3fd56da ("PM / sleep: don't suspend parent when async child suspend_{noirq, late} fails")
> 
> from the pm tree and commit:
> 
>   8c73b4288496 ("PM / sleep: Make async suspend/resume of devices use device links")
> 
> from the driver-core tree.

Well, right.  The device links series predates the Brian's fix (which is in -rc5
already, BTW).

> I fixed it up (maybe .. see below) and can carry the fix as necessary.

That's the correct one, thanks Stephen!

Cheers,
Rafael
