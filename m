From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Nov 1 (ata/libata-sff.c)
Date: Tue, 01 Nov 2011 16:48:29 -0700
Message-ID: <4EB0854D.5090002@xenotime.net>
References: <20111101205323.c12f2f940f23febba8ab8989@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy6-pub.bluehost.com ([67.222.54.6]:50863 "HELO
	oproxy6-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S932305Ab1KAXtA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Nov 2011 19:49:00 -0400
In-Reply-To: <20111101205323.c12f2f940f23febba8ab8989@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>, Jeff Garzik <jgarzik@pobox.com>

On 11/01/2011 02:53 AM, Stephen Rothwell wrote:
> Hi all,


When ATA_SFF is enabled but ATA_BMDMA is not enabled:


drivers/ata/libata-sff.c: In function 'ata_pci_init_one':
drivers/ata/libata-sff.c:2538:3: error: implicit declaration of function 'ata_pci_bmdma_prepare_host'
drivers/ata/libata-sff.c:2549:40: error: 'ata_bmdma_interrupt' undeclared (first use in this function)

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
