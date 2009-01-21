From: Liam Girdwood <lrg@slimlogic.co.uk>
Subject: Re: [PATCH] regulator: Hoist struct regulator_dev out of core to
 fix notifiers
Date: Wed, 21 Jan 2009 14:57:43 +0000
Message-ID: <1232549863.16911.350.camel@vega.slimlogic.co.uk>
References: <1232546920-14915-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756189AbZAUO55@vger.kernel.org>
In-Reply-To: <1232546920-14915-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@cam.ac.uk>
List-Id: linux-next.vger.kernel.org

On Wed, 2009-01-21 at 14:08 +0000, Mark Brown wrote:
> Commit 872ed3fe176833f7d43748eb88010da4bbd2f983 caused regulator drivers
> to take the struct regulator_dev lock themselves which requires that the
> struct be visible to them. Band aid this by making the struct visible.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  drivers/regulator/core.c         |   27 ---------------------------
>  include/linux/regulator/driver.h |   32 ++++++++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+), 27 deletions(-)

Applied and fixed.

Thanks

Liam
