From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the mtd tree
Date: Fri, 2 Jan 2009 13:07:30 +1100
Message-ID: <20090102130730.9c20a917.sfr@canb.auug.org.au>
References: <20081211134307.b7ce748d.sfr@canb.auug.org.au>
	<bc64b4640812110211h294707d8ndd58f611152b893d@mail.gmail.com>
	<20081211212335.828b902c.sfr@canb.auug.org.au>
	<bc64b4640812120229j6989fb6ax7842ed2190946a57@mail.gmail.com>
	<20081213100513.05ef28d6.sfr@canb.auug.org.au>
	<20081215151537.70c789eb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__2_Jan_2009_13_07_30_+1100_cGdwieJCiFrLNgF4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50362 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753558AbZABCHk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 1 Jan 2009 21:07:40 -0500
In-Reply-To: <20081215151537.70c789eb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, linux-next@vger.kernel.org, Eric Miao <eric.miao@marvell.com>, Russell King <rmk@arm.linux.org.uk>

--Signature=_Fri__2_Jan_2009_13_07_30_+1100_cGdwieJCiFrLNgF4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, 15 Dec 2008 15:15:37 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Sat, 13 Dec 2008 10:05:13 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > On Fri, 12 Dec 2008 13:29:01 +0300 "Dmitry Eremin-Solenikov" <dbaryshko=
v@gmail.com> wrote:
> > >
> > > Sorry for the delay. I've attached the files resulting from the merge
> > > of today linux-next/master and mtd/master.
> >=20
> > Thanks, I will use them on Monday.
>=20
> Just copying in these files produced the following diff which I can carry
> as necessary.  Thanks again.

These conflicts are now between the mtd tree and Linus' tree, so could be
cleaned up by merging Linus' tree into the mtd tree ...

