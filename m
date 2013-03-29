From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [PATCH -next] sound/soc/codecs: Mark snd-soc-wm2200 and
 snd-soc-wm-adsp as BROKEN
Date: Fri, 29 Mar 2013 14:45:54 -0400
Message-ID: <1364582754.3559.66.camel@thor.lan>
References: <1364566347-29941-1-git-send-email-peter@hurleysoftware.com>
	 <20130329171229.GD18316@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout01.c08.mtsvc.net ([205.186.168.189]:38385 "EHLO
	mailout01.c08.mtsvc.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756359Ab3C2SqC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Mar 2013 14:46:02 -0400
In-Reply-To: <20130329171229.GD18316@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Xiong Zhou <jencce.kernel@gmail.com>

On Fri, 2013-03-29 at 17:12 +0000, Mark Brown wrote:
> On Fri, Mar 29, 2013 at 10:12:27AM -0400, Peter Hurley wrote:
> 
> > The linux-next tree has failed to build for last 7 days with these
> > errors:
> 
> In some pretty specific and basically unrealistic configurations rather
> than anything a human is likely to want to use or the core automatic
> ones.
> 
> >   MODPOST 2490 modules
> >   ERROR: "arizona_rate_text" [sound/soc/codecs/snd-soc-wm-adsp.ko] undefined!
> >   ERROR: "arizona_rate_val" [sound/soc/codecs/snd-soc-wm-adsp.ko] undefined!
> >   WARNING: modpost: Found 5 section mismatch(es).
> 
> > Patches submitted by Xiong Zhou <jencce.kernel@gmail.com> to fix this
> > have been rejected.
> 
> > Until the author(s) resolve the situation, mark the offenders as BROKEN.
> 
> I'm not going to apply this, it's clearly not a constructive or helpful
> effort to address the issue - it's not engaging with any of the
> discussion about how to resolve the issue (there's no mention of the
> suggested fix for example).
> 
> If you're going to run randconfigs that's great and the testing is
> useful but if you're going to send patches as well as reports it would
> be really helpful to look at what the code is doing so that the change
> makes sense rather than just sending the first thing that springs to
> mind.  The smarter the stuff that gets sent is the more likely it is to
> either get merged or encourage people to work on the problem.
> 
> In this case it seems like Xiong is likely to fix things and it'd be
> much better overall to get a fix from Xiong merged (which we seem to be
> progressing towards).

This is stock Ubuntu configs.
