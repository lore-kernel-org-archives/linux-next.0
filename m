From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for June 6 (sctp)
Date: Mon, 6 Jun 2011 12:55:32 -0700
Message-ID: <20110606125532.793b3cfd.randy.dunlap@oracle.com>
References: <20110606132036.aebd73a4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:40149 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751632Ab1FFTzv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 6 Jun 2011 15:55:51 -0400
In-Reply-To: <20110606132036.aebd73a4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-sctp@vger.kernel.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>

On Mon, 6 Jun 2011 13:20:36 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20110603:


when CONFIG_IPV6 is not enabled:

ERROR: "ipv6_chk_addr" [net/sctp/sctp.ko] undefined!



---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
