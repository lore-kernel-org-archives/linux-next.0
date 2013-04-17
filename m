From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: Removal of GENERIC_GPIO breaks -next
Date: Wed, 17 Apr 2013 18:46:44 +0530
Message-ID: <516EA0BC.2040109@synopsys.com>
References: <CAAVeFu+fM=fJ2zp-gX4T07COMB31yvs74dXUqrw1LH09M7MXLg@mail.gmail.com> <516E9083.6050808@synopsys.com> <CAAVeFuL6qAz1OvnxtMj4jCjR3YR8C218+8oAgGRkCaWQJ_-KEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vaxjo.synopsys.com ([198.182.60.75]:60328 "EHLO
	vaxjo.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965643Ab3DQNQ7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Apr 2013 09:16:59 -0400
In-Reply-To: <CAAVeFuL6qAz1OvnxtMj4jCjR3YR8C218+8oAgGRkCaWQJ_-KEg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Shaveta Leekha <shaveta@freescale.com>, Christian Ruppert <christian.ruppert@abilis.com>, linux-next <linux-next@vger.kernel.org>

On 04/17/2013 06:34 PM, Alexandre Courbot wrote:
>
> Yes, I am not too worried about arc since it doesn't break anything.
> But as you mention it would be better if the whole job could be done
> by the same patch. The problem here is the merge order, for me to
> address this I need to work after your patches. 

OK I understand. Since your code touches a lot more stuff, I don't know if the
ordering should be governed by this small harmless patch alone :-)

> So maybe in the end my
> series should be merged at the end of the merge window, and after all
> architecture code is merged, to make sure I can address all instances.

You are touching a lot of arches anyways so you will have to be after them
anyways. Is that right ?

Anyhow lets park this patch for now - we can push it in the 3.10-rc cycle.

-Vineet
