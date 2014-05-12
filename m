From: Fabio Estevam <festevam@gmail.com>
Subject: Re: randconfig build error with next-20140512, in mm/slub.c
Date: Mon, 12 May 2014 18:51:23 -0300
Message-ID: <CAOMZO5CUxrYk2WAHcwSmaHt55qkadopkdpJo+pq28m0XwUz4Vg@mail.gmail.com>
References: <CA+r1Zhg4JzViQt=J0XBu4dRwFUZGwi52QLefkzwcwn4NUfk8Sw@mail.gmail.com>
	<alpine.DEB.2.10.1405121346370.30318@gentwo.org>
	<537118C6.7050203@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vc0-f182.google.com ([209.85.220.182]:46121 "EHLO
	mail-vc0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758300AbaELVvY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 12 May 2014 17:51:24 -0400
In-Reply-To: <537118C6.7050203@iki.fi>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@iki.fi>
Cc: Christoph Lameter <cl@linux.com>, Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, penberg@kernel.org, Matt Mackall <mpm@selenic.com>, linux-mm@kvack.org

On Mon, May 12, 2014 at 3:53 PM, Pekka Enberg <penberg@iki.fi> wrote:
> On 05/12/2014 09:47 PM, Christoph Lameter wrote:
>>
>> A patch was posted today for this issue.
>
>
> AFAICT, it's coming from -mm. Andrew, can you pick up the fix?

It seems that Andrew has fixed it already:
http://marc.info/?l=linux-mm-commits&m=139992385527040
