From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: linux-next: manual merge of the net-next tree with the wireless
 tree
Date: Tue, 2 Apr 2013 11:30:38 +0200
Message-ID: <20130402093038.GF17363@zurbaran>
References: <20130402130044.ddacc1c990698bd416e4c808@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:61077 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760449Ab3DBJap (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Apr 2013 05:30:45 -0400
Content-Disposition: inline
In-Reply-To: <20130402130044.ddacc1c990698bd416e4c808@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "John W. Linville" <linville@tuxdriver.com>
Cc: David Miller <davem@davemloft.net>, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi John, Stephen,

On Tue, Apr 02, 2013 at 01:00:44PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the net-next tree got a conflict in
> drivers/nfc/microread/mei.c between commit 9593b0b1179c ("NFC: microread:
> Fix build failure due to a new MEI bus API") from the wireless tree and
> commit 63cd353c34a0 ("NFC: microread: Fix MEI build failure") from the
> net-next tree.
John, sorry for the conflict.

I sent a patch to John for wireless-next that will fix it once it
ends up in net-next.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
