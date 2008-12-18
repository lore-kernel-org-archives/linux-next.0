From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: Tree for December 18 (fscache)
Date: Thu, 18 Dec 2008 17:47:56 +0000
Message-ID: <6448.1229622476@redhat.com>
References: <20081218092557.b274e9dd.randy.dunlap@oracle.com> <20081218230637.c879a046.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:46325 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751173AbYLRRsD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Dec 2008 12:48:03 -0500
In-Reply-To: <20081218092557.b274e9dd.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: dhowells@redhat.com, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Randy Dunlap <randy.dunlap@oracle.com> wrote:

> Should include/linux/buffer_head.h have an empty stub for fsync_super()
> or does fscache even make sense when CONFIG_BLOCK=n?

FS-Cache might.  CacheFiles probably doesn't.

There've been discussions about a separate caching backend to deal with
non-rotating media such as large chunks of battery-backed RAM or flash.
FS-Cache might make sense in such a situation as these could be accessed in
other ways (such as through MTD or even directly).

I'll make CONFIG_CACHEFILES dependent on CONFIG_BLOCK.

David
