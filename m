From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the wireless-drivers-next
 tree
Date: Fri, 19 Feb 2016 10:10:35 +1100
Message-ID: <20160219101035.44c84f2b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34568 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1947005AbcBRXKh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Feb 2016 18:10:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Kalle,

After merging the wireless-drivers-next tree, today's linux-next build
failed the same way as the net-next tree did yesterday (suprise! :-)).

I have used the version from next-20160218 for today.

-- 
Cheers,
Stephen Rothwell
