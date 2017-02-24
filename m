From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Feb 24 (nfs/blocklayout)
Date: Fri, 24 Feb 2017 10:14:02 -0800
Message-ID: <3df46d20-3b1c-98ee-8466-021b8ae44919@infradead.org>
References: <20170224140153.41e07762@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:59218 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750995AbdBXSOK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Feb 2017 13:14:10 -0500
In-Reply-To: <20170224140153.41e07762@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, Trond Myklebust <trond.myklebust@primarydata.com>, Anna Schumaker <anna.schumaker@netapp.com>

On 02/23/17 19:01, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any material intended for v4.12 to your linux-next
> included branches until after v4.11-rc1 has been released.
> 
> Changes since 20170223:
> 

on i386, when CONFIG_LBDAF is not enabled:

../fs/nfs/blocklayout/blocklayout.c:227:9: warning: large integer implicitly truncated to unsigned type [-Woverflow]
../fs/nfs/blocklayout/blocklayout.c:284:4: warning: large integer implicitly truncated to unsigned type [-Woverflow]
../fs/nfs/blocklayout/blocklayout.c:371:9: warning: large integer implicitly truncated to unsigned type [-Woverflow]
../fs/nfs/blocklayout/blocklayout.c:446:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
../fs/nfs/blocklayout/blocklayout.c:724:3: warning: large integer implicitly truncated to unsigned type [-Woverflow]



-- 
~Randy
