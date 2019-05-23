From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the v4l-dvb tree
Date: Thu, 23 May 2019 17:10:05 +0300
Message-ID: <20190523141004.cfbuymuykjew4tyr@kekkonen.localdomain>
References: <20190524000500.61cacf9e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190524000500.61cacf9e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mauro Carvalho Chehab <mchehab@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, Shawnx Tu <shawnx.tu@intel.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen, Mauro,

On Fri, May 24, 2019 at 12:05:00AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   eeabf6320e2f ("media: Revert "[media] marvell-ccic: reset ccic phy when stop streaming for stability"")
>   bbf83ed40252c ("media: ov8856: modify register to fix test pattern")
> 
> are missing a Signed-off-by from their authors.

Ouch.

Mauro, what do you prefer, reset the tree or what?

Shawn, Lubomir: please read "Developer's Certificate of Origin 1.1" in
Documentation/process/submitting-patches.rst and then resend with
appropriate SoB lines.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
