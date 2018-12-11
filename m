From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: next-20181211 build: 1 failures 32 warnings (next-20181211)
Date: Tue, 11 Dec 2018 15:15:35 -0700
Message-ID: <20181211221535.GA20165@flashbox>
References: <E1gWnrV-00086U-3m@optimist> <20181211220620.GS6686@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181211220620.GS6686@sirena.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: linaro-kernel@lists.linaro.org, kernel-build-reports@lists.linaro.org, Russell King <linux@armlinux.org.uk>, linux-next@vger.kernel.org, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Daniel Scheller <d.scheller@gmx.net>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Dec 11, 2018 at 10:06:20PM +0000, Mark Brown wrote:
> On Tue, Dec 11, 2018 at 07:38:33PM +0000, Build bot for Mark Brown wrote:
> 
> Today's -next fails to build an arm allmodconfig due to:
> 
> > 	arm-allmodconfig
> > ../arch/arm/include/asm/irq.h:35:50: error: unknown type name 'cpumask_t'
> > ../arch/arm/include/asm/irq.h:36:9: error: unknown type name 'bool'
> > ../arch/arm/include/asm/irq.h:35:50: error: unknown type name 'cpumask_t'
> > ../arch/arm/include/asm/irq.h:36:9: error: unknown type name 'bool'
> > ../arch/arm/include/asm/irq.h:35:50: error: unknown type name 'cpumask_t'
> > ../arch/arm/include/asm/irq.h:36:9: error: unknown type name 'bool'
> > ../arch/arm/include/asm/irq.h:35:50: error: unknown type name 'cpumask_t'
> > ../arch/arm/include/asm/irq.h:36:9: error: unknown type name 'bool'
> 
> in ddbridge-ci.c and some other media files.  This is because
> ddbridge.h includes asm/irq.h but that does not directly include headers
> which define the above types and it appears some header changes have
> removed an implicit inclusion of those.  Moving the asm includes after
> the linux ones in ddbridge.h fixes this though this appears to be
> against the coding style for media.

Hi Mark,

I sent a patch for this yesterday, I think moving the asm includes after
the linux ones is the correct fix according to the rest of the kernel:
https://lore.kernel.org/linux-media/20181210233514.3069-1-natechancellor@gmail.com/

Hopefully it can be picked up quickly.

Thanks,
Nathan
