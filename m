From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: ia64 dies in slab code on next-20120906
Date: Thu, 6 Sep 2012 22:45:16 +0200
Message-ID: <CA+icZUVM0xMMKxdY8iWXkykKKwS=ixJ8GiUKgSpHeVXJKtuqFw@mail.gmail.com>
References: <CA+8MBbKmaaiEJ363E2PU-=6KJ4u+ZsQ1ywjb0nWMrp4xaSCeLw@mail.gmail.com>
	<000001399d36edcb-6035fc93-73cf-43df-851e-c062a48db219-000000@email.amazonses.com>
	<3908561D78D1C84285E8C5FCA982C28F1939A917@ORSMSX104.amr.corp.intel.com>
	<000001399d4a0397-2e613f0b-2648-47dc-b105-9d7c789ed651-000000@email.amazonses.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:61639 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1759636Ab2IFUpS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Sep 2012 16:45:18 -0400
Received: by lagy9 with SMTP id y9so1400594lag.19
        for <linux-next@vger.kernel.org>; Thu, 06 Sep 2012 13:45:16 -0700 (PDT)
In-Reply-To: <000001399d4a0397-2e613f0b-2648-47dc-b105-9d7c789ed651-000000@email.amazonses.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Pekka Enberg <penberg@kernel.org>

On Thu, Sep 6, 2012 at 10:33 PM, Christoph Lameter <cl@linux.com> wrote:
> On Thu, 6 Sep 2012, Luck, Tony wrote:
>
>> r9 was computed as 32 + return value from a call to allocate_slab()
>>
>> So I think we are inside the inlined "inc_slabs_node()" call on line 1357 of mm/slub.c
>
> Ok that would mean its not related to object arrangement within the page
> done by the allocator. How can a atomic_long value become misaligned?
>

Did the items in slab_err() got mixed (see below hunk from my revert-patch)?

@@ -3133,7 +3139,7 @@ static void list_slab_objects(struct kmem_cache
*s, struct page *page,
 				     sizeof(long), GFP_ATOMIC);
 	if (!map)
 		return;
-	slab_err(s, page, text, s->name);
+	slab_err(s, page, "%s", text);
 	slab_lock(page);

 	get_map(s, page, map);

- Sedat -

>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
