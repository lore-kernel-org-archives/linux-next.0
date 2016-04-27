From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the dt-rh tree with the tegra tree
Date: Wed, 27 Apr 2016 13:50:18 +1000
Message-ID: <20160427135018.2aac12f4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47366 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752274AbcD0DuV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Apr 2016 23:50:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Thierry Reding <treding@nvidia.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>

Hi Rob,

Today's linux-next merge of the dt-rh tree got a conflict in:

  Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt

between commit:

  53cafb93da6f ("dt-bindings: Add documentation for GM20B GPU")

from the tegra tree and commit:

  f43521e95211 ("dt-bindings: tegra: Remove 0, prefix from unit-addresses")

from the dt-rh tree.

I fixed it up (they were very similar) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
