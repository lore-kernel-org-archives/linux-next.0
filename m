From: Christoph Lameter <cl@linux.com>
Subject: RE: ia64 dies in slab code on next-20120906
Date: Thu, 6 Sep 2012 20:33:57 +0000
Message-ID: <000001399d4a0397-2e613f0b-2648-47dc-b105-9d7c789ed651-000000@email.amazonses.com>
References: <CA+8MBbKmaaiEJ363E2PU-=6KJ4u+ZsQ1ywjb0nWMrp4xaSCeLw@mail.gmail.com> <000001399d36edcb-6035fc93-73cf-43df-851e-c062a48db219-000000@email.amazonses.com> <3908561D78D1C84285E8C5FCA982C28F1939A917@ORSMSX104.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from a194-183.smtp-out.amazonses.com ([199.255.194.183]:41437 "EHLO
	a194-183.smtp-out.amazonses.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1759736Ab2IFUd6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Sep 2012 16:33:58 -0400
In-Reply-To: <3908561D78D1C84285E8C5FCA982C28F1939A917@ORSMSX104.amr.corp.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Pekka Enberg <penberg@kernel.org>

On Thu, 6 Sep 2012, Luck, Tony wrote:

> r9 was computed as 32 + return value from a call to allocate_slab()
>
> So I think we are inside the inlined "inc_slabs_node()" call on line 1357 of mm/slub.c

Ok that would mean its not related to object arrangement within the page
done by the allocator. How can a atomic_long value become misaligned?
