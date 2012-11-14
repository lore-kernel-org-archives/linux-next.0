From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Nov 14 (gpu/drm/i915)
Date: Wed, 14 Nov 2012 11:41:49 -0800
Message-ID: <50A3F3FD.4070707@infradead.org>
References: <20121114163042.64f0c0495663331b9c2d60d6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:40790 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753017Ab2KNTme (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Nov 2012 14:42:34 -0500
In-Reply-To: <20121114163042.64f0c0495663331b9c2d60d6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@gmail.com>

On 11/13/2012 09:30 PM, Stephen Rothwell wrote:

> Hi all,
> 
> News: next-20121115 (i.e. tomorrow) will be the last release until
> next-20121126 (which should be just be after -rc7, I guess - assuming
> that Linus does not release v3.7 before then), so if you want something
> in linux-next for a reasonable amount of testing, it should probably be
> committed tomorrow.
> 
> Changes since 20121113:
> 



on i386:

ERROR: "__build_bug_on_failed" [drivers/gpu/drm/i915/i915.ko] undefined!

Reference to that symbol is found in
i915_gem_execbuffer.o.  Reference to BUILD_BUG_ON() is found in
i915_gem_execbuffer.c:

static struct eb_objects *
eb_create(int size)
{
	struct eb_objects *eb;
	int count = PAGE_SIZE / sizeof(struct hlist_head) / 2;
	BUILD_BUG_ON(!is_power_of_2(PAGE_SIZE / sizeof(struct hlist_head)));


-- 
~Randy
