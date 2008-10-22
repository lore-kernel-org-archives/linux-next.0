From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for October 22
Date: Wed, 22 Oct 2008 14:28:42 -0700
Message-ID: <20081022142842.9a98d8f6.akpm@linux-foundation.org>
References: <20081022203838.f10065ec.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:38764 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751575AbYJVVaC (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Oct 2008 17:30:02 -0400
In-Reply-To: <20081022203838.f10065ec.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, Jesse Barnes <jbarnes@virtuousgeek.org>

i386 allnoconfig:

pci-dma.c:(.init.text+0x3381): undefined reference to `forbid_dac'
pci-dma.c:(.init.text+0x3387): undefined reference to `forbid_dac'
pci-dma.c:(.init.text+0x33a1): undefined reference to `forbid_dac'
pci-dma.c:(.init.text+0x33a7): undefined reference to `forbid_dac'
pci-dma.c:(.init.text+0x33e7): undefined reference to `forbid_dac'
