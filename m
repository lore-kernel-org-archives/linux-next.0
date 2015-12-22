From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the imx-mxs tree
Date: Tue, 22 Dec 2015 11:45:02 +1100
Message-ID: <20151222114502.6adbfdd9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>, Shawn Guo <shawn.guo@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sean Cross <xobs@kosagi.com>, Lucas Stach <l.stach@pengutronix.de>, Thierry Reding <treding@nvidia.com>
List-Id: linux-next.vger.kernel.org

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  Documentation/devicetree/bindings/vendor-prefixes.txt

between commit:

  453bb38ce504 ("devicetree: bindings: Add vendor prefix for Kosagi")

from the imx-mxs tree and commit:

  f42fb5539ab5 ("devicetree: add vendor prefix for Kyocera Corporation")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc Documentation/devicetree/bindings/vendor-prefixes.txt
index e4cd78a4c652,b123731b2dca..000000000000
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@@ -123,7 -124,7 +124,8 @@@ jedec	JEDEC Solid State Technology Asso
  karo	Ka-Ro electronics GmbH
  keymile	Keymile GmbH
  kinetic Kinetic Technologies
 +kosagi	Sutajio Ko-Usagi PTE Ltd.
+ kyo	Kyocera Corporation
  lacie	LaCie
  lantiq	Lantiq Semiconductor
  lenovo	Lenovo Group Ltd.
