From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: ia64 dies in slab code on next-20120906
Date: Thu, 6 Sep 2012 20:26:49 +0000
Message-ID: <3908561D78D1C84285E8C5FCA982C28F1939A917@ORSMSX104.amr.corp.intel.com>
References: <CA+8MBbKmaaiEJ363E2PU-=6KJ4u+ZsQ1ywjb0nWMrp4xaSCeLw@mail.gmail.com>
 <000001399d36edcb-6035fc93-73cf-43df-851e-c062a48db219-000000@email.amazonses.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:25253 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932179Ab2IFU0w convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Sep 2012 16:26:52 -0400
In-Reply-To: <000001399d36edcb-6035fc93-73cf-43df-851e-c062a48db219-000000@email.amazonses.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Pekka Enberg <penberg@kernel.org>

> Huh? Is there any additional info available? Backtrace?

Sorry - that's all that I got on the console.

>> ip is at new_slab+0x90/0x680

> Any way to relate that to a line in the code?

The instruction there is a "fetchadd8.rel r14=[r9],1", so we are doing an atomic add.

r9 was computed as 32 + return value from a call to allocate_slab()

So I think we are inside the inlined "inc_slabs_node()" call on line 1357 of mm/slub.c


-Tony
