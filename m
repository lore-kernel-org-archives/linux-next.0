From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: linux-next: build failure after merge of the final tree (nfs
 tree related)
Date: Wed, 04 Aug 2010 08:58:56 -0400
Message-ID: <1280926736.3011.24.camel@heimdal.trondhjem.org>
References: <20100804145406.f0fc5ea4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out1.uio.no ([129.240.10.57]:35483 "EHLO mail-out1.uio.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932455Ab0HDM7L (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Aug 2010 08:59:11 -0400
In-Reply-To: <20100804145406.f0fc5ea4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2010-08-04 at 14:54 +1000, Stephen Rothwell wrote:
> Hi Trond,
> 
> After merging the final tree, today's linux-next build (sparc
> defconfig) failed like this:
> 
> `rpc_destroy_authunix' referenced in section `.init.text' of net/built-in.o: defined in discarded section `.exit.text' of net/built-in.o
> 
> Caused by commit 4c09a3aef02ef9bfab8322fadde269290563ede2 ("NFS: Ensure
> the AUTH_UNIX credcache is allocated dynamically").
> 
> It also caused these warnings:
> 
> WARNING: vmlinux.o(.init.text+0x1e3b4): Section mismatch in reference from the f
> unction rpcauth_init_module() to the function .exit.text:rpc_destroy_authunix()
> The function __init rpcauth_init_module() references
> a function __exit rpc_destroy_authunix().
> This is often seen when error handling in the init function
> uses functionality in the exit path.
> The fix is often to remove the __exit annotation of
> rpc_destroy_authunix() so it may be used outside an exit section.
> 
> I applied the following patch for today:

Hi Stephen,

Thanks! I've fixed this up in the NFS linux-next tree.

Cheers
  Trond
