From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the mtd tree
Date: Mon, 15 Dec 2008 15:15:37 +1100
Message-ID: <20081215151537.70c789eb.sfr@canb.auug.org.au>
References: <20081211134307.b7ce748d.sfr@canb.auug.org.au>
	<bc64b4640812110211h294707d8ndd58f611152b893d@mail.gmail.com>
	<20081211212335.828b902c.sfr@canb.auug.org.au>
	<bc64b4640812120229j6989fb6ax7842ed2190946a57@mail.gmail.com>
	<20081213100513.05ef28d6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33199 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751884AbYLOEPp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 14 Dec 2008 23:15:45 -0500
In-Reply-To: <20081213100513.05ef28d6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-next@vger.kernel.org, Eric Miao <eric.miao@marvell.com>, Russell King <rmk@arm.linux.org.uk>

Hi Dmitry,

On Sat, 13 Dec 2008 10:05:13 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> On Fri, 12 Dec 2008 13:29:01 +0300 "Dmitry Eremin-Solenikov" <dbaryshkov@gmail.com> wrote:
> >
> > Sorry for the delay. I've attached the files resulting from the merge
> > of today linux-next/master and mtd/master.
> 
> Thanks, I will use them on Monday.

Just copying in these files produced the following diff which I can carry
as necessary.  Thanks again.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/arm/mach-pxa/corgi.c
index c5e28a4,b65be8e..0000000
--- a/arch/arm/mach-pxa/corgi.c
+++ b/arch/arm/mach-pxa/corgi.c
@@@ -542,42 -542,61 +543,92 @@@ err_free_1
  static inline void corgi_init_spi(void) {}
  #endif
  
+ static struct mtd_partition sharpsl_nand_partitions[] = {
+ 	{
+ 		.name = "System Area",
+ 		.offset = 0,
+ 		.size = 7 * 1024 * 1024,
+ 	},
+ 	{
+ 		.name = "Root Filesystem",
+ 		.offset = 7 * 1024 * 1024,
+ 		.size = 25 * 1024 * 1024,
+ 	},
+ 	{
+ 		.name = "Home Filesystem",
+ 		.offset = MTDPART_OFS_APPEND,
+ 		.size = MTDPART_SIZ_FULL,
+ 	},
+ };
+ 
+ static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
+ 
+ static struct nand_bbt_descr sharpsl_bbt = {
+ 	.options = 0,
+ 	.offs = 4,
+ 	.len = 2,
+ 	.pattern = scan_ff_pattern
+ };
+ 
+ static struct sharpsl_nand_platform_data sharpsl_nand_platform_data = {
+ 	.badblock_pattern	= &sharpsl_bbt,
+ 	.partitions		= sharpsl_nand_partitions,
+ 	.nr_partitions		= ARRAY_SIZE(sharpsl_nand_partitions),
+ };
+ 
+ static struct resource sharpsl_nand_resources[] = {
+ 	{
+ 		.start	= 0x0C000000,
+ 		.end	= 0x0C000FFF,
+ 		.flags	= IORESOURCE_MEM,
+ 	},
+ };
+ 
+ static struct platform_device sharpsl_nand_device = {
+ 	.name		= "sharpsl-nand",
+ 	.id		= -1,
+ 	.resource	= sharpsl_nand_resources,
+ 	.num_resources	= ARRAY_SIZE(sharpsl_nand_resources),
+ 	.dev.platform_data	= &sharpsl_nand_platform_data,
+ };
+ 
 +static struct mtd_partition sharpsl_rom_parts[] = {
 +	{
 +		.name	="Boot PROM Filesystem",
 +		.offset	= 0x00120000,
 +		.size	= MTDPART_SIZ_FULL,
 +	},
 +};
 +
 +static struct physmap_flash_data sharpsl_rom_data = {
 +	.width		= 2,
 +	.nr_parts	= ARRAY_SIZE(sharpsl_rom_parts),
 +	.parts		= sharpsl_rom_parts,
 +};
 +
 +static struct resource sharpsl_rom_resources[] = {
 +	{
 +		.start	= 0x00000000,
 +		.end	= 0x007fffff,
 +		.flags	= IORESOURCE_MEM,
 +	},
 +};
 +
 +static struct platform_device sharpsl_rom_device = {
 +	.name	= "physmap-flash",
 +	.id	= -1,
 +	.resource = sharpsl_rom_resources,
 +	.num_resources = ARRAY_SIZE(sharpsl_rom_resources),
 +	.dev.platform_data = &sharpsl_rom_data,
 +};
 +
  static struct platform_device *devices[] __initdata = {
  	&corgiscoop_device,
  	&corgifb_device,
  	&corgikbd_device,
  	&corgiled_device,
+ 	&sharpsl_nand_device,
 +	&sharpsl_rom_device,
  };
  
  static void corgi_poweroff(void)
