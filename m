From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: Tree for January 8 (multimedia/cx88)
Date: Thu, 8 Jan 2009 18:14:32 -0200
Message-ID: <20090108181432.3ab1ea9d@pedra.chehab.org>
References: <20090108171730.19a41e14.sfr@canb.auug.org.au>
	<49663B74.6010707@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:35021 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762640AbZAHUPF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Jan 2009 15:15:05 -0500
In-Reply-To: <49663B74.6010707@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org

On Thu, 08 Jan 2009 09:44:20 -0800
Randy Dunlap <randy.dunlap@oracle.com> wrote:

> 
> linux-next-20090108/drivers/media/video/cx88/cx88-i2c.c: In function 'cx88_call_i2c_clients':
> linux-next-20090108/drivers/media/video/cx88/cx88-i2c.c:122: error: 'struct cx88_core' has no member named 'gate_ctrl'
> linux-next-20090108/drivers/media/video/cx88/cx88-i2c.c:123: error: 'struct cx88_core' has no member named 'gate_ctrl'
> linux-next-20090108/drivers/media/video/cx88/cx88-i2c.c:127: error: 'struct cx88_core' has no member named 'gate_ctrl'
> linux-next-20090108/drivers/media/video/cx88/cx88-i2c.c:128: error: 'struct cx88_core' has no member named 'gate_ctrl'

Grrr... a small trivial bug... Anyway, trival to fix also.

Cheers,
Mauro
