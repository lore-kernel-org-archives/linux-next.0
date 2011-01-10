From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the hwmon-staging tree with the
 jdelvare-hwmon tree
Date: Mon, 10 Jan 2011 13:20:57 +1100
Message-ID: <20110110132057.bc5d54a0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <guenter.roeck@ericsson.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, Juerg Haefliger <juergh@gmail.com>, Jean Delvare <khali@linux-fr.org>
List-Id: linux-next.vger.kernel.org

Hi Guenter,

Today's linux-next merge of the hwmon-staging tree got a conflict in
drivers/hwmon/dme1737.c between commit
b7f2a5c8c9190fcf0126d43972a8ad37eb98f5d0 ("hwmon: (dme1737) Minor
cleanups") from the jdelvare-hwmon tree and commit
9c6e13b411cf0f656b7d7a78ec35bf0069f631bb ("hwmon: (dme1737) Use pr_fmt
and pr_<level>") from the hwmon-staging tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/hwmon/dme1737.c
index a3430e3,e9a610b..0000000
--- a/drivers/hwmon/dme1737.c
+++ b/drivers/hwmon/dme1737.c
@@@ -2497,10 -2446,9 +2499,10 @@@ static int __init dme1737_isa_detect(in
  	dme1737_sio_outb(sio_cip, 0x07, 0x0a);
  
  	/* Get the base address of the runtime registers */
 -	if (!(base_addr = (dme1737_sio_inb(sio_cip, 0x60) << 8) |
 -			   dme1737_sio_inb(sio_cip, 0x61))) {
 +	base_addr = (dme1737_sio_inb(sio_cip, 0x60) << 8) |
 +		     dme1737_sio_inb(sio_cip, 0x61);
 +	if (!base_addr) {
- 		printk(KERN_ERR "dme1737: Base address not set.\n");
+ 		pr_err("Base address not set\n");
  		err = -ENODEV;
  		goto exit;
  	}
@@@ -2528,24 -2476,19 +2530,22 @@@ static int __init dme1737_isa_device_ad
  	if (err)
  		goto exit;
  
 -	if (!(pdev = platform_device_alloc("dme1737", addr))) {
 +	pdev = platform_device_alloc("dme1737", addr);
 +	if (!pdev) {
- 		printk(KERN_ERR "dme1737: Failed to allocate device.\n");
+ 		pr_err("Failed to allocate device\n");
  		err = -ENOMEM;
  		goto exit;
  	}
  
 -	if ((err = platform_device_add_resources(pdev, &res, 1))) {
 +	err = platform_device_add_resources(pdev, &res, 1);
 +	if (err) {
- 		printk(KERN_ERR "dme1737: Failed to add device resource "
- 		       "(err = %d).\n", err);
+ 		pr_err("Failed to add device resource (err = %d)\n", err);
  		goto exit_device_put;
  	}
  
 -	if ((err = platform_device_add(pdev))) {
 +	err = platform_device_add(pdev);
 +	if (err) {
- 		printk(KERN_ERR "dme1737: Failed to add device (err = %d).\n",
- 		       err);
+ 		pr_err("Failed to add device (err = %d)\n", err);
  		goto exit_device_put;
  	}
  
