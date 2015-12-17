From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the regulator tree with the qcom tree
Date: Thu, 17 Dec 2015 13:01:29 +1100
Message-ID: <20151217130129.7ba3b7ae@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52227 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753607AbbLQCBb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Dec 2015 21:01:31 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <agross@codeaurora.org>

Hi all,

Today's linux-next merge of the regulator tree got a conflict in:

  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt

between commit:

  f6251e80956d ("soc: qcom: documentation: Update SMD/RPM Docs")
  9ee8373a1552 ("soc: qcom: smd-rpm: Add existing platform support")

from the qcom tree and commit:

  7a400585893e ("soc: qcom: documentation: Update SMD/RPM Docs")

from the regulator tree.

I fixed it up (I used the qcom tree version - please sort out the
mess).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
