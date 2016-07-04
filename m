From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the thermal-soc tree with the thermal
 tree
Date: Mon, 4 Jul 2016 12:55:22 +1000
Message-ID: <20160704125522.011806af@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Eduardo Valentin <edubezval@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: linux-next.vger.kernel.org

Hi Eduardo,

Today's linux-next merge of the thermal-soc tree got conflicts in:

  drivers/thermal/thermal_core.c
  drivers/thermal/thermal_helpers.c
  drivers/thermal/thermal_sysfs.c

between commits from the thermal tree and the same (or similar) patches
from the thermal-soc tree.

It looks like a the patches have been slightly changed when applied to the
thermal tree and then more commist have been applied to the thermal-soc
tree, so there are a few conflicts generated.   Please fix up these trees.

I fixed it up (I used what seemed the appropriate versions - which may
or may not be the right ones) and can carry the fixes as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell
