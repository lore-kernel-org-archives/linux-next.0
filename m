From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: linux-next: build failure after merge of the imx-drm tree
Date: Fri, 18 Jan 2019 11:41:30 +0100
Message-ID: <1547808090.3375.5.camel@pengutronix.de>
References: <20190118141912.69d2a6e9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190118141912.69d2a6e9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Lucas Stach <l.stach@pengutronix.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, 2019-01-18 at 14:19 +1100, Stephen Rothwell wrote:
> Hi Lucas,
> 
> After merging the imx-drm tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/gpu/drm/imx/imx-tve.c: At top level:
> drivers/gpu/drm/imx/imx-tve.c:437:29: error: storage size of 'clk_tve_di_ops' isn't known
>  static const struct clk_ops clk_tve_di_ops = {
>                              ^~~~~~~~~~~~~~
> 
> Exposed by commit
> 
>   97144d12df00 ("drm/imx: Allow building under COMPILE_TEST")
> 
> I have reverted that commit for today.

Sorry, I have dropped the commit for now.

regards
Philipp
