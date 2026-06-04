Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938BB36F91E
	for <linux-next@vger.kernel.org>; Thu,  4 Jun 2026 04:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780546485; cv=none; b=sW+DiqRET3NtlxNcfe8uNf3+IkeYBPOWz9MzX/Rn+6ALyWOdjvx3j8Fev37lEiGAUyAMoQhW4DnJfYb72ex2Es2MP5907GQj8JD5rN6y6SpF8CkUfNRHTIylh+W9VXUd+zFOafKMCrnP2gP/ItkgdaqNVtbD9I3uoVX/Md315go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780546485; c=relaxed/simple;
	bh=cMI7tObmp/O9oWNmsNMV5YqxwqsEM8ca/TCt2rCNqqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmMXVaetU3CAZZjcabwmzBFQMNUPmSVPpT35j2HbNgpuWJL96nFCj20YJOn7U2JQDt08CkC0Fon2CcDjXbLfnIsGsREdqyw6KKgcfCYb4u3ZnVPi9ZRvdU6ta9eGZq54mNsdyVGQLOHIsX4UZ1pU6agqsratZnb2EQF68XvqQGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eXBof5wv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=H3xG6TIb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eXBof5wv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="H3xG6TIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780546482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AWytyULl7iE6NmIMXNglghTQUX52gHdAhp4TQhKDY+Y=;
	b=eXBof5wvrA0qu04fD+/G2ZjndrYdhjPKOPr6wimppmamyAEkKCIsmbF48g5JMEPiUF4JWi
	ZeE9cc5eCldGjGeXjeuSTMumiu4Q0PxL0EG6rU62DF3qUWt5b4GJ5OXJDP5kfnGsAQpuZq
	+ow+F4y5vUMozVqWAR5aBxGxqL2KKr8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-g3uw1H4uOm2njkfjrPkJXQ-1; Thu, 04 Jun 2026 00:14:41 -0400
X-MC-Unique: g3uw1H4uOm2njkfjrPkJXQ-1
X-Mimecast-MFC-AGG-ID: g3uw1H4uOm2njkfjrPkJXQ_1780546480
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-45eebc943bfso654009f8f.0
        for <linux-next@vger.kernel.org>; Wed, 03 Jun 2026 21:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780546480; x=1781151280; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AWytyULl7iE6NmIMXNglghTQUX52gHdAhp4TQhKDY+Y=;
        b=H3xG6TIb20YGOJXP3J9FqFFCht6n+238NofzS7KaNZm3gURy0Ms0x9lLsa1XIRWZ3t
         sTrXfclpucfeALHhTpMHLLhByJyPYkh6j4Xuh1Qf1Jam1fhDmWDwZ5QEcT3HGFBEOM4f
         BN4xPhVH0y6Bo2pPIow9ITsoYASRnjL2ePjygKsUJ/Htq2m1Nzx26cuWJATpMH4cEVKr
         ySTVkFJOWKd+ecisZ18O7XxRXocANm5VEAvUT0l+SRi3Qcl/EFRWMV6+2/IgmQRgT8tI
         dSo4RqNmezPCEGyPFp197+gWOG8KB+8MK2o2/Su6T67axo//RyWVwHHcrgB2ST76CMEz
         LUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780546480; x=1781151280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWytyULl7iE6NmIMXNglghTQUX52gHdAhp4TQhKDY+Y=;
        b=WrEAx00GsIhASqT5nt22pkZj0dqX8OJ65Q7kchie0aPRQ9Bmy6rnLqXTItFkLtDtnY
         doqeWxuK/w06w7aNKppLo1LLD8fTlDERPu+HApF9xmz59T92ovNXf7BqC6Wkreps4SY/
         w6r5wVJZvQdHdsEe7gNBOv7DyUm4FwplTuhOd36y5+ErY5l7lERla6/RoJ0Lo6In4NQu
         G8NxbTjIEIP/dxArzxpoJDWIXKgAMymvJT1khn/Pb4Yhk+G3YfW3tu3eYK1v4z4D6p1m
         mRTpsGmSPnU5/A2UwpHQ2kOGMGghPHYhFO7mTmIGUO1l06hqoJrQ5RLplJYXFnjKJ7J+
         Ardg==
