From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build failure
Date: Mon, 12 Oct 2009 23:20:42 -0700 (PDT)
Message-ID: <20091012.232042.170805942.davem@davemloft.net>
References: <20091013153308.af56910a.sfr@canb.auug.org.au>
	<C27F8246C663564A84BB7AB34397724217C978403F@IRVEXCHCCR01.corp.ad.broadcom.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:46857
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932581AbZJMGUq (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 13 Oct 2009 02:20:46 -0400
In-Reply-To: <C27F8246C663564A84BB7AB34397724217C978403F@IRVEXCHCCR01.corp.ad.broadcom.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: mchan@broadcom.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, shmulikr@broadcom.com

From: "Michael Chan" <mchan@broadcom.com>
Date: Mon, 12 Oct 2009 22:14:22 -0700

> I think adding #include <net/ip6_checksum.h> will work.  Will send a
> patch right away.  Thanks.

Too slow, I already fixed this :-)
