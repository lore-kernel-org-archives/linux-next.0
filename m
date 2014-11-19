From: Stephen Warren <swarren@wwwdotorg.org>
Subject: linux-next: Please update RPi repo location
Date: Wed, 19 Nov 2014 10:10:07 -0700
Message-ID: <546CCEEF.7040604@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:35140 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752950AbaKSRJt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Nov 2014 12:09:49 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: ARM kernel mailing list <linux-arm-kernel@lists.infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Lee Jones <lee@kernel.org>

Stephen,

linux-rpi.git has moved from:

git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-rpi.git#for-next

to

git://git.kernel.org/pub/scm/linux/kernel/git/rpi/linux-rpi.git#for-next

The old location still works due to a symlink/... on kernel.org, but if 
you could update linux-next to pull from the new canonical location, 
that'd be great.

Thanks.
