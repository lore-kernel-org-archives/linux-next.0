From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: Tree for Mar 27 (sunxi clk & mfd)
Date: Mon, 1 Apr 2019 11:27:32 +0100
Message-ID: <20190401102732.GD4187@dell>
References: <20190327145020.2fff97b8@canb.auug.org.au>
 <641a04ec-e2e6-4263-e77e-d272058c18c9@infradead.org>
 <20190328095036.734adbba@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190328095036.734adbba@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Boris Brezillon <bbrezillon@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
List-Id: linux-next.vger.kernel.org

On Thu, 28 Mar 2019, Stephen Rothwell wrote:

> Hi Randy,
> 
> On Wed, 27 Mar 2019 13:32:26 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > on i386 or x86_64:
> > 
> > WARNING: unmet direct dependencies detected for MFD_SUN6I_PRCM
> >   Depends on [n]: HAS_IOMEM [=y] && ARCH_SUNXI
> >   Selected by [y]:
> >   - CLK_SUNXI_PRCM_SUN8I [=y] && COMMON_CLK [=y] && CLK_SUNXI [=y]
> 
> I reported that a while ago (x86_64 allmodconfig after the merge of the
> sunxi tree).  Apparently there is a fix out there but it hasn't been
> applied yet.

Where is the fix to be applied?  SUNXI or MFD?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
