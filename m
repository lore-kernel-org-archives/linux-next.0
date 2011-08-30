From: David Brown <davidb@codeaurora.org>
Subject: Removing msm tree from direct linux-next
Date: Tue, 30 Aug 2011 15:54:33 -0700
Message-ID: <20110830225433.GA7138@huya.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251]:19738 "EHLO
	wolverine02.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752618Ab1H3Wyf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Aug 2011 18:54:35 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Stephen, now that the MSM tree is going through Arnd's ARM SOC tree,
it doesn't need to be pulled directly into linux-next.  You can remove
this tree:

msm git://codeaurora.org/quic/kernel/davidb/linux-msm.git#for-next

Thanks,
David Brown

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
