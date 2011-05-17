From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: linux-next: manual merge of the xen tree with Linus tree
Date: Tue, 17 May 2011 12:15:19 -0700
Message-ID: <4DD2C947.9050501@goop.org>
References: <20110115120544.98a1f091.sfr@canb.auug.org.au> <20110517211234.472e32f4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from claw.goop.org ([74.207.240.146]:48879 "EHLO claw.goop.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756321Ab1EQTPX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 May 2011 15:15:23 -0400
In-Reply-To: <20110517211234.472e32f4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Xen Devel <Xen-devel@lists.xensource.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

On 05/17/2011 04:12 AM, Stephen Rothwell wrote:
> Hi Jeremy,
>
> On Sat, 15 Jan 2011 12:05:44 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Today's linux-next merge of the xen tree got a conflict in
>> drivers/xen/Kconfig, drivers/xen/gntdev.c and include/xen/gntdev.h
>> between various commits Linus' tree and various commits from the xen tree.
>>
>> As previously discussed, I have dropped the xen tree for today (as it
>> contains an older version of the changes that were merged into Linus'
>> tree).
> Just wondering if the xen tree is ever going to make a reappearance in
> linux-next?

Konrad's tree has the bulk of the xen work in it at the moment.  I'm
doing to start on a few bits and pieces, but I've not decided if I'll
put them into linux-next myself or just push them via Konrad.

So, maybe, but maybe not.

Thanks,
    J
