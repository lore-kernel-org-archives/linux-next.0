From: Pekka Enberg <penberg@kernel.org>
Subject: Re: linux-next: build failure after merge of the slab tree
Date: Thu, 11 Jul 2013 09:42:35 +0300
Message-ID: <51DE53DB.1010104@kernel.org>
References: <20130710125654.dd36f8fb19588697226b99be@canb.auug.org.au> <51DD06A9.4030605@kernel.org> <0000013fc9e9f94b-e87067d6-0bb6-41b3-ae83-ed8f110f893f-000000@email.amazonses.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-la0-f49.google.com ([209.85.215.49]:41034 "EHLO
	mail-la0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751888Ab3GKGmj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Jul 2013 02:42:39 -0400
In-Reply-To: <0000013fc9e9f94b-e87067d6-0bb6-41b3-ae83-ed8f110f893f-000000@email.amazonses.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 10 Jul 2013, Pekka Enberg wrote:
>> Yes, it indeed interacts badly with kmemleak and tracing. I reverted the
>> commit.

On 07/10/2013 09:48 PM, Christoph Lameter wrote:
> Here is the fix required. kmemleak.h is weird in that it cannot be
> included at the top of slab.h due to its corresponding dependency on
> slab.h. Bad situation. kmemleak.h itself should  include "slab.h"...

Can you please resend these after the merge window closes?

			Pekka
