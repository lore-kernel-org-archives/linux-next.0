From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the devicetree
 tree
Date: Fri, 27 Jul 2018 10:36:36 +0200
Message-ID: <20180727083636.GB17942@kroah.com>
References: <20180727175300.0a1fb512@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180727175300.0a1fb512@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rob Herring <robherring2@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, Brian Masney <masneyb@onstation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
List-Id: linux-next.vger.kernel.org

On Fri, Jul 27, 2018 at 05:53:13PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   Documentation/devicetree/bindings/iio/pressure/bmp085.txt
> 
> between commit:
> 
>   791d3ef2e111 ("dt-bindings: remove 'interrupt-parent' from bindings")
> 
> from the devicetree tree and commit:
> 
>   d2b863baf1c7 ("iio: pressure: bmp280: remove unused options from device tree documentation")
> 
> from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc Documentation/devicetree/bindings/iio/pressure/bmp085.txt
> index 5498b0688b6f,abcab02504fb..000000000000
> --- a/Documentation/devicetree/bindings/iio/pressure/bmp085.txt
> +++ b/Documentation/devicetree/bindings/iio/pressure/bmp085.txt
> @@@ -8,10 -8,7 +8,6 @@@ Required properties
>     "bosch,bme280"
>   
>   Optional properties:
> - - chip-id: configurable chip id for non-default chip revisions
> - - temp-measurement-period: temperature measurement period (milliseconds)
> - - default-oversampling: default oversampling value to be used at startup,
> -   value range is 0-3 with rising sensitivity.
>  -- interrupt-parent: should be the phandle for the interrupt controller
>   - interrupts: interrupt mapping for IRQ
>   - reset-gpios: a GPIO line handling reset of the sensor: as the line is
>     active low, it should be marked GPIO_ACTIVE_LOW (see gpio/gpio.txt)


Looks correct to me, thanks!

greg k-h