diff --cc arch/arm/mach-pxa/poodle.c
index ae88855,a45afdf..0000000
--- a/arch/arm/mach-pxa/poodle.c
+++ b/arch/arm/mach-pxa/poodle.c
@@@ -414,40 -414,59 +415,90 @@@ static struct pxafb_mach_info poodle_fb
  	.lcd_conn	= LCD_COLOR_TFT_16BPP,
  };
  
+ static struct mtd_partition sharpsl_nand_partitions[] = {
+ 	{
+ 		.name = "System Area",
+ 		.offset = 0,
+ 		.size = 7 * 1024 * 1024,
+ 	},
+ 	{
+ 		.name = "Root Filesystem",
+ 		.offset = 7 * 1024 * 1024,
+ 		.size = 22 * 1024 * 1024,
+ 	},
+ 	{
+ 		.name = "Home Filesystem",
+ 		.offset = MTDPART_OFS_APPEND,
+ 		.size = MTDPART_SIZ_FULL,
+ 	},
+ };
+ 
+ static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
+ 
+ static struct nand_bbt_descr sharpsl_bbt = {
+ 	.options = 0,
+ 	.offs = 4,
+ 	.len = 2,
+ 	.pattern = scan_ff_pattern
+ };
+ 
+ static struct sharpsl_nand_platform_data sharpsl_nand_platform_data = {
+ 	.badblock_pattern	= &sharpsl_bbt,
+ 	.partitions		= sharpsl_nand_partitions,
+ 	.nr_partitions		= ARRAY_SIZE(sharpsl_nand_partitions),
+ };
+ 
+ static struct resource sharpsl_nand_resources[] = {
+ 	{
+ 		.start	= 0x0C000000,
+ 		.end	= 0x0C000FFF,
+ 		.flags	= IORESOURCE_MEM,
+ 	},
+ };
+ 
+ static struct platform_device sharpsl_nand_device = {
+ 	.name		= "sharpsl-nand",
+ 	.id		= -1,
+ 	.resource	= sharpsl_nand_resources,
+ 	.num_resources	= ARRAY_SIZE(sharpsl_nand_resources),
+ 	.dev.platform_data	= &sharpsl_nand_platform_data,
+ };
+ 
 +static struct mtd_partition sharpsl_rom_parts[] = {
 +	{
 +		.name	="Boot PROM Filesystem",
 +		.offset	= 0x00120000,
 +		.size	= MTDPART_SIZ_FULL,
 +	},
 +};
 +
 +static struct physmap_flash_data sharpsl_rom_data = {
 +	.width		= 2,
 +	.nr_parts	= ARRAY_SIZE(sharpsl_rom_parts),
 +	.parts		= sharpsl_rom_parts,
 +};
 +
 +static struct resource sharpsl_rom_resources[] = {
 +	{
 +		.start	= 0x00000000,
 +		.end	= 0x007fffff,
 +		.flags	= IORESOURCE_MEM,
 +	},
 +};
 +
 +static struct platform_device sharpsl_rom_device = {
 +	.name	= "physmap-flash",
 +	.id	= -1,
 +	.resource = sharpsl_rom_resources,
 +	.num_resources = ARRAY_SIZE(sharpsl_rom_resources),
 +	.dev.platform_data = &sharpsl_rom_data,
 +};
 +
  static struct platform_device *devices[] __initdata = {
  	&poodle_locomo_device,
  	&poodle_scoop_device,
+ 	&sharpsl_nand_device,
 +	&sharpsl_rom_device,
  };
  
  static void poodle_poweroff(void)
