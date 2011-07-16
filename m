From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for July 16 (tpm)
Date: Sat, 16 Jul 2011 12:17:34 -0700
Message-ID: <20110716121734.97b2e291.rdunlap@xenotime.net>
References: <20110717000815.c83755be9598d34ac8431908@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy9.bluehost.com ([69.89.24.6]:36238 "HELO
	oproxy9.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754277Ab1GPTRi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 16 Jul 2011 15:17:38 -0400
In-Reply-To: <20110717000815.c83755be9598d34ac8431908@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, tpmdd-devel@lists.sourceforge.net
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, James Morris <jmorris@namei.org>

On Sun, 17 Jul 2011 00:08:15 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20110707:

When CONFIG_PNP is not enabled:

drivers/char/tpm/tpm_tis.c:845: error: implicit declaration of function 'tpm_tis_reenable_interrupts'


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
