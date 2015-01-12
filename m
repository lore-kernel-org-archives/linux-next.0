From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: bf609: CONFIG_SND_BF6XX_PCM?
Date: Mon, 12 Jan 2015 11:08:33 +0100
Message-ID: <1421057313.22660.22.camel@x220>
References: <1408355615.21225.19.camel@x220>
	 <CAHG8p1Dt1yJPY809J5q=945EMTecLkD2+TAD2HqUaK-xso+dXg@mail.gmail.com>
	 <1409400293.21896.78.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cpsmtpb-ews07.kpnxchange.com ([213.75.39.10]:60947 "EHLO
	cpsmtpb-ews07.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752948AbbALKIf (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 12 Jan 2015 05:08:35 -0500
In-Reply-To: <1409400293.21896.78.camel@x220>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Scott Jiang <scott.jiang.linux@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Steven Miao <realmz6@gmail.com>, adi-buildroot-devel@lists.sourceforge.net, linux-next@vger.kernel.org

Hi Scott,

[Added Stephen Rothwell and linux-next.]

On Sat, 2014-08-30 at 14:04 +0200, Paul Bolle wrote:
> On Fri, 2014-08-22 at 17:13 +0800, Scott Jiang wrote:
> > 2014-08-18 17:53 GMT+08:00 Paul Bolle <pebolle@tiscali.nl>:
> > > Your commit 1e3bc3e86be6 ("bf609: use new SND_BF6XX_PCM to choose audio
> > > pcm driver") landed in today's linux-next (ie, next-20140818).
> > >
> > > It adds two checks for CONFIG_SND_BF6XX_PCM. There's currently no
> > > Kconfig symbol SND_BF6XX_PCM in linux-next. I assume the code to add
> > > that symbol is queued somewhere. Is that correct?
> > >
> > I plan to merge tdm driver into bf6xx pcm driver and send patches to
> > Mark Brown next week. Also this patch in arch/blackfin will be
> > included. Is it ok?
> 
> I'm fine with about any way you'd like to resolve this. But if this
> hasn't changed in, say, a few months, I might send you a reminder.

These two checks can still be found in next-20150112. Since there's no
Kconfig symbol SND_BF6XX_PCM they will both evaluate to false. So this
is a reminder for this issue.

Are you still planning on adding that Kconfig symbol or should these two
checks (and the code they hide in linux-next) be removed?


Paul Bolle
