From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH -next] mfd: fix stmpe.c build when OF is not enabled
Date: Mon, 26 Nov 2012 22:07:23 +0100
Message-ID: <20121126210723.GX12685@sortiz-mobl>
References: <20121112164431.8bcfe78d2a2ec73271733db4@canb.auug.org.au>
 <50A12FF1.4000800@infradead.org>
 <CACRpkdZj5iuyXAfynF-5r65dnakxxm2A1O602P4Lc6it8=fU9g@mail.gmail.com>
 <50B3C13D.1050704@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <50B3C13D.1050704@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rabin Vincent <rabin.vincent@stericsson.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Randy,

On Mon, Nov 26, 2012 at 11:21:33AM -0800, Randy Dunlap wrote:
> On 11/13/2012 05:35 AM, Linus Walleij wrote:
> 
> > On Mon, Nov 12, 2012 at 6:20 PM, Randy Dunlap <rdunlap@infradead.org> wrote:
> > 
> >> From: Randy Dunlap <rdunlap@infradead.org>
> >>
> >> Fix build errors when CONFIG_OF is not enabled by including
> >> <linux/of.h> (needs to be added in any case).
> >> An alternative fix could be to make the driver depend on OF.
> >>
> >> drivers/mfd/stmpe.c:1025:2: error: implicit declaration of function 'of_property_read_u32'
> >> drivers/mfd/stmpe.c:1030:2: error: implicit declaration of function 'for_each_child_of_node'
> >> drivers/mfd/stmpe.c:1030:36: error: expected ';' before '{' token
> >>
> >> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> >> Cc: Rabin Vincent <rabin.vincent@stericsson.com>
> >> Cc: Samuel Ortiz <sameo@linux.intel.com>
> > 
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> 
> 
> 
> ping?
> 
> This patch is still needed in linux-next.
Applied and pushed, thanks a lot.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
