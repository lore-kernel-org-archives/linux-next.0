From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: [PATCH] PCI hotplug printk format
Date: Fri, 24 Oct 2008 10:49:41 -0700
Message-ID: <200810241049.42017.jbarnes@virtuousgeek.org>
References: <20081023213637.eff9b414.sfr@canb.auug.org.au> <20081023181455.336e5d03.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-32.bluehost.com ([69.89.18.152]:47277 "HELO
	outbound-mail-32.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1753962AbYJXRtz (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 24 Oct 2008 13:49:55 -0400
In-Reply-To: <20081023181455.336e5d03.randy.dunlap@oracle.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>, torvalds <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org

On Thursday, October 23, 2008 6:14 pm Randy Dunlap wrote:
> I made this patch for linux-next, but now mainline has this same
> code/warning.
>
>
> From: Randy Dunlap <randy.dunlap@oracle.com>
>
> Fix printk format warning:
>
> linux-next-20081023/drivers/pci/hotplug/acpiphp_ibm.c:207: warning: format
> '%08lx' expects type 'long unsigned int', but argument 3 has type 'long
> long unsigned int'
>
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

Spoke too soon, this one was already merged.

Jesse