X-Forwarded-Encrypted: i=1; AFNElJ88wwyg7EIbVu/2A/TRYVqFZvXaTQ01pavAuF6D2fCssm1iWyZtK8Af8sF3679/9epFm9IpnnMrwuZS@vger.kernel.org
X-Gm-Message-State: AOJu0YzxlHXnZlCx/szaNI+0HVWtAdFc8OIL0YIiyyr9OXZgz6TA0pbl
	DK1jobdn5r36JWJlo8r+5W+KpfsuIbWUCLQFE9BdHw5N78Uh1cqDnxuVPVYrh9iIsq5YJc15QpS
	1++rb2m8txIH/AC88ifmApEdhBcwlIUkmDrwe6PS1WQroJBOzRadifDRb4o9GfWc=
X-Gm-Gg: Acq92OHS3ZR5o9KuvTgxn+Ej5vhSG9C9GnD0hriadjAZ3hNKOvYh/Y+UwaWVJHh1PzM
	q+63uIfsnHftk4PYYI3Bg1Um1sjCzpUMEL44r57dIxS4Og/WqLjqNr7eMTKMT7XKNbaAz5oSQja
	bCrnHjZqC0ghsLEilu2Xz7zcjjhabgCGiyn0VjwWS6hxCaN5z0ctr5tShV4xUw2YEFq1boLDO/Y
	TYZXc/+FZMxCooUN2iEQCOmiTBc63v8566hJSXwVT/HGKz+062T0mY806hLFTTnfgsvB9ykT+wx
	7299VWTz6KLuR+5Krw2XVroUwUuTUuS6itmYAo1R07CaK7EEJIyJiOu4GQUAFLI1+1N1WBwZLhZ
	hWOEzh937ZSBrLvSkjPMUQhmX/6csX12A8uMbS3RP78R3QFuO5H/Ojw==
X-Received: by 2002:a05:600c:6095:b0:490:bb60:68ca with SMTP id 5b1f17b1804b1-490bc4b54b4mr24735725e9.3.1780546480155;
        Wed, 03 Jun 2026 21:14:40 -0700 (PDT)