> diff --cc arch/arm/mach-pxa/corgi.c
> index c5e28a4,b65be8e..0000000
> --- a/arch/arm/mach-pxa/corgi.c
> +++ b/arch/arm/mach-pxa/corgi.c
> @@@ -542,42 -542,61 +543,92 @@@ err_free_1
>   static inline void corgi_init_spi(void) {}
>   #endif
>  =20
> + static struct mtd_partition sharpsl_nand_partitions[] =3D {
> + 	{
> + 		.name =3D "System Area",
> + 		.offset =3D 0,
> + 		.size =3D 7 * 1024 * 1024,
> + 	},
> + 	{
> + 		.name =3D "Root Filesystem",
> + 		.offset =3D 7 * 1024 * 1024,
> + 		.size =3D 25 * 1024 * 1024,
> + 	},
> + 	{
> + 		.name =3D "Home Filesystem",
> + 		.offset =3D MTDPART_OFS_APPEND,
> + 		.size =3D MTDPART_SIZ_FULL,
> + 	},
> + };
> +=20
> + static uint8_t scan_ff_pattern[] =3D { 0xff, 0xff };
> +=20
> + static struct nand_bbt_descr sharpsl_bbt =3D {
> + 	.options =3D 0,
> + 	.offs =3D 4,
> + 	.len =3D 2,
> + 	.pattern =3D scan_ff_pattern
> + };
> +=20
> + static struct sharpsl_nand_platform_data sharpsl_nand_platform_data =3D=
 {
> + 	.badblock_pattern	=3D &sharpsl_bbt,
> + 	.partitions		=3D sharpsl_nand_partitions,
> + 	.nr_partitions		=3D ARRAY_SIZE(sharpsl_nand_partitions),
> + };
> +=20
> + static struct resource sharpsl_nand_resources[] =3D {
> + 	{
> + 		.start	=3D 0x0C000000,
> + 		.end	=3D 0x0C000FFF,
> + 		.flags	=3D IORESOURCE_MEM,
> + 	},
> + };
> +=20
> + static struct platform_device sharpsl_nand_device =3D {
> + 	.name		=3D "sharpsl-nand",
> + 	.id		=3D -1,
> + 	.resource	=3D sharpsl_nand_resources,
> + 	.num_resources	=3D ARRAY_SIZE(sharpsl_nand_resources),
> + 	.dev.platform_data	=3D &sharpsl_nand_platform_data,
> + };
> +=20
>  +static struct mtd_partition sharpsl_rom_parts[] =3D {
>  +	{
>  +		.name	=3D"Boot PROM Filesystem",
>  +		.offset	=3D 0x00120000,
>  +		.size	=3D MTDPART_SIZ_FULL,
>  +	},
>  +};
>  +
>  +static struct physmap_flash_data sharpsl_rom_data =3D {
>  +	.width		=3D 2,
>  +	.nr_parts	=3D ARRAY_SIZE(sharpsl_rom_parts),
>  +	.parts		=3D sharpsl_rom_parts,
>  +};
>  +
>  +static struct resource sharpsl_rom_resources[] =3D {
>  +	{
>  +		.start	=3D 0x00000000,
>  +		.end	=3D 0x007fffff,
>  +		.flags	=3D IORESOURCE_MEM,
>  +	},
>  +};
>  +
>  +static struct platform_device sharpsl_rom_device =3D {
>  +	.name	=3D "physmap-flash",
>  +	.id	=3D -1,
>  +	.resource =3D sharpsl_rom_resources,
>  +	.num_resources =3D ARRAY_SIZE(sharpsl_rom_resources),
>  +	.dev.platform_data =3D &sharpsl_rom_data,
>  +};
>  +
>   static struct platform_device *devices[] __initdata =3D {
>   	&corgiscoop_device,
>   	&corgifb_device,
>   	&corgikbd_device,
>   	&corgiled_device,
> + 	&sharpsl_nand_device,
>  +	&sharpsl_rom_device,
>   };
>  =20
>   static void corgi_poweroff(void)
> diff --cc arch/arm/mach-pxa/poodle.c
> index ae88855,a45afdf..0000000
> --- a/arch/arm/mach-pxa/poodle.c
> +++ b/arch/arm/mach-pxa/poodle.c
> @@@ -414,40 -414,59 +415,90 @@@ static struct pxafb_mach_info poodle_fb
>   	.lcd_conn	=3D LCD_COLOR_TFT_16BPP,
>   };
>  =20
> + static struct mtd_partition sharpsl_nand_partitions[] =3D {
> + 	{
> + 		.name =3D "System Area",
> + 		.offset =3D 0,
> + 		.size =3D 7 * 1024 * 1024,
> + 	},
> + 	{
> + 		.name =3D "Root Filesystem",
> + 		.offset =3D 7 * 1024 * 1024,
> + 		.size =3D 22 * 1024 * 1024,
> + 	},
> + 	{
> + 		.name =3D "Home Filesystem",
> + 		.offset =3D MTDPART_OFS_APPEND,
> + 		.size =3D MTDPART_SIZ_FULL,
> + 	},
> + };
> +=20
> + static uint8_t scan_ff_pattern[] =3D { 0xff, 0xff };
> +=20
> + static struct nand_bbt_descr sharpsl_bbt =3D {
> + 	.options =3D 0,
> + 	.offs =3D 4,
> + 	.len =3D 2,
> + 	.pattern =3D scan_ff_pattern
> + };
> +=20
> + static struct sharpsl_nand_platform_data sharpsl_nand_platform_data =3D=
 {
> + 	.badblock_pattern	=3D &sharpsl_bbt,
> + 	.partitions		=3D sharpsl_nand_partitions,
> + 	.nr_partitions		=3D ARRAY_SIZE(sharpsl_nand_partitions),
> + };
> +=20
> + static struct resource sharpsl_nand_resources[] =3D {
> + 	{
> + 		.start	=3D 0x0C000000,
> + 		.end	=3D 0x0C000FFF,
> + 		.flags	=3D IORESOURCE_MEM,
> + 	},
> + };
> +=20
> + static struct platform_device sharpsl_nand_device =3D {
> + 	.name		=3D "sharpsl-nand",
> + 	.id		=3D -1,
> + 	.resource	=3D sharpsl_nand_resources,
> + 	.num_resources	=3D ARRAY_SIZE(sharpsl_nand_resources),
> + 	.dev.platform_data	=3D &sharpsl_nand_platform_data,
> + };
> +=20
>  +static struct mtd_partition sharpsl_rom_parts[] =3D {
>  +	{
>  +		.name	=3D"Boot PROM Filesystem",
>  +		.offset	=3D 0x00120000,
>  +		.size	=3D MTDPART_SIZ_FULL,
>  +	},
>  +};
>  +
>  +static struct physmap_flash_data sharpsl_rom_data =3D {
>  +	.width		=3D 2,
>  +	.nr_parts	=3D ARRAY_SIZE(sharpsl_rom_parts),
>  +	.parts		=3D sharpsl_rom_parts,
>  +};
>  +
>  +static struct resource sharpsl_rom_resources[] =3D {
>  +	{
>  +		.start	=3D 0x00000000,
>  +		.end	=3D 0x007fffff,
>  +		.flags	=3D IORESOURCE_MEM,
>  +	},
>  +};
>  +
>  +static struct platform_device sharpsl_rom_device =3D {
>  +	.name	=3D "physmap-flash",
>  +	.id	=3D -1,
>  +	.resource =3D sharpsl_rom_resources,
>  +	.num_resources =3D ARRAY_SIZE(sharpsl_rom_resources),
>  +	.dev.platform_data =3D &sharpsl_rom_data,
>  +};
>  +
>   static struct platform_device *devices[] __initdata =3D {
>   	&poodle_locomo_device,
>   	&poodle_scoop_device,
> + 	&sharpsl_nand_device,
>  +	&sharpsl_rom_device,
>   };
>  =20
>   static void poodle_poweroff(void)
> diff --cc arch/arm/mach-pxa/spitz.c
> index 7299d87,7672b09..0000000
> --- a/arch/arm/mach-pxa/spitz.c
> +++ b/arch/arm/mach-pxa/spitz.c
> @@@ -613,42 -609,60 +614,91 @@@ static struct pxafb_mach_info spitz_pxa
>   	.lcd_conn	=3D LCD_COLOR_TFT_16BPP | LCD_ALTERNATE_MAPPING,
>   };
>  =20
> + static struct mtd_partition sharpsl_nand_partitions[] =3D {
> + 	{
> + 		.name =3D "System Area",
> + 		.offset =3D 0,
> + 		.size =3D 7 * 1024 * 1024,
> + 	},
> + 	{
> + 		.name =3D "Root Filesystem",
> + 		.offset =3D 7 * 1024 * 1024,
> + 	},
> + 	{
> + 		.name =3D "Home Filesystem",
> + 		.offset =3D MTDPART_OFS_APPEND,
> + 		.size =3D MTDPART_SIZ_FULL,
> + 	},
> + };
> +=20
> + static uint8_t scan_ff_pattern[] =3D { 0xff, 0xff };
> +=20
> + static struct nand_bbt_descr sharpsl_bbt =3D {
> + 	.options =3D 0,
> + 	.offs =3D 4,
> + 	.len =3D 2,
> + 	.pattern =3D scan_ff_pattern
> + };
> +=20
> + static struct sharpsl_nand_platform_data sharpsl_nand_platform_data =3D=
 {
> + 	.badblock_pattern	=3D &sharpsl_bbt,
> + 	.partitions		=3D sharpsl_nand_partitions,
> + 	.nr_partitions		=3D ARRAY_SIZE(sharpsl_nand_partitions),
> + };
> +=20
> + static struct resource sharpsl_nand_resources[] =3D {
> + 	{
> + 		.start	=3D 0x0C000000,
> + 		.end	=3D 0x0C000FFF,
> + 		.flags	=3D IORESOURCE_MEM,
> + 	},
> + };
> +=20
> + static struct platform_device sharpsl_nand_device =3D {
> + 	.name		=3D "sharpsl-nand",
> + 	.id		=3D -1,
> + 	.resource	=3D sharpsl_nand_resources,
> + 	.num_resources	=3D ARRAY_SIZE(sharpsl_nand_resources),
> + 	.dev.platform_data	=3D &sharpsl_nand_platform_data,
> + };
> +=20
>  =20
>  +static struct mtd_partition sharpsl_rom_parts[] =3D {
>  +	{
>  +		.name	=3D"Boot PROM Filesystem",
>  +		.offset	=3D 0x00140000,
>  +		.size	=3D MTDPART_SIZ_FULL,
>  +	},
>  +};
>  +
>  +static struct physmap_flash_data sharpsl_rom_data =3D {
>  +	.width		=3D 2,
>  +	.nr_parts	=3D ARRAY_SIZE(sharpsl_rom_parts),
>  +	.parts		=3D sharpsl_rom_parts,
>  +};
>  +
>  +static struct resource sharpsl_rom_resources[] =3D {
>  +	{
>  +		.start	=3D 0x00000000,
>  +		.end	=3D 0x007fffff,
>  +		.flags	=3D IORESOURCE_MEM,
>  +	},
>  +};
>  +
>  +static struct platform_device sharpsl_rom_device =3D {
>  +	.name	=3D "physmap-flash",
>  +	.id	=3D -1,
>  +	.resource =3D sharpsl_rom_resources,
>  +	.num_resources =3D ARRAY_SIZE(sharpsl_rom_resources),
>  +	.dev.platform_data =3D &sharpsl_rom_data,
>  +};
>  +
>   static struct platform_device *devices[] __initdata =3D {
>   	&spitzscoop_device,
>   	&spitzkbd_device,
>   	&spitzled_device,
> + 	&sharpsl_nand_device,
>  +	&sharpsl_rom_device,
>   };
>  =20
>   static void spitz_poweroff(void)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__2_Jan_2009_13_07_30_+1100_cGdwieJCiFrLNgF4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkldduIACgkQjjKRsyhoI8yXQACfcNz0zGU2XSCfFe74hZkaE56y
x1kAnikSiiIS62x4oIWvttnCnS0kKBgg
=cZZi
-----END PGP SIGNATURE-----

--Signature=_Fri__2_Jan_2009_13_07_30_+1100_cGdwieJCiFrLNgF4--
