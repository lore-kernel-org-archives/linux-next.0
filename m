From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for July 9 (x86/pci)
Date: Thu, 9 Jul 2009 10:30:21 -0700
Message-ID: <20090709103021.d39a711a.randy.dunlap@oracle.com>
References: <20090709163031.acdb5439.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:57945 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751066AbZGIRaZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Jul 2009 13:30:25 -0400
In-Reply-To: <20090709163031.acdb5439.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 9 Jul 2009 16:30:31 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20090708:


when ACPI is disabled (SFI=y):


arch/x86/pci/mmconfig_32.c: In function 'get_base_addr':
arch/x86/pci/mmconfig_32.c:34: error: invalid use of undefined type 'struct acpi_mcfg_allocation'
arch/x86/pci/mmconfig_32.c:34: error: dereferencing pointer to incomplete type
arch/x86/pci/mmconfig_32.c:35: error: dereferencing pointer to incomplete type
arch/x86/pci/mmconfig_32.c:36: error: dereferencing pointer to incomplete type
arch/x86/pci/mmconfig_32.c:37: error: dereferencing pointer to incomplete type
arch/x86/pci/mmconfig_32.c:38: error: dereferencing pointer to incomplete type

(X86_32, clearly)

---
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
