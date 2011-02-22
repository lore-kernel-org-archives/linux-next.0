From: "Venkateswararao Jujjuri (JV)" <jvrao@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the v9fs tree
Date: Mon, 21 Feb 2011 21:20:31 -0800
Message-ID: <4D63479F.3060603@linux.vnet.ibm.com>
References: <20110222115340.da48b908.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e32.co.us.ibm.com ([32.97.110.150]:46968 "EHLO
	e32.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750836Ab1BVFUk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Feb 2011 00:20:40 -0500
In-Reply-To: <20110222115340.da48b908.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Eric Van Hensbergen <ericvh@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 2/21/2011 4:53 PM, Stephen Rothwell wrote:
> Hi Eric,
> 
> After merging the v9fs tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: "p9_payload_gup" [net/9p/9pnet_virtio.ko] undefined!
> ERROR: "p9_nr_pages" [net/9p/9pnet_virtio.ko] undefined!
> ERROR: "p9_release_req_pages" [net/9p/9pnet_virtio.ko] undefined!

These functions are defined by commit 249951bf66816128a7698caa826425e299494c82
([net/9p] Preparation and helper functions for zero copy)

Thanks,
JV

> 
> Caused by commit ac8c81621fe5176f1bb18730e5db2e347af08255 ("[net/9p] Add
> gup/zero_copy support to VirtIO transport layer").
> 
> I have used the v9fs tree from next-20110221 for today.
