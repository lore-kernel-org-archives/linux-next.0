From: Rob Herring <robh@kernel.org>
Subject: Re: Crash in -next due to 'drivers/of: Fix depth when unflattening devicetree'
Date: Thu, 19 May 2016 09:47:38 -0500
Message-ID: <CAL_Jsq+g2T66Q7tMJq7iHncHPSk=MUfqz=zDG7-a3KtH==NLmA@mail.gmail.com>
References: <20160519031112.GA12007@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:38854 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754321AbcESOsB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 May 2016 10:48:01 -0400
In-Reply-To: <20160519031112.GA12007@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rhyland Klein <rklein@nvidia.com>, linux-next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, May 18, 2016 at 10:11 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> Hi,
>
> some of my ppc qemu tests crash with the following log message.
>
> VFS: Cannot open root device "hda" or unknown-block(0,0): error -6
> Please append a correct "root=" boot option; here are the available partitions:
> 0100            4096 ram0  (driver?)
> 0101            4096 ram1  (driver?)
> 0102            4096 ram2  (driver?)
> 0103            4096 ram3  (driver?)
> 0104            4096 ram4  (driver?)
> 0105            4096 ram5  (driver?)
> 0106            4096 ram6  (driver?)
> 0107            4096 ram7  (driver?)
> 0108            4096 ram8  (driver?)
> 0109            4096 ram9  (driver?)
> 010a            4096 ram10  (driver?)
> 010b            4096 ram11  (driver?)
> 010c            4096 ram12  (driver?)
> 010d            4096 ram13  (driver?)
> 010e            4096 ram14  (driver?)
> 010f            4096 ram15  (driver?)
> 1600            8383 hdc  driver: ide-gd
> Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
>
> A complete boot log is available at
> http://kerneltests.org/builders/qemu-ppc-next/builds/408/steps/qemubuildcommand/logs/stdio
>
> Bisect points to commit 'drivers/of: Fix depth when unflattening devicetree'.
> Reverting this commit fixes the problem. Bisect log is attached.

I've pushed out a fix this morning with an updated version of that
patch [1]. Please test.

Rob
