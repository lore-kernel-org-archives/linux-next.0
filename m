From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the spi-nor
 tree
Date: Fri, 30 Mar 2018 10:04:23 +0200
Message-ID: <20180330100423.3958e59a@bbrezillon>
References: <20180330142741.4266629f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180330142741.4266629f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Marek Vasut <marex@denx.de>
List-Id: linux-next.vger.kernel.org

On Fri, 30 Mar 2018 14:27:41 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Cyrille,
> 
> Commits
> 
>   3efa50903ff3 ("mtd: fsl-quadspi: Distinguish the mtd device names")
>   85da6da22843 ("dt-bindings: fsl-quadspi: Add the example of two SPI NOR")
> 
> are missing a Signed-off-by from their committer.

Oops, my bad. I amended the commits to change the subject prefix and
now I'm the commiter :-).

Will add my SoB.

> 
> P.S. should I be changing the contact I have for the spi-nor trees?

Yes, Cyrille is no longer maintaining spi-nor. You can put me as the
contact until someone takes over (I think Marek, the other spi-nor
maintainer, does not have access to the repo yet).


-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
