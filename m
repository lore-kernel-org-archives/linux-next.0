From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for June 27 (uml)
Date: Mon, 27 Jun 2011 08:27:33 -0700
Message-ID: <20110627082733.75e58ae4.randy.dunlap@oracle.com>
References: <20110627161656.688820b9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:46918 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750921Ab1F0P2L (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Jun 2011 11:28:11 -0400
In-Reply-To: <20110627161656.688820b9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Richard Weinberger <richard@nod.at>, Jeff Dike <jdike@addtoit.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, user-mode-linux-devel@lists.sourceforge.net

On Mon, 27 Jun 2011 16:16:56 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20110624:


uml defconfig builds on x86 (32-bit and 64-bit) fail with:

fs/hostfs/hostfs_kern.c:756: error: 'mask' undeclared (first use in this function)


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
