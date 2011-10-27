From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: linux-next: manual merge of the libata tree with the at91 tree
Date: Fri, 28 Oct 2011 00:05:50 +0200
Message-ID: <4EA9D5BE.6020508@mvista.com>
References: <20111025083819.0940cc9ecefac0d5390a23eb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:51526 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755136Ab1J0WGS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 27 Oct 2011 18:06:18 -0400
In-Reply-To: <20111025083819.0940cc9ecefac0d5390a23eb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeff Garzik <jeff@garzik.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sergei Shtylyov <sshtylyov@ru.mvista.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>

Hello.

On 24.10.2011 23:38, Stephen Rothwell wrote:
> Today's linux-next merge of the libata tree got a conflict in
> drivers/ata/pata_at91.c between commit 9585cf300d98 ("ARM: at91/pata: use
> gpio_is_valid to check the gpio") from the at91 tree and commit
> 8e3bfdb95ad7 ("pata_at91: call clk_put() on ata_host_activate() failure")
> from the libata tree.

    I knew about this conflict and have informed Jean-Cristophe on 
LAKML. I don't know why libata driver changes went in via the at91 tree...

> I fixed it up (see below) and can carry the fix as necessary.

    Thanks.

MBR, Sergei
