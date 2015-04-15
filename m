From: David Vrabel <david.vrabel@citrix.com>
Subject: Re: linux-next: build failure after merge of the xen-tip tree
Date: Wed, 15 Apr 2015 11:03:30 +0100
Message-ID: <552E3772.7050209@citrix.com>
References: <20150413180902.59d8e9bd@canb.auug.org.au>
 <552B802A.3080709@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp02.citrix.com ([66.165.176.63]:49855 "EHLO
	SMTP02.CITRIX.COM" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751876AbbDOKDd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Apr 2015 06:03:33 -0400
In-Reply-To: <552B802A.3080709@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bob Liu <bob.liu@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Liu <wei.liu2@citrix.com>, Paul Durrant <paul.durrant@citrix.com>

On 13/04/15 09:36, Bob Liu wrote:
> Hi Stephen,
> 
> On 04/13/2015 04:09 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the xen-tip tree, today's linux-next build (x86_64
>> allmodconfig)
>> failed like this:
>>
>> drivers/char/tpm/xen-tpmfront.c: In function 'setup_ring':
>> drivers/char/tpm/xen-tpmfront.c:203:7: warning: passing argument 2 of
>> 'xenbus_grant_ring' makes pointer from integer without a cast
>>    rv = xenbus_grant_ring(dev, virt_to_mfn(priv->shr));
>>         ^
>> In file included from drivers/char/tpm/xen-tpmfront.c:17:0:
>> include/xen/xenbus.h:206:5: note: expected 'void *' but argument is of
>> type 'long unsigned int'
>>   int xenbus_grant_ring(struct xenbus_device *dev, void *vaddr,
>>       ^
>> drivers/char/tpm/xen-tpmfront.c:203:7: error: too few arguments to
>> function 'xenbus_grant_ring'
>>    rv = xenbus_grant_ring(dev, virt_to_mfn(priv->shr));
>>         ^
>> In file included from drivers/char/tpm/xen-tpmfront.c:17:0:
>> include/xen/xenbus.h:206:5: note: declared here
>>   int xenbus_grant_ring(struct xenbus_device *dev, void *vaddr,
>>       ^
>>
>> Caused by commit 1b1586eeeb8c ("xenbus_client: Extend interface to
>> support multi-page ring").
>>
>> I have used the xen-tip tree from next-20150410 for today.
>>
> 
> Sorry for this issue, I missed the xentpm-front.c file in that patch.
> (Original patch from Wei Liu already included the right modification
> which didn't exist in Paul's.)
> 
> Attached patch should fix this build failure.

Thanks. I've folded this in.

David
