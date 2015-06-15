From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jun 15 (amdgpu)
Date: Mon, 15 Jun 2015 09:10:47 -0700
Message-ID: <557EF907.3010100@infradead.org>
References: <1434359128.19706.9.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:49033 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932138AbbFOQKs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Jun 2015 12:10:48 -0400
In-Reply-To: <1434359128.19706.9.camel@ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, linux-next <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>

On 06/15/15 02:05, Michael Ellerman wrote:
> Hi all,
> 
> Changes since 20150612:
> 

on x86_64:

when CONFIG_DEBUG_FS is not enabled:

drivers/built-in.o: In function `amdgpu_device_init':
(.text+0x1dbd88): undefined reference to `amdgpu_debugfs_regs_init'
drivers/built-in.o: In function `amdgpu_device_fini':
(.text+0x1dc5c3): undefined reference to `amdgpu_debugfs_regs_cleanup'




-- 
~Randy
