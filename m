From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Date: Tue, 2 May 2017 18:41:32 +1000
Message-ID: <20170502184132.2c1b0299@canb.auug.org.au>
References: <20170421121014.3ee14a83@canb.auug.org.au>
        <20170424112512.582d04da@canb.auug.org.au>
        <20170502082518.jdk5tqjhvlsqntny@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:32969 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750955AbdEBIlg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 May 2017 04:41:36 -0400
In-Reply-To: <20170502082518.jdk5tqjhvlsqntny@phenom.ffwll.local>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Logan Gunthorpe <logang@deltatee.com>, Sumit Semwal <sumit.semwal@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>

Hi Daniel,

On Tue, 2 May 2017 10:25:18 +0200 Daniel Vetter <daniel@ffwll.ch> wrote:
>
> Since this is an all-new driver it might be best to stagger the pull
> requests and merge the new tee subsystem (or whatever it is) after drm?
> 
> Not sure what to best do here ...

This will merge via Dave, so Dave just needs to let Linus know that a
fix up is needed when this merges with the arm-soc stuff in Linus' tree.

-- 
Cheers,
Stephen Rothwell
