From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: linux-next: build failure after merge of the arm tree
Date: Mon, 24 Apr 2017 09:50:33 +0530
Message-ID: <20170424042033.GC6263@localhost>
References: <20170421084033.5c987e13@canb.auug.org.au>
 <9858a4ed-bdd9-bd6c-d8a4-e9e6bd539904@free.fr>
 <20170421181230.05dcf937@canb.auug.org.au>
 <20170421234315.GO17774@n2100.armlinux.org.uk>
 <f89b6045-8c09-f6c4-3893-84f172260926@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f89b6045-8c09-f6c4-3893-84f172260926@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Mason <slash.tmp@free.fr>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, arm-soc <arm@kernel.org>, Emilio Lopez <emilio@elopez.com.ar>, dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
List-Id: linux-next.vger.kernel.org

On Sat, Apr 22, 2017 at 10:41:37AM +0200, Mason wrote:
> On 22/04/2017 01:43, Russell King - ARM Linux wrote:
> 
> > Or I drop the offending patch (done) and we get the DMA subsystem fixed
> > first.  Given how long it's been this way, I doubt there's any hurry to
> > get this change in for the next merge window.
> 
> Your solution makes sense.
> 
> Vinod, could you apply [PATCH v2] dmaengine: sun4i: fix invalid argument
> to your tree when you have the time?

Done now..

-- 
~Vinod
