From: Grant Likely <grant.likely@secretlab.ca>
Subject: Please add irqdomain branch to linux-next
Date: Thu, 2 Feb 2012 14:10:31 -0700
Message-ID: <CACxGe6sTO_Jy-vecKS9SoVs55ZA8BMc+O0NODLdq6KvkcbPByg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:61798 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755385Ab2BBVKv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Feb 2012 16:10:51 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>

Hi Stephen,

Can you please add the following branch to linux-next?  It contains
the majority of the irqdomain rework that I've been doing.  I'd like
to get it marinating in linux-next early so I'm sure it will be ready
when the v3.4 merge window rolls around.

git://git.secretlab.ca/git/linux-2.6.git irqdomain/next

Thanks,
g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
