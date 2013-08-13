From: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: linux-next: Tree for Aug 13 [ screen corruption in graphical
 mode ]
Date: Tue, 13 Aug 2013 17:34:39 +0100
Message-ID: <20130813163439.GA8805@cantiga.alporthouse.com>
References: <20130813092554.GA4519@cantiga.alporthouse.com>
 <CA+icZUUrJt_sJqp0CNMuM_b36tvv_rUskegLY5zcnm0w+JcW5Q@mail.gmail.com>
 <20130813093920.GB4519@cantiga.alporthouse.com>
 <CA+icZUVEcCTbBre99FWiDXRAMKcdQxUagXE-2-rO9g=YVUAieQ@mail.gmail.com>
 <20130813095259.GC4519@cantiga.alporthouse.com>
 <CA+icZUX6KM3dKrdX3Qkwg-DeBYobjQ+WG6oQEUjJQG3Q=qf+Sg@mail.gmail.com>
 <CA+icZUWPdivbDc=cBUR2BJzKGwWwK-P0OP0CZ5EfCupii7sP_w@mail.gmail.com>
 <CA+icZUUKH6Fa8WksqA69FXKUUJmKsNdXv0ZJH50HA2mFavfPCg@mail.gmail.com>
 <CA+icZUXC73i4hO7LHDQ=85__JtrZmSMB+KyUnS+G6vRmm_=tkg@mail.gmail.com>
 <CA+icZUXdS3EuXyGZiS1--rMu6H0ospzCiK_CXgPv8mOk0sMt+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from s16502780.onlinehome-server.info ([87.106.93.118]:53246 "EHLO
	fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1757806Ab3HMQfj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 13 Aug 2013 12:35:39 -0400
Content-Disposition: inline
In-Reply-To: <CA+icZUXdS3EuXyGZiS1--rMu6H0ospzCiK_CXgPv8mOk0sMt+Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>, DRI <dri-devel@lists.freedesktop.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, "s.dilek" <s.dilek@jpberlin.de>

On Tue, Aug 13, 2013 at 06:23:29PM +0200, Sedat Dilek wrote:
> On Tue, Aug 13, 2013 at 5:59 PM, Sedat Dilek <sedat.dilek@gmail.com> =
wrote:
> > I have bisected the issue on Linux v3.11-rc5 + drm-intel-nightly:
> >
> > 5456fe3882812aba251886e36fe55bfefb8e8829 is the first bad commit
> > commit 5456fe3882812aba251886e36fe55bfefb8e8829
> > Author: Chris Wilson <chris@chris-wilson.co.uk>
> > Date:   Thu Aug 8 14:41:07 2013 +0100
> >
> >     drm/i915: Allocate LLC ringbuffers from stolen
> >
> >     As stolen objects now behave identically (wrt to default LLC ca=
cheing)
> >     as their normal system counterparts, we no longer have to diffe=
rentiate
> >     our usage for ringbuffers. So allocate them from stolen on SNB+=
 as well.
> >
> >     Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> >     Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >     Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > :040000 040000 de063a052f39095f4d2f51b49caef9f827df41e8
> > 1c819aa5501a9fcc9912a5c7c037c71b9b9e9a6b M      drivers
> >
> > See also attached files!
> >
>=20
> With the attached revert-patch my system is OK (with my customized X =
stack).

No indication of a GPU hang? I'm puzzled as to how this ends up with th=
e
scanout being misread.

cat /sys/kernel/debug/dri/0/i915_gem_stolen
cat /sys/kernel/debug/dri/0/i915_gem_framebuffer

would be interesting.
-Chris

--=20
Chris Wilson, Intel Open Source Technology Centre
