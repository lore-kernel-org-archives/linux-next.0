From: Jack Steiner <steiner@sgi.com>
Subject: Re: linux-next: Tree for July 31 (GRU build error)
Date: Fri, 1 Aug 2008 08:16:36 -0500
Message-ID: <20080801131636.GA4023@sgi.com>
References: <20080731175854.09ea35c8.sfr@canb.auug.org.au> <20080731223758.b5985dd7.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from netops-testserver-3-out.sgi.com ([192.48.171.28]:40801 "EHLO
	relay.sgi.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751442AbYHANQl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Aug 2008 09:16:41 -0400
Content-Disposition: inline
In-Reply-To: <20080731223758.b5985dd7.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, Jul 31, 2008 at 10:37:58PM -0700, Randy Dunlap wrote:
> 
> xp_uv.c:(.text+0x4186b): undefined reference to `gru_copy_gpa'
> xpc_uv.c:(.text+0x44616): undefined reference to `gru_create_message_queue'
> xpc_uv.c:(.text+0x44e16): undefined reference to `gru_free_message'
> xpc_uv.c:(.text+0x44e22): undefined reference to `gru_get_next_message'
> xpc_uv.c:(.text+0x44e67): undefined reference to `gru_send_message_gpa'
> xpc_uv.c:(.text+0x45a79): undefined reference to `gru_free_message'
> xpc_uv.c:(.text+0x45a85): undefined reference to `gru_get_next_message'
> make[1]: *** [.tmp_vmlinux1] Error 1

This is not actually a GRU problem. XP is missing a dependency. Dean will
post a patch later today.


> 
> 
> config attached.
> 
> 
> and please add a GRU maintainer entry somewhere.
 
Done. Also added maintainer for XP...

--- jack
