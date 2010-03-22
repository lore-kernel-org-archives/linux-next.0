From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: linux-next: build failure after merge of the nfs tree
Date: Mon, 22 Mar 2010 05:49:40 -0400
Message-ID: <351E30A8-F8E2-4DD8-8AB1-52D1D397785D@fys.uio.no>
References: <20100322112655.0f23c1fb.sfr@canb.auug.org.au>
Mime-Version: 1.0 (iPhone Mail 7E18)
Content-Type: text/plain;
	charset=us-ascii;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out2.uio.no ([129.240.10.58]:34888 "EHLO mail-out2.uio.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754461Ab0CVJt5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Mar 2010 05:49:57 -0400
In-Reply-To: <20100322112655.0f23c1fb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mar 21, 2010, at 20:26, Stephen Rothwell <sfr@canb.auug.org.au>  
wrote:

> Hi Trond,
>
> After merging the nfs tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> net/sunrpc/xprt.c: In function 'xprt_release':
> net/sunrpc/xprt.c:1045: error: implicit declaration of function  
> 'xprt_free_bc_request'
>
> Caused by commit 0d28e05a53109bb52f254d5eac25dac6e3768b04 ("SUNRPC:  
> Fix a
> use after free bug with the NFSv4.1 backchannel").   
> xprt_free_bc_request()
> is only declared for CONFIG_NFS_V4_1 ...
>
> I have used the nfs tree from next-20100319 for today.

Hi Stephen

Sorry about that. I've got a fix for the above (just need to define  
empty inline function for the !CONFIG_NFS_V4_1 case).

I'll try to upload it later today. (I am unfortunately travelling so  
wifi access is a bit spotty).

Cheers
     Trond
