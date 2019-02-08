From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Date: Fri, 8 Feb 2019 23:17:33 +0100
Message-ID: <20190208221733.GA31440@ravnborg.org>
References: <20190208123815.64757bc5@canb.auug.org.au>
 <CAKMK7uHOJwunZ0erM31fBNi+kADoK=Y=CRpoSTx=CRKFFL596w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKMK7uHOJwunZ0erM31fBNi+kADoK=Y=CRpoSTx=CRKFFL596w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Daniel/Stephen

Thanks for the report and the hints how to move forward to fix it.

> Sam, can you pls take a look at what komeda needs? you need to
> manually merge together drm-misc-next and drm-next first I think.

Merged the two tree and fixed build.
Undid the merge and checked that the build was still OK.

Patch sent to dri-devel:
https://lists.freedesktop.org/archives/dri-devel/2019-February/206662.html

> Dave, Maxime, Liviu: Heads up, drm-misc-next + drm-next will colide.
There was a trivial conflict when I merged, but in i915 so I just fixed
it up and kept focus on komeda.
So in other words, yes there is a conflict.

	Sam
