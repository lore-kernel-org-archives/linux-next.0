From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Dec 22 (mm/memcontrol)
Date: Tue, 22 Dec 2015 10:15:37 -0800
Message-ID: <56799349.9090300@infradead.org>
References: <20151222162955.3f366781@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:34622 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932093AbbLVSPj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Dec 2015 13:15:39 -0500
In-Reply-To: <20151222162955.3f366781@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>

On 12/21/15 21:29, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20151221:
> 

on i386 or x86_64:

when CONFIG_SLOB=y:

../mm/memcontrol.c: In function 'memcg_update_kmem_limit':
../mm/memcontrol.c:2974:3: error: implicit declaration of function 'memcg_online_kmem' [-Werror=implicit-function-declaration]
   ret = memcg_online_kmem(memcg);
   ^
../mm/memcontrol.c: In function 'mem_cgroup_css_alloc':
../mm/memcontrol.c:4229:2: error: too many arguments to function 'memcg_propagate_kmem'
  error = memcg_propagate_kmem(parent, memcg);
  ^
../mm/memcontrol.c:2949:12: note: declared here
 static int memcg_propagate_kmem(struct mem_cgroup *memcg)
            ^



-- 
~Randy
