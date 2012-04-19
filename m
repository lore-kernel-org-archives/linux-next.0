From: Dan Magenheimer <dan.magenheimer@oracle.com>
Subject: RE: linux-next: Tree for Apr 19 (zcache)
Date: Thu, 19 Apr 2012 15:36:29 -0700 (PDT)
Message-ID: <0b74f96b-8450-4dfb-8798-36edd0e06a64@default>
References: <20120419164643.d9f918d44c890722b7707508@canb.auug.org.au>
 <4F909200.6070104@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet15.oracle.com ([148.87.113.117]:18797 "EHLO
	rcsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753957Ab2DSWgm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Apr 2012 18:36:42 -0400
In-Reply-To: <4F909200.6070104@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Seth Jennings <sjenning@linux.vnet.ibm.com>, Nitin Gupta <nitingupta910@gmail.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Konrad Wilk <konrad.wilk@oracle.com>

> From: Randy Dunlap [mailto:rdunlap@xenotime.net]
> Sent: Thursday, April 19, 2012 4:30 PM
> To: Stephen Rothwell
> Cc: linux-next@vger.kernel.org; LKML; Dan Magenheimer
> Subject: Re: linux-next: Tree for Apr 19 (zcache)
> 
> On 04/18/2012 11:46 PM, Stephen Rothwell wrote:
> 
> > Hi all,
> >
> > Changes since 20120418:
> 
> 
> on x86_64:
> 
> drivers/built-in.o: In function `zv_free':
> zcache-main.c:(.text+0x5e1c9): undefined reference to `zs_map_object'
> zcache-main.c:(.text+0x5e238): undefined reference to `zs_unmap_object'
> zcache-main.c:(.text+0x5e29a): undefined reference to `zs_free'
> drivers/built-in.o: In function `zv_create':
> zcache-main.c:(.text+0x5e6b3): undefined reference to `zs_malloc'
> zcache-main.c:(.text+0x5e6f0): undefined reference to `zs_map_object'
> zcache-main.c:(.text+0x5e72c): undefined reference to `zs_unmap_object'
> drivers/built-in.o: In function `zcache_comp_init':
> zcache-main.c:(.text+0x5e831): undefined reference to `crypto_has_alg'
> zcache-main.c:(.text+0x5e8a5): undefined reference to `crypto_has_alg'
> drivers/built-in.o: In function `zcache_cpu_notifier':
> zcache-main.c:(.text+0x5e94f): undefined reference to `crypto_alloc_base'
> zcache-main.c:(.text+0x5e9f2): undefined reference to `crypto_destroy_tfm'
> drivers/built-in.o: In function `zv_decompress':
> zcache-main.c:(.text+0x5ee40): undefined reference to `zs_map_object'
> zcache-main.c:(.text+0x5ef06): undefined reference to `zs_unmap_object'
> drivers/built-in.o: In function `zcache_pampd_create':
> zcache-main.c:(.text+0x5f614): undefined reference to `zs_get_total_size_bytes'
> make[1]: *** [.tmp_vmlinux1] Error 1
> 
> Full randconfig file is attached.

This looks like issues with the zsmalloc code (http://lwn.net/Articles/474880/)
so forwarding to Seth/Nitin (cc Konrad).
