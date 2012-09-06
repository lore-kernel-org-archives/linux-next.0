From: Christoph Lameter <cl@linux.com>
Subject: Re: ia64 dies in slab code on next-20120906
Date: Thu, 6 Sep 2012 20:13:06 +0000
Message-ID: <000001399d36edcb-6035fc93-73cf-43df-851e-c062a48db219-000000@email.amazonses.com>
References: <CA+8MBbKmaaiEJ363E2PU-=6KJ4u+ZsQ1ywjb0nWMrp4xaSCeLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from a194-183.smtp-out.amazonses.com ([199.255.194.183]:27902 "EHLO
	a194-183.smtp-out.amazonses.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1759791Ab2IFUNI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Sep 2012 16:13:08 -0400
In-Reply-To: <CA+8MBbKmaaiEJ363E2PU-=6KJ4u+ZsQ1ywjb0nWMrp4xaSCeLw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tony Luck <tony.luck@intel.com>
Cc: linux-next@vger.kernel.org, Pekka Enberg <penberg@kernel.org>

On Thu, 6 Sep 2012, Tony Luck wrote:

> kernel unaligned access to 0xca2ffc55fb373e95, ip=0xa0000001001be550

Huh? Is there any additional info available? Backtrace?

> ip is at new_slab+0x90/0x680

Any way to relate that to a line in the code?
