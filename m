From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for November 17 (exofs)
Date: Tue, 17 Nov 2009 09:02:48 -0800
Message-ID: <20091117090248.bb66c230.rdunlap@xenotime.net>
References: <20091117195309.6cc3ead0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.64.118]:58359 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1752308AbZKQRCo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Nov 2009 12:02:44 -0500
Received: from chimera.site ([96.253.169.185]) by xenotime.net for <linux-next@vger.kernel.org>; Tue, 17 Nov 2009 09:02:49 -0800
In-Reply-To: <20091117195309.6cc3ead0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Boaz Harrosh <bharrosh@panasas.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 17 Nov 2009 19:53:09 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20091116:


on i386 (X86_32):

fs/built-in.o: In function `exofs_sbi_read':
(.text+0x592964): undefined reference to `__umoddi3'

---
~Randy
