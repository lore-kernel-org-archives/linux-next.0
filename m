From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: next-20090611: SLUB: Unable to allocate memory on node -1
Date: Thu, 11 Jun 2009 16:12:41 +0300
Message-ID: <84144f020906110612t3102efdev39e77b6429013176@mail.gmail.com>
References: <a4423d670906110603s42bf0287p848b00c2cc786cc1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f213.google.com ([209.85.220.213]:36403 "EHLO
	mail-fx0-f213.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751061AbZFKNMk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Jun 2009 09:12:40 -0400
In-Reply-To: <a4423d670906110603s42bf0287p848b00c2cc786cc1@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Jun 11, 2009 at 4:03 PM, Alexander
Beregalov<a.beregalov@gmail.com> wrote:
> Hi

There should be a stack trace here printed out by the page allocator.
Can you post that too?

> SLUB: Unable to allocate memory on node -1 (gfp=3D11200)
> =A0cache: kmalloc-2048, object size: 2048, buffer size: 2048, default
> order: 3, min order: 0
> =A0node 0: slabs: 407, objs: 1724, free: 0
> SLUB: Unable to allocate memory on node -1 (gfp=3D11200)
> =A0cache: kmalloc-2048, object size: 2048, buffer size: 2048, default
> order: 3, min order: 0
> =A0node 0: slabs: 407, objs: 1724, free: 0
>
> It is 4-way (2*2) SMP with 2Gb RAM
