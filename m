From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: next-20081103: arch/arm/kernel/elf.c:30: error: 'e_flags'
	undeclared
Date: Mon, 3 Nov 2008 17:28:01 +0300
Message-ID: <20081103142801.GA3918@x200.localdomain>
References: <20081103183214.aac32543.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.27]:8601 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754103AbYKCOYt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Nov 2008 09:24:49 -0500
Content-Disposition: inline
In-Reply-To: <20081103183214.aac32543.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, rmk+kernel@arm.linux.org.uk

s/e_flags/eflags/ but I'm not sure.