X-Received: by 2002:a05:600c:6095:b0:490:bb60:68ca with SMTP id 5b1f17b1804b1-490bc4b54b4mr24735325e9.3.1780546479626;
        Wed, 03 Jun 2026 21:14:39 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-25-45.inter.net.il. [80.230.25.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc23394asm39489705e9.0.2026.06.03.21.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 21:14:39 -0700 (PDT)
Date: Thu, 4 Jun 2026 00:14:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: syzbot <syzbot+8ffca916f3fa5455f9b4@syzkaller.appspotmail.com>,
	apopple@nvidia.com, byungchul@sk.com, david@kernel.org,
	gourry@gourry.net, joshua.hahnjy@gmail.com,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-next@vger.kernel.org, matthew.brost@intel.com,
	rakie.kim@sk.com, sfr@canb.auug.org.au,
	syzkaller-bugs@googlegroups.com, ying.huang@linux.alibaba.com,
	ziy@nvidia.com
Subject: Re: [syzbot] [mm?] linux-next test error: kernel BUG in
 post_alloc_hook
Message-ID: <20260604001334-mutt-send-email-mst@kernel.org>
References: <6a20a309.85ccb786.283107.0005.GAE@google.com>
 <20260603154737.48dfcc19a51da03241e1af48@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603154737.48dfcc19a51da03241e1af48@linux-foundation.org>

On Wed, Jun 03, 2026 at 03:47:37PM -0700, Andrew Morton wrote:
> (cc Mike Tsirkin)
> 
> On Wed, 03 Jun 2026 14:56:25 -0700 syzbot <syzbot+8ffca916f3fa5455f9b4@syzkaller.appspotmail.com> wrote:
> 
> > Hello,
> > 
> > syzbot found the following issue on:
> > 
> > HEAD commit:    a225caacc365 Add linux-next specific files for 20260603
> > git tree:       linux-next
> > console output: https://syzkaller.appspot.com/x/log.txt?x=13b0de66580000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=717edf2a5f9fc390
> > dashboard link: https://syzkaller.appspot.com/bug?extid=8ffca916f3fa5455f9b4
> > compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
> > 
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/f799d07ea17d/disk-a225caac.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/72d0f0ff94e6/vmlinux-a225caac.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/99d4279e6fec/bzImage-a225caac.xz
> > 
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+8ffca916f3fa5455f9b4@syzkaller.appspotmail.com
> > 
> > ...
> >
> > **********************************************************
> > **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
> > **                                                      **
> > ** This system shows unhashed kernel memory addresses   **
> > ** via the console, logs, and other interfaces. This    **
> > ** might reduce the security of your system.            **
> > **                                                      **
> > ** If you see this message and you are not debugging    **
> > ** the kernel, report this immediately to your system   **
> > ** administrator!                                       **
> > **                                                      **
> > ** Use hash_pointers=always to force this mode off      **
> > **                                                      **
> > **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
> > **********************************************************
> 
> Geeze, who added that.
> 
> > page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x13fe38
> > head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> > flags: 0x100000000000040(head|node=0|zone=2)
> > raw: 0100000000000040 dead000000000100 dead000000000122 0000000000000000
> > raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
> > head: 0100000000000040 dead000000000100 dead000000000122 0000000000000000
> > head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
> > head: 0100000000000002 ffffffffffffff01 00000000ffffffff 00000000ffffffff
> > head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000004
> > page dumped because: VM_BUG_ON_PAGE(1 && PageCompound(page))
> > ------------[ cut here ]------------
> > kernel BUG at ./include/linux/page-flags.h:682!
> > Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
> > CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted syzkaller #0 PREEMPT_{RT,(undef)} 
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/09/2026
> > RIP: 0010:__ClearPagePrezeroed include/linux/page-flags.h:682 [inline]
> > RIP: 0010:post_alloc_hook+0x287/0x310 mm/page_alloc.c:1863
> 
> That's the __ClearPagePrezeroed(page) added by 504f40f6bda6 ("mm:
> page_reporting: skip redundant zeroing of host-zeroed reported pages").
> 
> Was it intended that this series
> (https://lore.kernel.org/cover.1779315441.git.mst@redhat.com) be
> included in -next?  It's huge, it's late, review is minor.

Of course not (
I've no idea how that happened.
Should not push to next late at night.


> <remainder of report is below>
> 
> > Code: ff ff 89 da be 01 00 00 00 48 c7 c7 40 50 4f 8e e8 ce 4b d4 02 e9 c5 fe ff ff 4c 89 ef 48 c7 c6 40 ef 7a 8b e8 2a c6 05 ff 90 <0f> 0b 31 ed f7 44 24 04 00 01 00 00 0f 84 8e fd ff ff e9 86 fd ff
> > RSP: 0000:ffffffff8e0078e0 EFLAGS: 00010046
> > RAX: 0000000000000000 RBX: 0000000000000002 RCX: ffffffff8e0fef40
> > RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> > RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000000
> > R10: dffffc0000000000 R11: ffffed10170c4903 R12: dffffc0000000000
> > R13: ffffea0004ff8e00 R14: 1ffffd40009ff1c0 R15: 0000000000000000
> > FS:  0000000000000000(0000) GS:ffff888125a79000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: ffff88823ffff000 CR3: 000000000e1b8000 CR4: 00000000000100b0
> > Call Trace:
> >  <TASK>
> >  prep_new_page mm/page_alloc.c:1925 [inline]
> >  get_page_from_freelist+0x3081/0x3320 mm/page_alloc.c:4015
> >  __alloc_frozen_pages_noprof+0x194/0x380 mm/page_alloc.c:5376
> >  __alloc_pages_mpol+0xe0/0x390 mm/mempolicy.c:2495
> >  alloc_slab_page mm/slub.c:3287 [inline]
> >  allocate_slab+0x83/0x5e0 mm/slub.c:3404
> >  new_slab mm/slub.c:3447 [inline]
> >  ___slab_alloc+0x160/0x930 mm/slub.c:4485
> >  __slab_alloc_node mm/slub.c:4549 [inline]
> >  slab_alloc_node mm/slub.c:4925 [inline]
> >  __do_kmalloc_node mm/slub.c:5331 [inline]
> >  __kmalloc_noprof+0x140/0x7b0 mm/slub.c:5345
> >  _kmalloc_noprof include/linux/slab.h:973 [inline]
> >  _kzalloc_noprof include/linux/slab.h:1286 [inline]
> >  __alloc_empty_sheaf mm/slub.c:2774 [inline]
> >  alloc_empty_sheaf mm/slub.c:2794 [inline]
> >  init_percpu_sheaves mm/slub.c:7555 [inline]
> >  do_kmem_cache_create+0x8ae/0x9a0 mm/slub.c:8595
> >  create_boot_cache+0xbf/0x120 mm/slab_common.c:717
> >  create_kmalloc_cache+0x41/0xb0 mm/slab_common.c:735
> >  new_kmalloc_cache+0xd4/0x180 mm/slab_common.c:982
> >  create_kmalloc_caches+0x14/0x50 mm/slab_common.c:1005
> >  kmem_cache_init+0x14a/0x1e0 mm/slub.c:8496
> >  mm_core_init+0x7e/0xb0 mm/mm_init.c:2728
> >  start_kernel+0x162/0x3e0 init/main.c:1034
> >  x86_64_start_reservations+0x24/0x30 arch/x86/kernel/head64.c:310
> >  x86_64_start_kernel+0x143/0x1c0 arch/x86/kernel/head64.c:291
> >  common_startup_64+0x13e/0x157
> >  </TASK>
> > Modules linked in:
> > ---[ end trace 0000000000000000 ]---
> > RIP: 0010:__ClearPagePrezeroed include/linux/page-flags.h:682 [inline]
> > RIP: 0010:post_alloc_hook+0x287/0x310 mm/page_alloc.c:1863
> > Code: ff ff 89 da be 01 00 00 00 48 c7 c7 40 50 4f 8e e8 ce 4b d4 02 e9 c5 fe ff ff 4c 89 ef 48 c7 c6 40 ef 7a 8b e8 2a c6 05 ff 90 <0f> 0b 31 ed f7 44 24 04 00 01 00 00 0f 84 8e fd ff ff e9 86 fd ff
> > RSP: 0000:ffffffff8e0078e0 EFLAGS: 00010046
> > RAX: 0000000000000000 RBX: 0000000000000002 RCX: ffffffff8e0fef40
> > RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> > RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000000
> > R10: dffffc0000000000 R11: ffffed10170c4903 R12: dffffc0000000000
> > R13: ffffea0004ff8e00 R14: 1ffffd40009ff1c0 R15: 0000000000000000
> > FS:  0000000000000000(0000) GS:ffff888125a79000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: ffff88823ffff000 CR3: 000000000e1b8000 CR4: 00000000000100b0
> > 
> > 
> > ---
> > This report is generated by a bot. It may contain errors.
> > See https://goo.gl/tpsmEJ for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
> > 
> > syzbot will keep track of this issue. See:
> > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> > 
> > If the report is already addressed, let syzbot know by replying with:
> > #syz fix: exact-commit-title
> > 
> > If you want to overwrite report's subsystems, reply with:
> > #syz set subsystems: new-subsystem
> > (See the list of subsystem names on the web dashboard)
> > 
> > If the report is a duplicate of another one, reply with:
> > #syz dup: exact-subject-of-another-report
> > 
> > If you want to undo deduplication, reply with:
> > #syz undup

