From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: build failure after merge of the thermal-soc tree
Date: Mon, 13 May 2019 08:57:21 -0700
Message-ID: <20190513155721.GA26559@roeck-us.net>
References: <20190513110244.0a0dc431@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190513110244.0a0dc431@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Eduardo Valentin <edubezval@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, May 13, 2019 at 11:02:44AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the thermal-soc tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> ld: drivers/infiniband/hw/cxgb4/cm.o: in function `.devm_thermal_of_cooling_device_register':
> (.text+0x23f0): multiple definition of `.devm_thermal_of_cooling_device_register'; drivers/infiniband/hw/cxgb4/device.o:(.text+0x28c0): first defined here
> ld: drivers/infiniband/hw/cxgb4/cm.o:(.opd+0x2e8): multiple definition of `devm_thermal_of_cooling_device_register'; drivers/infiniband/hw/cxgb4/device.o:(.opd+0x198): first defined here

[...]

> @@ -508,7 +508,7 @@ static inline struct thermal_cooling_device *
>  thermal_of_cooling_device_register(struct device_node *np,
>  	char *type, void *devdata, const struct thermal_cooling_device_ops *ops)
>  { return ERR_PTR(-ENODEV); }
> -struct thermal_cooling_device *
> +static inline struct thermal_cooling_device *
>  devm_thermal_of_cooling_device_register(struct device *dev,
>  				struct device_node *np,
>  				char *type, void *devdata,

Ah, I had wondered where that was coming from. Eduardo, can you pick up the
fix, or even better merge it into the original patch ?

Thanks,
Guenter
