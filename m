From: "Alexander Beregalov" <a.beregalov@gmail.com>
Subject: Re: BUG: sleeping function called from invalid context at kernel/rwsem.c:131 XFS? (was: Re: linux-next: Tree for October 17)
Date: Wed, 22 Oct 2008 12:21:23 +0400
Message-ID: <a4423d670810220121k27ab3d1dp1921ea282786eebc@mail.gmail.com>
References: <a4423d670810170954h7ca130aaw8895380a4c6b125@mail.gmail.com>
	 <a4423d670810171013g5bc19c1cm3f7d9c014ee70349@mail.gmail.com>
	 <20081017203710.GA27187@infradead.org>
	 <20081017135510.7127c4e7@infradead.org>
	 <a4423d670810200758m3cea3841h40988afc8eaf81@mail.gmail.com>
	 <20081020163327.GA15651@infradead.org>
	 <a4423d670810201013w6448cb38w402771799cefb5f5@mail.gmail.com>
	 <20081020223549.GA21152@disturbed>
	 <a4423d670810210442y51b62fc2naf6cb649e6b26942@mail.gmail.com>
	 <20081022075838.GK18495@disturbed>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from an-out-0708.google.com ([209.85.132.243]:36575 "EHLO
	an-out-0708.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752108AbYJVIVY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Oct 2008 04:21:24 -0400
Received: by an-out-0708.google.com with SMTP id d40so162547and.103
        for <linux-next@vger.kernel.org>; Wed, 22 Oct 2008 01:21:23 -0700 (PDT)
In-Reply-To: <20081022075838.GK18495@disturbed>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Chinner <david@fromorbit.com>, lachlan@sgi.com, Christoph Hellwig <hch@infradead.org>, Arjan van de Ven <arjan@infradead.org>, xfs@oss.sgi.com, linux-next@vger.kernel.org

> Ah, OK, I see the problem, though I don't understand why I'm not
> seeing the might_sleep() triggering all the time given that I always
> build with:
>
> $ grep SLEEP .config
> CONFIG_DEBUG_SPINLOCK_SLEEP=y
>
> Basically the above commit moved xfs_ilock() inside
> radix_tree_preload()/radix_tree_preload_end(), which means we are
> taking a rwsem() while we have an elevated preempt count. I'll
> get a patch out to fix it.
Could it cause the I/O dead lock or should I continue trying to reproduce it?
