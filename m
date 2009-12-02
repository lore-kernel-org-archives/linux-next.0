From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for December 2 (staging/batman-adv/)
Date: Wed, 2 Dec 2009 12:24:12 -0800
Message-ID: <20091202122412.ddbe8682.randy.dunlap@oracle.com>
References: <20091202171931.5092dd32.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:61909 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753999AbZLBUYf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2009 15:24:35 -0500
In-Reply-To: <20091202171931.5092dd32.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, Marek Lindner <lindner_marek@yahoo.de>, Simon Wunderlich <siwu@hrz.tu-chemnitz.de>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, devel@driverdev.osuosl.org


Kconfig file:

config BATMAN_DEBUG
	bool "B.A.T.M.A.N. debugging"
	depends on BATMAN != n

s/BATMAN/BATMAN_ADV/


thanks.
---
~Randy
