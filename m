From: Christoph Lameter <cl@linux.com>
Subject: Re: next-20130204 - bisected slab problem to "slab: Common constants
 for kmalloc boundaries"
Date: Mon, 4 Feb 2013 19:22:03 +0000
Message-ID: <0000013ca6a87485-3f013e82-046c-4374-86d5-67fb85a085f9-000000@email.amazonses.com>
References: <510FE051.7080107@imgtec.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from a193-30.smtp-out.amazonses.com ([199.255.193.30]:9533 "EHLO
	a193-30.smtp-out.amazonses.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754652Ab3BDTWF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Feb 2013 14:22:05 -0500
In-Reply-To: <510FE051.7080107@imgtec.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Hogan <james.hogan@imgtec.com>
Cc: linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Pekka Enberg <penberg@kernel.org>, Matt Mackall <mpm@selenic.com>, linux-mm@kvack.org

On Mon, 4 Feb 2013, James Hogan wrote:

> I've hit boot problems in next-20130204 on Meta:

Meta is an arch that is not in the tree yet? How would I build for meta?

What are the values of

MAX_ORDER
PAGE_SHIFT
ARCH_DMA_MINALIGN
CONFIG_ZONE_DMA

?
