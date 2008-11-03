From: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Subject: Re: linux-next: manual merge of the slab tree
Date: Mon, 3 Nov 2008 13:52:38 +0900 (JST)
Message-ID: <20081103135126.A2E3.KOSAKI.MOTOHIRO@jp.fujitsu.com>
References: <20081103151911.b18d641a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fgwmail6.fujitsu.co.jp ([192.51.44.36]:41443 "EHLO
	fgwmail6.fujitsu.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754526AbYKCExS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 2 Nov 2008 23:53:18 -0500
In-Reply-To: <20081103151911.b18d641a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: kosaki.motohiro@jp.fujitsu.com, Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, Rik van Riel <riel@redhat.com>, Lee Schermerhorn <Lee.Schermerhorn@hp.com>, Hugh Dickins <hugh@veritas.com>, Daisuke Nishimura <nishimura@mxp.nes.nec.co.jp>, Andrew Morton <akpm@linux-foundation.org>

Hi

> Today's linux-next merge of the slab tree got a conflict in mm/vmscan.c
> between commit 4f98a2fee8acdb4ac84545df98cccecfd130f8db ("vmscan: split
> LRU lists into anon & file sets") from Linus' tree and commit
> 9fb8a023ad432b0ca884790a8a05991180ab42b6 ("slub: Trigger defragmentation
> from memory reclaim") from the slab tree.
> 
> Overlapping changes.  I fixed it up (see below) and will carry the fix
> for a few days (during which time I hope it will be fixed in the slab
> tree).

looks good to me.

thanks, stephen.
