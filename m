From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: linux-next not booting on snowball
Date: Thu, 1 Dec 2011 14:03:34 -0500 (EST)
Message-ID: <alpine.LFD.2.02.1112011400380.2357@xanadu.home>
References: <4ED79454.1090304@linaro.org> <20111201145801.GB2103@sirena.org.uk> <4ED79E9F.7060103@linaro.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:57881 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755759Ab1LATDi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 1 Dec 2011 14:03:38 -0500
Received: by qadb14 with SMTP id b14so575733qad.19
        for <linux-next@vger.kernel.org>; Thu, 01 Dec 2011 11:03:38 -0800 (PST)
In-Reply-To: <4ED79E9F.7060103@linaro.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Lists Linaro-dev <linaro-dev@lists.linaro.org>, Stephen Warren <swarren@nvidia.com>, Kevin Hilman <khilman@ti.com>, Jamie Iles <jamie@jamieiles.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Thu, 1 Dec 2011, Daniel Lezcano wrote:

> On 12/01/2011 03:58 PM, Mark Brown wrote:
> > On Thu, Dec 01, 2011 at 03:51:00PM +0100, Daniel Lezcano wrote:
> > 
> >> commit 549158d2ab01e8370d2773044fe09738a26f7086
> >> Author: Nicolas Pitre <nicolas.pitre@linaro.org>
> >> Date:   Thu Aug 25 00:35:59 2011 -0400
> > 
> >>     ARM: move iotable mappings within the vmalloc region
> >>    
> > 
> > I recently reported an issue with this patch on s3c64xx which I'm
> > avoiding with the below change, I believe Nicolas folded this in to his
> > code but it's not propagated into -next yet.
> > 
[...]
> 
> Thanks for the patch Mark. I applied it and tried to boot but the kernel
> is still stuck on the same place :(

Please have a look at this email:

http://article.gmane.org/gmane.linux.ports.arm.kernel/141386

There are two patches in there which should help you get some debugging 
info out.


Nicolas
