From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: Mali DP tree for linux-next
Date: Wed, 15 Jun 2016 17:21:02 +0200
Message-ID: <20160615152102.GH1338@phenom.ffwll.local>
References: <20151223143022.GY960@e106497-lin.cambridge.arm.com>
 <20160615150304.GD9711@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f169.google.com ([209.85.217.169]:33636 "EHLO
	mail-lb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932842AbcFOPVG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Jun 2016 11:21:06 -0400
Received: by mail-lb0-f169.google.com with SMTP id xp5so3549523lbb.0
        for <linux-next@vger.kernel.org>; Wed, 15 Jun 2016 08:21:05 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160615150304.GD9711@e106497-lin.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

On Wed, Jun 15, 2016 at 04:03:04PM +0100, Liviu Dudau wrote:
> Hi Stephen,
> 
> I would like to add the Mali DP DRM driver tree to linux-next. I'm planning
> to send a pull request for inclusion into v4.8 and I hope that getting a
> wider exposure for a few weeks is beneficial.
> 
> Please add the following git tree:
> 
>    git://linux-arm.org/linux-ld for-upstream/mali-dp
> 
> It is based on drm-intel/topic/drm-misc tree, with the topic/drm-misc-2016-06-14 tag.

tbh just send Dave a pull request. It looks pretty nice, and inclusion in
drm-next is even better than linux-next for handling any kinds of
conflicts. And most of the driver trees aren't really active for more than
1 merge window it seems.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