diff --cc arch/arm/mach-pxa/spitz.c
index 7299d87,7672b09..0000000
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@@ -613,42 -609,60 +614,91 @@@ static struct pxafb_mach_info spitz_pxa
  	.lcd_conn	= LCD_COLOR_TFT_16BPP | LCD_ALTERNATE_MAPPING,
  };
  
+ static struct mtd_partition sharpsl_nand_partitions[] = {
+ 	{
+ 		.name = "System Area",
+ 		.offset = 0,
+ 		.size = 7 * 1024 * 1024,
+ 	},
+ 	{
+ 		.name = "Root Filesystem",
+ 		.offset = 7 * 1024 * 1024,
+ 	},
+ 	{
+ 		.name = "Home Filesystem",
+ 		.offset = MTDPART_OFS_APPEND,
+ 		.size = MTDPART_SIZ_FULL,
+ 	},
+ };
+ 
+ static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
+ 
+ static struct nand_bbt_descr sharpsl_bbt = {
+ 	.options = 0,
+ 	.offs = 4,
+ 	.len = 2,
+ 	.pattern = scan_ff_pattern
+ };
+ 
+ static struct sharpsl_nand_platform_data sharpsl_nand_platform_data = {
+ 	.badblock_pattern	= &sharpsl_bbt,
+ 	.partitions		= sharpsl_nand_partitions,
+ 	.nr_partitions		= ARRAY_SIZE(sharpsl_nand_partitions),
+ };
+ 
+ static struct resource sharpsl_nand_resources[] = {
+ 	{
+ 		.start	= 0x0C000000,
+ 		.end	= 0x0C000FFF,
+ 		.flags	= IORESOURCE_MEM,
+ 	},
+ };
+ 
+ static struct platform_device sharpsl_nand_device = {
+ 	.name		= "sharpsl-nand",
+ 	.id		= -1,
+ 	.resource	= sharpsl_nand_resources,
+ 	.num_resources	= ARRAY_SIZE(sharpsl_nand_resources),
+ 	.dev.platform_data	= &sharpsl_nand_platform_data,
+ };
+ 
  
 +static struct mtd_partition sharpsl_rom_parts[] = {
 +	{
 +		.name	="Boot PROM Filesystem",
 +		.offset	= 0x00140000,
 +		.size	= MTDPART_SIZ_FULL,
 +	},
 +};
 +
 +static struct physmap_flash_data sharpsl_rom_data = {
 +	.width		= 2,
 +	.nr_parts	= ARRAY_SIZE(sharpsl_rom_parts),
 +	.parts		= sharpsl_rom_parts,
 +};
 +
 +static struct resource sharpsl_rom_resources[] = {
 +	{
 +		.start	= 0x00000000,
 +		.end	= 0x007fffff,
 +		.flags	= IORESOURCE_MEM,
 +	},
 +};
 +
 +static struct platform_device sharpsl_rom_device = {
 +	.name	= "physmap-flash",
 +	.id	= -1,
 +	.resource = sharpsl_rom_resources,
 +	.num_resources = ARRAY_SIZE(sharpsl_rom_resources),
 +	.dev.platform_data = &sharpsl_rom_data,
 +};
 +
  static struct platform_device *devices[] __initdata = {
  	&spitzscoop_device,
  	&spitzkbd_device,
  	&spitzled_device,
+ 	&sharpsl_nand_device,
 +	&sharpsl_rom_device,
  };
  
  static void spitz_poweroff(void)
