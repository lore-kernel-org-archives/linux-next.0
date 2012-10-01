From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Sept 24 (remoteproc)
Date: Mon, 01 Oct 2012 16:16:09 -0700
Message-ID: <506A2439.2050408@xenotime.net>
References: <20120925005328.f748dfa3d077cebb345a4291@canb.auug.org.au> <5060DA6B.3030806@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy11-pub.bluehost.com ([173.254.64.10]:38174 "HELO
	oproxy11-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1758232Ab2JAXQT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Oct 2012 19:16:19 -0400
In-Reply-To: <5060DA6B.3030806@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ohad Ben-Cohen <ohad@wizery.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 09/24/2012 03:10 PM, Randy Dunlap wrote:

> On 09/24/2012 07:53 AM, Stephen Rothwell wrote:
> 
>> Hi all,
>>
>> Today was a train wreck, with lots of new conflicts across several trees
>> and a few build failures as well.
>>
>> Changes since 201209021:
>>
> 


This build still fails on linux-next of 20121001 when
VIRTIO is not enabled.

> 
> on x86_64:
> 
> drivers/built-in.o: In function `rproc_virtio_finalize_features':
> remoteproc_virtio.c:(.text+0x2f9a02): undefined reference to `vring_transport_features'
> drivers/built-in.o: In function `rproc_virtio_del_vqs':
> remoteproc_virtio.c:(.text+0x2f9a74): undefined reference to `vring_del_virtqueue'
> drivers/built-in.o: In function `rproc_virtio_find_vqs':
> remoteproc_virtio.c:(.text+0x2f9c44): undefined reference to `vring_new_virtqueue'
> drivers/built-in.o: In function `rproc_add_virtio_dev':
> (.text+0x2f9e2c): undefined reference to `register_virtio_device'
> drivers/built-in.o: In function `rproc_vq_interrupt':
> (.text+0x2f9db7): undefined reference to `vring_interrupt'
> drivers/built-in.o: In function `rproc_remove_virtio_dev':
> (.text+0x2f9e9f): undefined reference to `unregister_virtio_device'
> 
> 
> Full randconfig file is attached.
> 
> 
> 



-- 
~Randy
