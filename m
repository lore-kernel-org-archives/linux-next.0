From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jun 4 (radeonfb && xfs)
Date: Thu, 04 Jun 2015 12:15:18 -0700
Message-ID: <5570A3C6.6050509@infradead.org>
References: <20150604231545.506332b5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:47313 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751874AbbFDTP1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2015 15:15:27 -0400
In-Reply-To: <20150604231545.506332b5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Linux Fbdev development list <linux-fbdev@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, xfs@oss.sgi.com

On 06/04/15 06:15, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150603:
> 


on i386:

fs/built-in.o: In function `xfs_ifree_cluster':
xfs_inode.c:(.text+0x1c491a): undefined reference to `__umoddi3'

drivers/built-in.o: In function `radeonfb_pci_register':
radeon_base.c:(.text+0x72fe0): undefined reference to `__divdi3'



-- 
~Randy
