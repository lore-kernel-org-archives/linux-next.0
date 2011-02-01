From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: RE: linux-next-20100201 - OMAP2+ defconfig broken with CONFIG_DEBUG_LL
Date: Tue, 1 Feb 2011 14:56:13 +0530
Message-ID: <7f99b6fa52967d67bf45d4e8aa7db1e8@mail.gmail.com>
References: <AANLkTinF+dpKvuRztChBM01MAjgL-foGp_yVq3uC9ghu@mail.gmail.com>
	<4af2a35f6d08ddcb33eb86aa3c784fb5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4af2a35f6d08ddcb33eb86aa3c784fb5@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anand Gadiyar <gadiyar@ti.com>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

> -----Original Message-----
> From: linux-arm-kernel-bounces@lists.infradead.org [mailto:linux-
> arm-kernel-bounces@lists.infradead.org] On Behalf Of Anand Gadiyar
> Sent: Tuesday, February 01, 2011 2:54 PM
> To: linux-arm-kernel@lists.infradead.org; linux-
> next@vger.kernel.org; Russell King - ARM Linux
> Subject: RE: linux-next-20100201 - OMAP2+ defconfig broken with
> CONFIG_DEBUG_LL
>
> Gadiyar, Anand wrote:
> > Hi all,
> >
> > I tried to build linux-next as of 20100201 with
> > omap2plus_defconfig. In addition
> > I turned on CONFIG_DEBUG_LL and hit the following error.
> >
> >   AS      arch/arm/kernel/debug.o
> > arch/arm/kernel/debug.S: Assembler messages:
> > arch/arm/kernel/debug.S:174: Error: garbage following instruction
> --
> > `ldreq r1,=
> > __virt_to_phys(omap_uart_phys)'
> > arch/arm/kernel/debug.S:174: Error: garbage following instruction
> --
> > `ldrne r1,=
> > __phys_to_virt((0x80000000+0x3ffc))'
> > arch/arm/kernel/debug.S:174: Error: garbage following instruction
> --
> > `ldreq r2,=
> > __virt_to_phys(omap_uart_phys)'
> > arch/arm/kernel/debug.S:174: Error: garbage following instruction
> --
> > `ldreq r2,=
> > __virt_to_phys(omap_uart_phys)'
> > arch/arm/kernel/debug.S:178: Error: garbage following instruction
> --
> > `ldreq r2,=
> > __virt_to_phys(omap_uart_lsr)'
> > arch/arm/kernel/debug.S:190: Error: garbage following instruction
> --
> > `ldreq r1,=
> > __virt_to_phys(omap_uart_phys)'
> > arch/arm/kernel/debug.S:190: Error: garbage following instruction
> --
> > `ldrne r1,=
> > __phys_to_virt((0x80000000+0x3ffc))'
> > arch/arm/kernel/debug.S:190: Error: garbage following instruction
> --
> > `ldreq r2,=
> > __virt_to_phys(omap_uart_phys)'
> > arch/arm/kernel/debug.S:190: Error: garbage following instruction
> --
> > `ldreq r2,=
> > __virt_to_phys(omap_uart_phys)'
> > make[1]: *** [arch/arm/kernel/debug.o] Error 1
> > make: *** [arch/arm/kernel] Error 2
> >
> > Will try and bisect this down later. Just reporting for now.
> >
>
> Hi Russell,
>
> This appears to be introduced after this commit from you:
>
> 8397c0703b5aa99fdb7c4e5177c4e2fc3b97c835 is the first bad commit
> commit 8397c0703b5aa99fdb7c4e5177c4e2fc3b97c835
> Author: Russell King <rmk+kernel@arm.linux.org.uk>
> Date:   Tue Jan 4 19:09:43 2011 +0000
>
>     ARM: P2V: introduce phys_to_virt/virt_to_phys runtime patching
>
>     This idea came from Nicolas, Eric Miao produced an initial
> version,
>     which was then rewritten into this.
>
> The build failure seems to be omap-specific; I don't see this when
> I build a mx51_defconfig for instance, but I do get a similar error
> when building for omap1_defconfig.
>
> I'll try and dig deeper.
>
This is known and Russell has already pointed this
out even before patch for dynamic p2v were merged.

OMAP LL debug code needs to be fixed.

Regards,
Santosh
