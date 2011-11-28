From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: build failure after merge of the drm tree
Date: Mon, 28 Nov 2011 11:33:23 +0000
Message-ID: <20111128113323.7d272081@lxorguk.ukuu.org.uk>
References: <20111116113007.5656a7b4823ba085a46c57ae@canb.auug.org.au>
	<20111125124913.405fc8360a185f3116adb5ec@canb.auug.org.au>
	<20111125103011.18e167cd@lxorguk.ukuu.org.uk>
	<20111128135204.33bb929d7495d7830d09dfc3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:53245 "EHLO
	earthlight.etchedpixels.co.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752519Ab1K1Lb7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Nov 2011 06:31:59 -0500
In-Reply-To: <20111128135204.33bb929d7495d7830d09dfc3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Barnes <jbarnes@virtuousgeek.org>, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Rob Clark <rob.clark@linaro.org>, Greg KH <greg@kroah.com>

> Then if you are moving a driver out of staging, you should put a patch in
> your tree to disable it in staging (or remove it in staging) and send
> that patch to Greg as well.

I was migrating *part* of it. You've forced me to mark it all broken
despite several requests (to which no reply was recieved) not to do so
simply so the poor DRM team can get their work done. As a result anyone
working off Medfield hardware will have to go use other trees. In this
case it's not going to hurt anyone I suspect but who knows in future if
this sort of thing occurs again.

Staging build fail - just mark the staging item as broken, that or stop
including staging in -next.

Alan
