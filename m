From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the char-misc tree with the tpmdd tree
Date: Fri, 24 Mar 2017 14:33:02 +1100
Message-ID: <20170324143302.33eed1a6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>, James Bottomley <James.Bottomley@HansenPartnership.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/char/tpm/tpm-chip.c

between commits:

  67b67480db8b ("tpm: infrastructure for TPM spaces")
  b8e3586e8536 ("tpm: expose spaces via a device link /dev/tpmrm<n>")

from the tpmdd tree and commit:

  8dbbf5825181 ("tpm-chip: utilize new cdev_device_add helper function")

from the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/char/tpm/tpm-chip.c
index aade6995f310,935f0e92ad61..000000000000
--- a/drivers/char/tpm/tpm-chip.c
+++ b/drivers/char/tpm/tpm-chip.c
@@@ -214,22 -186,7 +214,20 @@@ struct tpm_chip *tpm_chip_alloc(struct 
  		chip->flags |= TPM_CHIP_FLAG_VIRTUAL;
  
  	cdev_init(&chip->cdev, &tpm_fops);
 +	cdev_init(&chip->cdevs, &tpmrm_fops);
  	chip->cdev.owner = THIS_MODULE;
 +	chip->cdevs.owner = THIS_MODULE;
- 	chip->cdev.kobj.parent = &chip->dev.kobj;
- 	chip->cdevs.kobj.parent = &chip->devs.kobj;
 +
 +	chip->work_space.context_buf = kzalloc(PAGE_SIZE, GFP_KERNEL);
 +	if (!chip->work_space.context_buf) {
 +		rc = -ENOMEM;
 +		goto out;
 +	}
 +	chip->work_space.session_buf = kzalloc(PAGE_SIZE, GFP_KERNEL);
 +	if (!chip->work_space.session_buf) {
 +		rc = -ENOMEM;
 +		goto out;
 +	}
  
  	return chip;
  
@@@ -273,44 -229,13 +271,22 @@@ static int tpm_add_char_device(struct t
  {
  	int rc;
  
- 	rc = cdev_add(&chip->cdev, chip->dev.devt, 1);
+ 	rc = cdev_device_add(&chip->cdev, &chip->dev);
  	if (rc) {
  		dev_err(&chip->dev,
- 			"unable to cdev_add() %s, major %d, minor %d, err=%d\n",
+ 			"unable to cdev_device_add() %s, major %d, minor %d, err=%d\n",
  			dev_name(&chip->dev), MAJOR(chip->dev.devt),
  			MINOR(chip->dev.devt), rc);
 +		return rc;
 +	}
  
- 	rc = device_add(&chip->dev);
- 	if (rc) {
- 		dev_err(&chip->dev,
- 			"unable to device_register() %s, major %d, minor %d, err=%d\n",
- 			dev_name(&chip->dev), MAJOR(chip->dev.devt),
- 			MINOR(chip->dev.devt), rc);
- 
- 		cdev_del(&chip->cdev);
- 		return rc;
- 	}
- 
- 	if (chip->flags & TPM_CHIP_FLAG_TPM2)
- 		rc = cdev_add(&chip->cdevs, chip->devs.devt, 1);
- 	if (rc) {
- 		dev_err(&chip->dev,
- 			"unable to cdev_add() %s, major %d, minor %d, err=%d\n",
- 			dev_name(&chip->devs), MAJOR(chip->devs.devt),
- 			MINOR(chip->devs.devt), rc);
- 		return rc;
- 	}
- 
 +	if (chip->flags & TPM_CHIP_FLAG_TPM2)
- 		rc = device_add(&chip->devs);
++		rc = cdev_device_add(&chip->cdevs, &chip->devs);
 +	if (rc) {
 +		dev_err(&chip->dev,
- 			"unable to device_register() %s, major %d, minor %d, err=%d\n",
++			"unable to cdev_device_add() %s, major %d, minor %d, err=%d\n",
 +			dev_name(&chip->devs), MAJOR(chip->devs.devt),
 +			MINOR(chip->devs.devt), rc);
- 		cdev_del(&chip->cdevs);
  		return rc;
  	}
  
@@@ -447,10 -371,6 +422,8 @@@ void tpm_chip_unregister(struct tpm_chi
  {
  	tpm_del_legacy_sysfs(chip);
  	tpm_bios_log_teardown(chip);
- 	if (chip->flags & TPM_CHIP_FLAG_TPM2) {
- 		cdev_del(&chip->cdevs);
- 		device_del(&chip->devs);
- 	}
++	if (chip->flags & TPM_CHIP_FLAG_TPM2)
++		cdev_device_del(&chip->cdevs, &chip->devs);
  	tpm_del_char_device(chip);
  }
  EXPORT_SYMBOL_GPL(tpm_chip_unregister);
