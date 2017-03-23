From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the tpmdd
 tree
Date: Thu, 23 Mar 2017 23:36:16 +0200
Message-ID: <20170323213616.rwurvssbplj2yxbg@intel.com>
References: <20170322131319.6278c15d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:40215 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751106AbdCWVgV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Mar 2017 17:36:21 -0400
Content-Disposition: inline
In-Reply-To: <20170322131319.6278c15d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>, James Bottomley <James.Bottomley@HansenPartnership.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>

On Wed, Mar 22, 2017 at 01:13:19PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   drivers/char/tpm/tpm-chip.c
> 
> between commit:
> 
>   d7a97c3e6592 ("tpm: Use the right clean up after cdev_add completes")

I don't think this fix is critical so I could just drop this from my
tree and send it in a separate PR after security/next is synced with
the change mentioned below.

That said, I dropped it.

>   5f6b4fbc12c8 ("tpm: infrastructure for TPM spaces")
>   1b50e13284d7 ("tpm: expose spaces via a device link /dev/tpmrm<n>")
>   849246e7ce9c ("tpm2: add session handle context saving and restoring to the space code")
> 
> from the tpmdd tree and commits:
> 
>   8dbbf5825181 ("tpm-chip: utilize new cdev_device_add helper function")
> 
> from the char-misc tree.
> 
> I fixed it up (I hope, see below) and can carry the fix as necessary.
> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell

Thank you. I will keep this in mind.

/Jarkko

> diff --cc drivers/char/tpm/tpm-chip.c
> index 27a76e706cfd,935f0e92ad61..000000000000
> --- a/drivers/char/tpm/tpm-chip.c
> +++ b/drivers/char/tpm/tpm-chip.c
> @@@ -214,22 -186,7 +214,20 @@@ struct tpm_chip *tpm_chip_alloc(struct 
>   		chip->flags |= TPM_CHIP_FLAG_VIRTUAL;
>   
>   	cdev_init(&chip->cdev, &tpm_fops);
>  +	cdev_init(&chip->cdevs, &tpmrm_fops);
>   	chip->cdev.owner = THIS_MODULE;
>  +	chip->cdevs.owner = THIS_MODULE;
> - 	chip->cdev.kobj.parent = &chip->dev.kobj;
> - 	chip->cdevs.kobj.parent = &chip->devs.kobj;
>  +
>  +	chip->work_space.context_buf = kzalloc(PAGE_SIZE, GFP_KERNEL);
>  +	if (!chip->work_space.context_buf) {
>  +		rc = -ENOMEM;
>  +		goto out;
>  +	}
>  +	chip->work_space.session_buf = kzalloc(PAGE_SIZE, GFP_KERNEL);
>  +	if (!chip->work_space.session_buf) {
>  +		rc = -ENOMEM;
>  +		goto out;
>  +	}
>   
>   	return chip;
>   
> @@@ -269,69 -225,17 +267,44 @@@ struct tpm_chip *tpmm_chip_alloc(struc
>   }
>   EXPORT_SYMBOL_GPL(tpmm_chip_alloc);
>   
> - static void tpm_del_char_device(struct tpm_chip *chip, bool with_device)
> ++static void tpm_del_char_device(struct tpm_chip *chip)
>  +{
> - 	cdev_del(&chip->cdev);
> - 	if (with_device) {
> - 		device_del(&chip->dev);
> - 
> - 		/* Make the chip unavailable. */
> - 		mutex_lock(&idr_lock);
> - 		idr_replace(&dev_nums_idr, NULL, chip->dev_num);
> - 		mutex_unlock(&idr_lock);
> - 	}
> ++	cdev_device_del(&chip->cdev, &chip->dev);
> ++
> ++	/* Make the chip unavailable. */
> ++	mutex_lock(&idr_lock);
> ++	idr_replace(&dev_nums_idr, NULL, chip->dev_num);
> ++	mutex_unlock(&idr_lock);
>  +
>  +	/* Make the driver uncallable. */
>  +	down_write(&chip->ops_sem);
>  +	if (chip->flags & TPM_CHIP_FLAG_TPM2)
>  +		tpm2_shutdown(chip, TPM2_SU_CLEAR);
>  +	chip->ops = NULL;
>  +	up_write(&chip->ops_sem);
>  +}
>  +
>   static int tpm_add_char_device(struct tpm_chip *chip)
>   {
>   	int rc;
>   
> - 	rc = cdev_add(&chip->cdev, chip->dev.devt, 1);
> - 	if (rc) {
> - 		dev_err(&chip->dev,
> - 			"unable to cdev_add() %s, major %d, minor %d, err=%d\n",
> - 			dev_name(&chip->dev), MAJOR(chip->dev.devt),
> - 			MINOR(chip->dev.devt), rc);
> - 		return rc;
> - 	}
> - 
> - 	rc = device_add(&chip->dev);
> + 	rc = cdev_device_add(&chip->cdev, &chip->dev);
>   	if (rc) {
>   		dev_err(&chip->dev,
> - 			"unable to device_register() %s, major %d, minor %d, err=%d\n",
> + 			"unable to cdev_device_add() %s, major %d, minor %d, err=%d\n",
>   			dev_name(&chip->dev), MAJOR(chip->dev.devt),
>   			MINOR(chip->dev.devt), rc);
> - 		tpm_del_char_device(chip, false);
>  +		return rc;
>  +	}
>   
>  +	if (chip->flags & TPM_CHIP_FLAG_TPM2)
> - 		rc = cdev_add(&chip->cdevs, chip->devs.devt, 1);
> ++		rc = cdev_device_add(&chip->cdevs, &chip->devs);
>  +	if (rc) {
>  +		dev_err(&chip->dev,
> - 			"unable to cdev_add() %s, major %d, minor %d, err=%d\n",
> ++			"unable to cdev_device_add() %s, major %d, minor %d, err=%d\n",
>  +			dev_name(&chip->devs), MAJOR(chip->devs.devt),
>  +			MINOR(chip->devs.devt), rc);
> - 		tpm_del_char_device(chip, true);
> - 		return rc;
> - 	}
> - 
> - 	if (chip->flags & TPM_CHIP_FLAG_TPM2)
> - 		rc = device_add(&chip->devs);
> - 	if (rc) {
> - 		dev_err(&chip->dev,
> - 			"unable to device_register() %s, major %d, minor %d, err=%d\n",
> - 			dev_name(&chip->devs), MAJOR(chip->devs.devt),
> - 			MINOR(chip->devs.devt), rc);
> - 		cdev_del(&chip->cdevs);
> - 		tpm_del_char_device(chip, true);
> ++		tpm_del_char_device(chip);
>   		return rc;
>   	}
>   
> @@@ -450,10 -371,6 +423,8 @@@ void tpm_chip_unregister(struct tpm_chi
>   {
>   	tpm_del_legacy_sysfs(chip);
>   	tpm_bios_log_teardown(chip);
> - 	if (chip->flags & TPM_CHIP_FLAG_TPM2) {
> - 		cdev_del(&chip->cdevs);
> - 		device_del(&chip->devs);
> - 	}
> - 	tpm_del_char_device(chip, true);
> ++	if (chip->flags & TPM_CHIP_FLAG_TPM2)
> ++		cdev_device_del(&chip->cdevs, &chip->devs);
> + 	tpm_del_char_device(chip);
>   }
>   EXPORT_SYMBOL_GPL(tpm_chip_unregister);
