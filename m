From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: next-20160330 build: 1 failures 7 warnings (next-20160330)
Date: Wed, 30 Mar 2016 19:47:42 +0200
Message-ID: <20160330194742.57866ab6@bbrezillon>
References: <E1alA47-0002T1-O5@optimist>
	<20160330163545.GF2350@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:42253 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753498AbcC3Rrp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 30 Mar 2016 13:47:45 -0400
In-Reply-To: <20160330163545.GF2350@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Alexey Brodkin <abrodkin@synopsys.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi Mark,

On Wed, 30 Mar 2016 09:35:45 -0700
Mark Brown <broonie@kernel.org> wrote:

> On Wed, Mar 30, 2016 at 07:57:19AM +0100, Build bot for Mark Brown wrote:
> 
> Today's -next fails to build an arm allmodconfig due to:
> 
> > 	arm-allmodconfig
> > ../drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c:618:2: error: implicit declaration of function 'drm_connector_unplug_all' [-Werror=implicit-function-declaration]
> 
> which appears to be triggered by a missed update in 6c87e5c3ec6db0 (drm:
> Rename drm_connector_unplug_all() to drm_connector_unregister_all())
> due to this driver being newly added in a different tree.

Daniel already fixed it here [1].

[1]http://www.spinics.net/lists/dri-devel/msg103521.html


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
