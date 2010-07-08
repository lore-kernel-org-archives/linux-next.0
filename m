From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build warning after merge of the net tree
Date: Wed, 07 Jul 2010 17:45:22 -0700 (PDT)
Message-ID: <20100707.174522.148565561.davem@davemloft.net>
References: <20100706142542.d723903f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:40150
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756524Ab0GHApJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Jul 2010 20:45:09 -0400
In-Reply-To: <20100706142542.d723903f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, joe@perches.com, gregkh@suse.de

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 6 Jul 2010 14:25:42 +1000

> After merging the net tree, today's linux-next build (powerpc
> ppc64_defconfig) produced these warnings:
> 
> drivers/scsi/sym53c8xx_2/sym_hipd.c: In function 'sym_print_msg':
> drivers/scsi/sym53c8xx_2/sym_hipd.c:78: warning: zero-length gnu_printf format string

Thanks Stephen I'll look into this.
