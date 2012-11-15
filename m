From: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH 2/2] mm: balloon_compaction.c needs asm-generic/bug.h
Date: Wed, 14 Nov 2012 17:29:33 -0800 (PST)
Message-ID: <alpine.DEB.2.00.1211141729050.4749@chino.kir.corp.google.com>
References: <20121114163042.64f0c0495663331b9c2d60d6@canb.auug.org.au> <50A43E64.3040709@infradead.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:52309 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932299Ab2KOB3f (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Nov 2012 20:29:35 -0500
Received: by mail-pa0-f46.google.com with SMTP id hz1so715532pad.19
        for <linux-next@vger.kernel.org>; Wed, 14 Nov 2012 17:29:35 -0800 (PST)
In-Reply-To: <50A43E64.3040709@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Rafael Aquini <aquini@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Wed, 14 Nov 2012, Randy Dunlap wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix build when CONFIG_BUG is not enabled by adding header file
> <asm-generic/bug.h>:
> 
> mm/balloon_compaction.c: In function 'balloon_page_putback':
> mm/balloon_compaction.c:243:3: error: implicit declaration of function '__WARN'
> 

This is fixed by 
mm-introduce-a-common-interface-for-balloon-pages-mobility-fix-fix-fix.patch 
in -mm which converts it to WARN_ON(1) which is the generic way to trigger 
a warning.
