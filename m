From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: linux-next: build failure after merge of the rtc tree
Date: Wed, 31 May 2017 09:19:07 +0200
Message-ID: <20170531071907.qzgmbvoazgd7ynd5@piout.net>
References: <20170531143349.561d5e77@canb.auug.org.au>
 <56de728c-b7eb-8093-e39e-41cf9b743d16@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:58685 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751011AbdEaHTK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 May 2017 03:19:10 -0400
Content-Disposition: inline
In-Reply-To: <56de728c-b7eb-8093-e39e-41cf9b743d16@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Lowe <dave-lowe@ntlworld.com>

Hi,

On 31/05/2017 at 07:45:07 +0200, Heiner Kallweit wrote:
> Am 31.05.2017 um 06:33 schrieb Stephen Rothwell:
> > Hi Alexandre,
> > 
> > After merging the rtc tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> > 
> > drivers/rtc/rtc-ds1307.c: In function 'ds1307_probe':
> > drivers/rtc/rtc-ds1307.c:1410:29: error: 'struct ds1307' has no member named 'client'
> >    if (chip->alarm && (ds1307->client->irq > 0 ||
> >                              ^
> ds1307->client->irq would have to be replaced with ds1307->irq.
> Same what the regmap patch does e.g. at line 1477.
> The regmap patch removes member client from struct ds1307.
> 

Yep, I did that. I actually forgot to push after fixing it up... Sorry
about that!

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
