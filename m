From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Wed, 27 Apr 2016 14:54:00 +1000
Message-ID: <20160427145400.7bf1e6bb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gregor Boirie <gregor.boirie@parrot.com>, Jonathan Cameron <jic23@kernel.org>, Richard Leitner <dev@g0hl1n.net>
List-Id: linux-next.vger.kernel.org

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/iio/magnetometer/ak8975.c

between commit:

  05be8d4101d9 ("iio: ak8975: fix maybe-uninitialized warning")

from the staging.current tree and commit:

  97eacb9166f4 ("iio:ak8975: add mounting matrix support")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/iio/magnetometer/ak8975.c
index 0e931a9a1669,dbf066129a04..000000000000
--- a/drivers/iio/magnetometer/ak8975.c
+++ b/drivers/iio/magnetometer/ak8975.c
@@@ -732,11 -851,13 +851,13 @@@ static int ak8975_probe(struct i2c_clie
  	int eoc_gpio;
  	int err;
  	const char *name = NULL;
 -	enum asahi_compass_chipset chipset;
 +	enum asahi_compass_chipset chipset = AK_MAX_TYPE;
+ 	const struct ak8975_platform_data *pdata =
+ 		dev_get_platdata(&client->dev);
  
  	/* Grab and set up the supplied GPIO. */
- 	if (client->dev.platform_data)
- 		eoc_gpio = *(int *)(client->dev.platform_data);
+ 	if (pdata)
+ 		eoc_gpio = pdata->eoc_gpio;
  	else if (client->dev.of_node)
  		eoc_gpio = of_get_gpio(client->dev.of_node, 0);
  	else
