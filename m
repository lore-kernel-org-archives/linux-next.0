From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree
Date: Mon, 07 Jul 2008 22:44:24 -0700 (PDT)
Message-ID: <20080707.224424.266564848.davem@davemloft.net>
References: <20080708141004.4a0aef3c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:60286
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751362AbYGHFoZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Jul 2008 01:44:25 -0400
In-Reply-To: <20080708141004.4a0aef3c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, romieu@fr.zoreil.com, jgarzik@redhat.com, mingo@elte.hu, gorcunov@gmail.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 8 Jul 2008 14:10:04 +1000

> I thought we didn't do defconfig updates for things like this as just
> running "make oldconfig" should have the same effect ...

These defconfig changes have been removed from the net-next-2.6
tree.
