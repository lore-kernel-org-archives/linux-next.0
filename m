From: Mariusz Kozlowski <mk@lab.zgora.pl>
Subject: Re: linux-next: Tree for March 7
Date: Mon, 7 Mar 2011 20:05:37 +0100
Message-ID: <20110307190537.GA5694@mako-laptop>
References: <20110307180547.0cd7b9eb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from unix.wroclaw.pl ([94.23.28.62]:35619 "EHLO unix.wroclaw.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752815Ab1CGTFm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Mar 2011 14:05:42 -0500
Content-Disposition: inline
In-Reply-To: <20110307180547.0cd7b9eb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Narendra K <narendra_k@dell.com>, linux-pci@vger.kernel.org

On Mon, Mar 07, 2011 at 06:05:47PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20110304:

drivers/pci/pci-label.c: In function 'pci_create_firmware_label_files':
drivers/pci/pci-label.c:366: error: implicit declaration of function 'device_has_dsm'

Fails for !CONFIG_ACPI.

pci_create_firmware_label_files() uses device_has_dsm() which definition
is under #ifdef CONFIG_ACPI.

-- 
Mariusz Kozlowski
