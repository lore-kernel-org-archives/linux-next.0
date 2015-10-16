From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the dt-rh tree with the regulator tree
Date: Fri, 16 Oct 2015 14:07:04 +1100
Message-ID: <20151016140704.198b10d8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>
List-Id: linux-next.vger.kernel.org

Hi Rob,

Today's linux-next merge of the dt-rh tree got a conflict in:

  drivers/regulator/core.c

between commit:

  85f3b4311629 ("regulator: core: Remove regulator_list")

from the regulator tree and commit:

  5634acd9c8e3 ("regulator: core: Probe regulators on demand")

from the dt-rh tree.

I fixed it up (I think - see below) and can carry the fix as necessary
(no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/regulator/core.c
index 7896ef53ff86,c2e5c2ae85c1..000000000000
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@@ -1421,9 -1341,11 +1422,10 @@@ static struct regulator_dev *regulator_
  	if (dev && dev->of_node) {
  		node = of_get_regulator(dev, supply);
  		if (node) {
+ 			of_device_probe(node);
 -			list_for_each_entry(r, &regulator_list, list)
 -				if (r->dev.parent &&
 -					node == r->dev.of_node)
 -					return r;
 +			r = of_find_regulator_by_node(node);
 +			if (r)
 +				return r;
  			*ret = -EPROBE_DEFER;
  			return NULL;
  		} else {
