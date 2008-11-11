From: Sujith <Sujith.Manoharan@atheros.com>
Subject: linux-next: build failure
Date: Tue, 11 Nov 2008 13:45:52 +0530
Message-ID: <18713.16184.610870.368360@gargle.gargle.HOWL>
References: <20081111191042.ad5eab44.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.atheros.com ([12.36.123.2]:14415 "EHLO mail.atheros.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752248AbYKKISv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 11 Nov 2008 03:18:51 -0500
Received: from mail.atheros.com ([10.10.20.105])
	by sidewinder.atheros.com
	for <linux-next@vger.kernel.org>; Tue, 11 Nov 2008 00:18:51 -0800
In-Reply-To: <20081111191042.ad5eab44.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Sujith Manoharan <Sujith.Manoharan@Atheros.com>, "David S. Miller" <davem@davemloft.net>

Stephen Rothwell wrote:
> Hi John, Dave,
> 
> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> drivers/net/wireless/ath9k/main.c: At top level:
> drivers/net/wireless/ath9k/main.c:827: warning: conflicting types for 'ath_detach'
> drivers/net/wireless/ath9k/main.c:827: error: static declaration of 'ath_detach' follows non-static declaration
> drivers/net/wireless/ath9k/main.c:812: error: previous implicit declaration of 'ath_detach' was here
> 
> Caused by commit 9c84b7978f1b99048bf31be5a0218cd509e74148 ("ath9k:
> Streamline attach/detach") (from the wireless/net tree) which added a
> call to the static function before it was defined.
> 
> I added the patch below, which then lead to:
> 
> drivers/net/wireless/ath9k/main.c: In function 'ath_start_rfkill_poll':
> drivers/net/wireless/ath9k/main.c:818: error: 'hw' undeclared (first use in this function)
> 
> So I gave up and reverted the wireless tree for today (I actually
> reverted the merge of the wireless tree into the net tree).

A patch was already posted to fix this:
http://marc.info/?l=linux-wireless&m=122580350232179&w=2

Sujith
