From: "John W. Linville" <linville@tuxdriver.com>
Subject: linux-next: pending wireless/wireless-current merge conflict
Date: Wed, 28 May 2008 20:42:51 -0400
Message-ID: <20080529004251.GD22536@tuxdriver.com>
References: <20080522132031.3c05b6f7.sfr@canb.auug.org.au> <20080522134105.GB3996@tuxdriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ra.tuxdriver.com ([70.61.120.52]:2306 "EHLO ra.tuxdriver.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751379AbYE2A6V (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 28 May 2008 20:58:21 -0400
Content-Disposition: inline
In-Reply-To: <20080522134105.GB3996@tuxdriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org

I just sent a pull request for Dave that will result in a conflict
in the rt2x00 driver.  I have a sample merge available here:

	git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-next-2.6 merge-test-2

Please note the 'merge-test-2' -- I still have the old merge-test
there since Dave hadn't (at my last check anyway) yet pulled the
previous wireless-next-2.6 request into net-next-2.6.

Just a heads-up... :-)

John
-- 
John W. Linville
linville@tuxdriver.com
