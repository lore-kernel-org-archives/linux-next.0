From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 2/6] regmap: allow regmap instances to be named
Date: Thu, 5 Apr 2012 23:44:43 -0400
Message-ID: <CAP=VYLpfssjmREbEcGMQ8P4N7wpKgv=vC++ho+UugtOsx5SxOQ@mail.gmail.com>
References: <1333576113-13196-1-git-send-email-swarren@wwwdotorg.org> <1333576113-13196-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:64245 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752775Ab2DFDpQ convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Apr 2012 23:45:16 -0400
In-Reply-To: <1333576113-13196-2-git-send-email-swarren@wwwdotorg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-kernel@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, linux-next@vger.kernel.org

On Wed, Apr 4, 2012 at 5:48 PM, Stephen Warren <swarren@wwwdotorg.org> =
wrote:
> From: Stephen Warren <swarren@nvidia.com>
>
> Some devices have multiple separate register regions. Logically, one
> regmap would be created per region. One issue that prevents this is t=
hat
> each instance will attempt to create the same debugfs files. Avoid th=
is
> by allowing regmaps to be named, and use the name to construct the
> debugfs directory name.
>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> =A0drivers/base/regmap/internal.h =A0 =A0 =A0 | =A0 =A03 ++-
> =A0drivers/base/regmap/regmap-debugfs.c | =A0 14 +++++++++++---
> =A0drivers/base/regmap/regmap.c =A0 =A0 =A0 =A0 | =A0 =A04 ++--
> =A0include/linux/regmap.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A05 ++++=
+
> =A04 files changed, 20 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/base/regmap/internal.h b/drivers/base/regmap/int=
ernal.h
> index 6ee4dc5..d9ea8f5 100644
> --- a/drivers/base/regmap/internal.h
> +++ b/drivers/base/regmap/internal.h
> @@ -47,6 +47,7 @@ struct regmap {
>
> =A0#ifdef CONFIG_DEBUG_FS
> =A0 =A0 =A0 =A0struct dentry *debugfs;
> + =A0 =A0 =A0 const char *debugfs_name;
> =A0#endif
>
> =A0 =A0 =A0 =A0unsigned int max_register;
> @@ -110,7 +111,7 @@ int _regmap_write(struct regmap *map, unsigned in=
t reg,
>
> =A0#ifdef CONFIG_DEBUG_FS
> =A0extern void regmap_debugfs_initcall(void);
> -extern void regmap_debugfs_init(struct regmap *map);
> +extern void regmap_debugfs_init(struct regmap *map, const char *name=
);

Hi Stephen,

Can you take a look at these linux-next fails?

drivers/base/regmap/regmap.c:349:2: error: too many arguments to
function 'regmap_debugfs_init'
drivers/base/regmap/regmap.c:434:2: error: too many arguments to
function 'regmap_debugfs_init'
make[4]: *** [drivers/base/regmap/regmap.o] Error 1

I'm assuming it is somehow related to the above commit (or family
of commits) -- since it complains about arg #s and you are changing
the arg #.  (I didn't bisect to 100% confirm this.)

http://kisskb.ellerman.id.au/kisskb/buildresult/6039717/
http://kisskb.ellerman.id.au/kisskb/buildresult/6040074/
http://kisskb.ellerman.id.au/kisskb/buildresult/6040070/


Thanks,
Paul.
> =A0extern void regmap_debugfs_exit(struct regmap *map);
> =A0#else
> =A0static inline void regmap_debugfs_initcall(void) { }
> diff --git a/drivers/base/regmap/regmap-debugfs.c b/drivers/base/regm=
ap/regmap-debugfs.c
> index 251eb70..df97c93 100644
> --- a/drivers/base/regmap/regmap-debugfs.c
> +++ b/drivers/base/regmap/regmap-debugfs.c
> @@ -242,10 +242,17 @@ static const struct file_operations regmap_acce=
ss_fops =3D {
> =A0 =A0 =A0 =A0.llseek =3D default_llseek,
> =A0};
>
> -void regmap_debugfs_init(struct regmap *map)
> +void regmap_debugfs_init(struct regmap *map, const char *name)
> =A0{
> - =A0 =A0 =A0 map->debugfs =3D debugfs_create_dir(dev_name(map->dev),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 regmap_debugfs_root);
> + =A0 =A0 =A0 if (name) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 map->debugfs_name =3D kasprintf(GFP_KER=
NEL, "%s-%s",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 dev_name(map->dev), name);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 name =3D map->debugfs_name;
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 name =3D dev_name(map->dev);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 map->debugfs =3D debugfs_create_dir(name, regmap_debugf=
s_root);
> =A0 =A0 =A0 =A0if (!map->debugfs) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_warn(map->dev, "Failed to create d=
ebugfs directory\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> @@ -274,6 +281,7 @@ void regmap_debugfs_init(struct regmap *map)
> =A0void regmap_debugfs_exit(struct regmap *map)
> =A0{
> =A0 =A0 =A0 =A0debugfs_remove_recursive(map->debugfs);
> + =A0 =A0 =A0 kfree(map->debugfs_name);
> =A0}
>
> =A0void regmap_debugfs_initcall(void)
> diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regma=
p.c
> index 831ec42..339b2c8 100644
> --- a/drivers/base/regmap/regmap.c
> +++ b/drivers/base/regmap/regmap.c
> @@ -343,7 +343,7 @@ struct regmap *regmap_init(struct device *dev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err_map;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 regmap_debugfs_init(map);
> + =A0 =A0 =A0 regmap_debugfs_init(map, config->name);
>
> =A0 =A0 =A0 =A0ret =3D regcache_init(map, config);
> =A0 =A0 =A0 =A0if (ret < 0)
> @@ -426,7 +426,7 @@ int regmap_reinit_cache(struct regmap *map, const=
 struct regmap_config *config)
> =A0 =A0 =A0 =A0map->precious_reg =3D config->precious_reg;
> =A0 =A0 =A0 =A0map->cache_type =3D config->cache_type;
>
> - =A0 =A0 =A0 regmap_debugfs_init(map);
> + =A0 =A0 =A0 regmap_debugfs_init(map, config->name);
>
> =A0 =A0 =A0 =A0map->cache_bypass =3D false;
> =A0 =A0 =A0 =A0map->cache_only =3D false;
> diff --git a/include/linux/regmap.h b/include/linux/regmap.h
> index 48e9b86..2fd41e3 100644
> --- a/include/linux/regmap.h
> +++ b/include/linux/regmap.h
> @@ -46,6 +46,9 @@ struct reg_default {
> =A0/**
> =A0* Configuration for the register map of a device.
> =A0*
> + * @name: Optional name of the regmap. Useful when a device has mult=
iple
> + * =A0 =A0 =A0 =A0register regions.
> + *
> =A0* @reg_bits: Number of bits in a register address, mandatory.
> =A0* @pad_bits: Number of bits of padding between register and value.
> =A0* @val_bits: Number of bits in a register value, mandatory.
> @@ -77,6 +80,8 @@ struct reg_default {
> =A0* @num_reg_defaults_raw: Number of elements in reg_defaults_raw.
> =A0*/
> =A0struct regmap_config {
> + =A0 =A0 =A0 const char *name;
> +
> =A0 =A0 =A0 =A0int reg_bits;
> =A0 =A0 =A0 =A0int pad_bits;
> =A0 =A0 =A0 =A0int val_bits;
> --
> 1.7.0.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
