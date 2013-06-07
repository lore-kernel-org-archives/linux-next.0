From: Sujith Manoharan <sujith@msujith.org>
Subject: Re: linux-next: manual merge of the wireless-next tree with the
 wireless tree
Date: Fri, 7 Jun 2013 11:51:01 +0530
Message-ID: <20913.31693.629856.620724@gargle.gargle.HOWL>
References: <20130607125612.4016cd4ee44614642dc5dd31@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from s72.web-hosting.com ([198.187.29.21]:58682 "EHLO
	s72.web-hosting.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752285Ab3FGGxy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 7 Jun 2013 02:53:54 -0400
In-Reply-To: <20130607125612.4016cd4ee44614642dc5dd31@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sujith Manoharan <c_manoha@qca.qualcomm.com>

Stephen Rothwell wrote:
> Today's linux-next merge of the wireless-next tree got a conflict in
> drivers/net/wireless/ath/ath9k/Kconfig between commit 8bb7f167a12a
> ("ath9k: Use minstrel rate control by default") from the wireless tree
> and commit cf657a2bc50d ("ath9k: Remove MAC_DEBUG") from the
> wireless-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks !

Sujith
