From: Sujith Manoharan <c_manoha@qualcomm.com>
Subject: linux-next: manual merge of the wireless-next tree with the pci
 tree
Date: Wed, 26 Sep 2012 08:02:04 +0530
Message-ID: <20578.26916.325009.547470@gargle.gargle.HOWL>
References: <20120926120317.63d0b4acb0502bc4c2ffe4b8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254]:12980 "EHLO
	wolverine01.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750913Ab2IZCdG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Sep 2012 22:33:06 -0400
In-Reply-To: <20120926120317.63d0b4acb0502bc4c2ffe4b8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sujith Manoharan <c_manoha@qualcomm.com>, Jiang Liu <jiang.liu@huawei.com>, Bjorn Helgaas <bhelgaas@google.com>

Stephen Rothwell wrote:
> Hi John,
> 
> Today's linux-next merge of the wireless-next tree got a conflict in
> drivers/net/wireless/ath/ath9k/pci.c between commit 08bd108096b6 ("ath9k:
> Use PCI Express Capability accessors") from the pci tree and commit
> 046b6802c8d3 ("ath9k: Disable ASPM only for AR9285") from the
> wireless-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

The fix looks good, thanks.

Sujith
