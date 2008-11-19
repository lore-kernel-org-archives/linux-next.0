From: "Kay Sievers" <kay.sievers@vrfy.org>
Subject: Re: linux-next: driver-core tree build failure
Date: Wed, 19 Nov 2008 01:40:42 +0100
Message-ID: <ac3eb2510811181640r6c864c7en28a097d3e7c1ab75@mail.gmail.com>
References: <20081119113031.28e2ae68.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.27]:10883 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750928AbYKSAkp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 18 Nov 2008 19:40:45 -0500
Received: by ey-out-2122.google.com with SMTP id 6so1285682eyi.37
        for <linux-next@vger.kernel.org>; Tue, 18 Nov 2008 16:40:42 -0800 (PST)
In-Reply-To: <20081119113031.28e2ae68.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org

On Wed, Nov 19, 2008 at 01:30, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>
> arch/powerpc/kernel/vio.c: In function 'vio_register_device_node':
> arch/powerpc/kernel/vio.c:1246: error: incompatible type for argument 1 of 'dev_name'
>
> Caused by commit 92136135687b1f8f5d3f03baa3cec40dbc6e73e9 ("powerpc:
> struct device - replace bus_id with dev_name(), dev_set_name()").
>
> I have dropped the driver-core tree (and the usb tree that depends on it)
> from linux-next for today.

Yep, a '&' is missing. It should be
  -                               __func__, viodev->dev.bus_id);
 +                               __func__, dev_name(&viodev->dev));

Is this the only one, or only the first failure you've seen with the
driver-core tree? Some of the patches we've been unable to test, and
unfortunately the maintainers didn't respond for weeks now.

Thanks,
Kay
