From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build warning after merge of the final tree (probably
 arm-soc tree related)
Date: Tue, 9 Apr 2013 11:21:24 +0200
Message-ID: <201304091121.24372.arnd@arndb.de>
References: <20130409190900.97dcf3a70a9c0ad727b8bc4b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130409190900.97dcf3a70a9c0ad727b8bc4b@canb.auug.org.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

On Tuesday 09 April 2013, Stephen Rothwell wrote:
> After merging the final tree, today's linux-next build (arm defconfig)
> produced these warnings:
> 
> arch/arm/mach-cns3xxx/Kconfig:2:warning: choice value used outside its choice group
> arch/arm/mach-bcm2835/Kconfig:2:warning: choice value used outside its choice group
> arch/arm/Kconfig:287:error: recursive dependency detected!
> arch/arm/Kconfig:287:   choice <choice> contains symbol ARCH_CNS3XXX
> arch/arm/Kconfig:366:   symbol ARCH_CNS3XXX depends on ARCH_MULTI_V6
> arch/arm/Kconfig:933:   symbol ARCH_MULTI_V6 depends on ARCH_MULTIPLATFORM
> arch/arm/Kconfig:292:   symbol ARCH_MULTIPLATFORM is part of choice <choice>

Thanks for the notification, I think git rerere picked up a wrong conflict resolution
again that I did earlier. I'll fix it when I do the next pulls today.

	Arnd
