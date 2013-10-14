From: Thierry Reding <thierry.reding@gmail.com>
Subject: linux-next: manual merge of the pm tree
Date: Mon, 14 Oct 2013 16:48:07 +0200
Message-ID: <1381762088-18880-7-git-send-email-treding@nvidia.com>
References: <1381762088-18880-1-git-send-email-treding@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1381762088-18880-1-git-send-email-treding@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lars-Peter Clausen <lars@metafoo.de>, Lv Zheng <lv.zheng@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Today's linux-next merge of the pm tree (5d5e5df) got conflicts in

	drivers/i2c/i2c-core.c

caused by commits 0acc2b3 (i2c: Remove redundant 'driver' field from the
i2c_client struct) and a76e9bd (i2c: attach/detach I2C client device to
the ACPI power domain).

I fixed them up (see below). Please verify that the resolution looks
good.

Thanks,
Thierry
---
diff --cc drivers/i2c/i2c-core.c
index 111b2c6,03a8ae6..5923cfa
--- a/drivers/i2c/i2c-core.c
+++ b/drivers/i2c/i2c-core.c
@@@ -254,10 -254,13 +254,12 @@@ static int i2c_device_probe(struct devi
  					client->flags & I2C_CLIENT_WAKE);
  	dev_dbg(dev, "probe\n");
  
+ 	acpi_dev_pm_attach(&client->dev, true);
  	status = driver->probe(client, i2c_match_id(driver->id_table, client));
- 	if (status)
+ 	if (status) {
 -		client->driver = NULL;
  		i2c_set_clientdata(client, NULL);
- 
+ 		acpi_dev_pm_detach(&client->dev, true);
+ 	}
  	return status;
  }
  
@@@ -278,9 -281,11 +280,9 @@@ static int i2c_device_remove(struct dev
  		dev->driver = NULL;
  		status = 0;
  	}
 -	if (status == 0) {
 -		client->driver = NULL;
 +	if (status == 0)
  		i2c_set_clientdata(client, NULL);
- 
 -	}
+ 	acpi_dev_pm_detach(&client->dev, true);
  	return status;
  }
  
