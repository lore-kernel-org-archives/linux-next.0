From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: linux-next: pci tree build failure
Date: Mon, 4 Jan 2010 16:10:01 -0700
Message-ID: <20100104231001.GF9882@parisc-linux.org>
References: <20100105095543.8c446cb7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from palinux.external.hp.com ([192.25.206.14]:56597 "EHLO
	mail.parisc-linux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753976Ab0ADXKF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Jan 2010 18:10:05 -0500
Content-Disposition: inline
In-Reply-To: <20100105095543.8c446cb7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jan 05, 2010 at 09:55:43AM +1100, Stephen Rothwell wrote:
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> drivers/pci/hotplug/rpaphp_core.c:433: error: unknown field 'get_max_bus_speed' specified in initializer
> drivers/pci/hotplug/rpaphp_core.c:433: warning: excess elements in struct initializer
> drivers/pci/hotplug/rpaphp_core.c:433: warning: (near initialization for 'rpaphp_hotplug_slot_ops')
> 
> Caused by commit 7227d60c98ad0e1af49c717a62515d74002dd754 ("PCI: Make
> current and maximum bus speeds part of the PCI core").
> 
> I have used the version of the pci tree from next-20100104 for today.

Doh, sorry.  I don't have a handy powerpc environment around to test with.
Can you try just deleting line 433?  (this should actually be the correct fix).

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
