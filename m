From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: [PATCH] SLUB: fix build when !SLUB_DEBUG
Date: Thu, 11 Jun 2009 14:40:48 +0300
Message-ID: <1244720448.17483.26.camel@penberg-laptop>
References: <1244714928-1050-1-git-send-email-a.beregalov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:50907 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759314AbZFKLkr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Jun 2009 07:40:47 -0400
In-Reply-To: <1244714928-1050-1-git-send-email-a.beregalov@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: mel@csn.ul.ie, Larry.Finger@lwfinger.net, linux-next@vger.kernel.org, cl@linux-foundation.org

On Thu, 2009-06-11 at 14:08 +0400, Alexander Beregalov wrote:
> Fix this build error when CONFIG_SLUB_DEBUG is not set:
> mm/slub.c: In function 'slab_out_of_memory':
> mm/slub.c:1551: error: 'struct kmem_cache_node' has no member named 'nr_slabs'
> mm/slub.c:1552: error: 'struct kmem_cache_node' has no member named 'total_objects'
> 
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>

I applied the patch in slightly edited form:

http://git.kernel.org/?p=linux/kernel/git/penberg/slab-2.6.git;a=commitdiff;h=353b7a490acf04989c0e3ba57165c20b8328cb12

Thanks, Alexander!

			Pekka
