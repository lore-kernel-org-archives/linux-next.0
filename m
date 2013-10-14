From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: linux-next: manual merge of the spi tree
Date: Mon, 14 Oct 2013 19:44:35 +0300
Message-ID: <20131014164435.GG3521@intel.com>
References: <1381762088-18880-1-git-send-email-treding@nvidia.com>
 <1381762088-18880-8-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1381762088-18880-8-git-send-email-treding@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Oct 14, 2013 at 04:48:08PM +0200, Thierry Reding wrote:
> Today's linux-next merge of the spi tree got a conflict in
> 
> 	drivers/spi/spi.c
> 
> Caused by commits cf9eb39 (spi: Fix modalias for ACPI enumerated SPI devices)
> and 33cf00e (spi: attach/detach SPI device to the ACPI power domain).
> 
> I fixed it up (see below). Please verify that the resolution looks good.
> 
> Thanks,
> Thierry
> ---
> diff --cc drivers/spi/spi.c
> index 740f9dd,2d29dee..8a0fc92
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@@ -1037,10 -1143,8 +1155,10 @@@ static acpi_status acpi_spi_add_device(
>   		return AE_OK;
>   	}
>   
>  +	adev->power.flags.ignore_parent = true;
> - 	strlcpy(spi->modalias, dev_name(&adev->dev), sizeof(spi->modalias));
> + 	strlcpy(spi->modalias, acpi_device_hid(adev), sizeof(spi->modalias));
>   	if (spi_add_device(spi)) {
>  +		adev->power.flags.ignore_parent = false;
>   		dev_err(&master->dev, "failed to add SPI device %s from ACPI\n",
>   			dev_name(&adev->dev));
>   		spi_dev_put(spi);

Looks good to me, thanks!
