From: Kevin Winchester <kjwinchester@gmail.com>
Subject: Re: linux-next: Tree for December 17 (Radeon DRM BUG)
Date: Fri, 19 Dec 2008 21:58:54 -0400
Message-ID: <494C515E.9040403@gmail.com>
References: <20081217232536.0b18f4a7.sfr@canb.auug.org.au>	 <494995D7.6090009@gmail.com> <21d7e9970812172247t3d67e6f0waffa99587e2e024b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gx0-f13.google.com ([209.85.217.13]:43009 "EHLO
	mail-gx0-f13.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752581AbYLTB66 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Dec 2008 20:58:58 -0500
In-Reply-To: <21d7e9970812172247t3d67e6f0waffa99587e2e024b@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Dave Airlie <airlied@redhat.com>

Dave Airlie wrote:
> On Thu, Dec 18, 2008 at 10:14 AM, Kevin Winchester
> <kjwinchester@gmail.com> wrote:
>> Stephen Rothwell wrote:
>>> Hi all,
>>>
>>>
>> I get the following BUG in the radeon drm code with today's linux-next when
>> I run "startx".  I have not built or tested linux-next in a while, but the
>> problem definitely does not occur in mainline.
> 
> Do you have another X server running or just console?
> 
> can you get a full dmesg with
> 
> echo 1 > /sys/module/drm/parameters/debug
> 

I just tried today's next (20081219) and the problem seems to be fixed.

Thank you,

-- 
Kevin Winchester
