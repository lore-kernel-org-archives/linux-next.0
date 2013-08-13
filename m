From: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: linux-next: Tree for Aug 13 [ screen corruption in graphical
 mode ]
Date: Tue, 13 Aug 2013 10:52:59 +0100
Message-ID: <20130813095259.GC4519@cantiga.alporthouse.com>
References: <CA+icZUWmee5nTZCGvFb4vLpna5vUn+RJ-V9pHpKPFaTc96BG5Q@mail.gmail.com>
 <20130813092554.GA4519@cantiga.alporthouse.com>
 <CA+icZUUrJt_sJqp0CNMuM_b36tvv_rUskegLY5zcnm0w+JcW5Q@mail.gmail.com>
 <20130813093920.GB4519@cantiga.alporthouse.com>
 <CA+icZUVEcCTbBre99FWiDXRAMKcdQxUagXE-2-rO9g=YVUAieQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+icZUVEcCTbBre99FWiDXRAMKcdQxUagXE-2-rO9g=YVUAieQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>, DRI <dri-devel@lists.freedesktop.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, "s.dilek" <s.dilek@jpberlin.de>
List-Id: linux-next.vger.kernel.org

On Tue, Aug 13, 2013 at 11:47:19AM +0200, Sedat Dilek wrote:
> On Tue, Aug 13, 2013 at 11:39 AM, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > On Tue, Aug 13, 2013 at 11:35:53AM +0200, Sedat Dilek wrote:
> >> After a logout from my "BROKEN" Unity-2D session - the login-screen
> >> for LightDM seems to be OK.
> >> Then entering my Unity-2D desktop is OK - no screen corruptions.
> >
> > What hardware and display do you have?
> 
> It's a Samsung ultrabook with SandyBridge CPU.
> 
> [   333.291] (--) intel(0): Integrated Graphics Chipset: Intel(R) HD
> Graphics 3000

using LVDS.
 
> - Sedat -
> 
> P.S.: I switched to intel-ddx v2-21-14-35-g5840bf in the meantime.

Did that make a difference? It shouldn't if the error is occuring before
X even starts...
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
