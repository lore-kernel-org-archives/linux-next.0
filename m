From: Mike Turquette <mturquette@linaro.org>
Subject: Re: linux-next: build failure after merge of the samsung tree
Date: Thu, 25 Sep 2014 16:01:24 -0700
Message-ID: <20140925230124.19023.33551@quantum>
References: <20140924110836.209bc8e2@canb.auug.org.au>
 <00fb01cfd7a4$45eb4a50$d1c1def0$@kernel.org>
 <20140924155336.6e64b952@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140924155336.6e64b952@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Kukjin Kim <kgene@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>, 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>
List-Id: linux-next.vger.kernel.org

Quoting Stephen Rothwell (2014-09-23 22:53:36)
> Hi Kukjin,
> 
> On Wed, 24 Sep 2014 12:04:36 +0900 Kukjin Kim <kgene@kernel.org> wrote:
> >
> > > After merging the samsung tree, today's linux-next build (arm multi_v7_defconfig)
> > > failed like this:
> > > 
> > > arch/arm/boot/dts/exynos5250-snow.dts:13:46: fatal error: dt-bindings/clock/maxim,max77686.h: No such
> > > file or directory
> > >  #include <dt-bindings/clock/maxim,max77686.h>
> > >                                               ^
> > > 
> > + Mike
> > 
> > Hmm... I think, inclusion of the header file should be included in Mike's clk
> > tree...What's wrong?
> 
> Mike's clk tree is included in linux-next well after your tree ... and
> does Mike's tree get included in the arm-soc tree like your does?  So,
> clearly you can't build this tree on its own?

I saw in another thread that Kukjin merged the clk tree into his -next
branch. Is there anything left to do on this one?

Regards,
Mike

> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
