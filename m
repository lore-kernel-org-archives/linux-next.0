From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] leds: pm8058: Make ledtype pointer sized type
Date: Thu, 30 Nov 2017 21:10:52 -0800
Message-ID: <20171201051052.GX28761@minitux>
References: <20171130113516.42c8bde2@canb.auug.org.au>
 <20171130030543.1071-1-bjorn.andersson@linaro.org>
 <20171130094019.GA21887@amd>
 <545eb1a6-3235-9fe6-1d0d-958aa13e5170@gmail.com>
 <20171130223406.GC2808@amd>
 <20171201101351.3e57f2b1@canb.auug.org.au>
 <20171201002858.GD2808@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pl0-f46.google.com ([209.85.160.46]:40579 "EHLO
        mail-pl0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750892AbdLAFK7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 1 Dec 2017 00:10:59 -0500
Received: by mail-pl0-f46.google.com with SMTP id 1so5657142pla.7
        for <linux-next@vger.kernel.org>; Thu, 30 Nov 2017 21:10:58 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171201002858.GD2808@amd>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>

On Thu 30 Nov 16:28 PST 2017, Pavel Machek wrote:

> Hi!
> 
> > > > of_device_get_match_data will return PM8058_LED_TYPE_*
> > > > which clearly is a led type identifier.
> > > > 
> > > > Thus unsigned long looks reasonable.  
> > > 
> > > Hmm. Ok. So u32 would actually make even more sense there (because
> > > PM8058_LED_TYPE_* does not really need to be 64-bit), but it would
> > > cause a warning.
> > > 
> > > I don't like this. This fix actually makes code waste memory and is
> > > uglier.
> > > 
> > > ...but we get a warning fix. So I don't like the patch, but it is an
> > > improvement...
> > 
> > I *think* you can get away with (u32)(unsigned long)ptr ...
> 
> Yes, that should work. It would actually be my preferred solution.
> 

I'm fine with this suggestion, and it silence the warning. I will update
and resend the patch.

Regards,
Bjorn
