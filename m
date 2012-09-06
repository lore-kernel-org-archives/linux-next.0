From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: ia64 dies in slab code on next-20120906
Date: Thu, 6 Sep 2012 23:41:00 +0000
Message-ID: <3908561D78D1C84285E8C5FCA982C28F1939ABAD@ORSMSX104.amr.corp.intel.com>
References: <CA+8MBbKmaaiEJ363E2PU-=6KJ4u+ZsQ1ywjb0nWMrp4xaSCeLw@mail.gmail.com>
 <000001399d36edcb-6035fc93-73cf-43df-851e-c062a48db219-000000@email.amazonses.com>
 <3908561D78D1C84285E8C5FCA982C28F1939A917@ORSMSX104.amr.corp.intel.com>
 <000001399d4a0397-2e613f0b-2648-47dc-b105-9d7c789ed651-000000@email.amazonses.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:7626 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755454Ab2IFXlD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Sep 2012 19:41:03 -0400
In-Reply-To: <000001399d4a0397-2e613f0b-2648-47dc-b105-9d7c789ed651-000000@email.amazonses.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Pekka Enberg <penberg@kernel.org>

> Ok that would mean its not related to object arrangement within the page
> done by the allocator. How can a atomic_long value become misaligned?

It isn't just misaligned ... it is completely trashed. 0xca2ffc55fb373e95 isn't
any kind of valid address on ia64. I'm I little surprised that we didn't machine
check as we will have interpreted it as an uncacheable access to a non-existent
physical address.

-Tony
