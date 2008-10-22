From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for October 21 (printk format warnings)
Date: Tue, 21 Oct 2008 21:57:25 -0700
Message-ID: <20081021215725.b9c2b941.randy.dunlap@oracle.com>
References: <20081021195109.ed83b102.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:62860 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751665AbYJVE5k (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Oct 2008 00:57:40 -0400
In-Reply-To: <20081021195109.ed83b102.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 21 Oct 2008 19:51:09 +1100 Stephen Rothwell wrote:


printk format warnings summary:

i386:

linux-next-20081021/drivers/pci/hotplug/acpiphp_ibm.c:207: warning: format '%08lx' expects type 'long unsigned int', but argument 3 has type 'long long unsigned int'

linux-next-20081021/drivers/misc/intel_menlow.c:107: warning: format '%ld' expects type 'long int', but argument 3 has type 'long long unsigned int'

x86_64:

linux-next-20081021/drivers/pci/hotplug/acpiphp_ibm.c:207: warning: format '%08lx' expects type 'long unsigned int', but argument 3 has type 'long long unsigned int'

linux-next-20081021/drivers/usb/misc/vstusb.c:623: warning: format '%d' expects type 'int', but argument 5 has type 'size_t'

linux-next-20081021/drivers/misc/intel_menlow.c:107: warning: format '%ld' expects type 'long int', but argument 3 has type 'long long unsigned int'



Other arches not built, but a few of them are really good at finding this
sort of problem...

---
~Randy
