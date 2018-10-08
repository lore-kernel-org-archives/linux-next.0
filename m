From: David Hildenbrand <david@redhat.com>
Subject: Re: linux-next: manual merge of the akpm tree with the jc_docs tree
Date: Mon, 8 Oct 2018 10:38:29 +0200
Message-ID: <6ab76538-b836-3b22-cb29-102c613091cf@redhat.com>
References: <20181008183840.70ebfe94@canb.auug.org.au>
 <20181008081315.GB6772@rapoport-lnx>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181008081315.GB6772@rapoport-lnx>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Rapoport <rppt@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 08/10/2018 10:13, Mike Rapoport wrote:
> On Mon, Oct 08, 2018 at 06:38:40PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the akpm tree got conflicts in:
>>
>>   Documentation/memory-hotplug.txt
>>   Documentation/admin-guide/mm/memory-hotplug.rst
>>
>> between commits:
>>
>>   6bf53999a3a2 ("docs: move memory hotplug description into admin-guide/mm")
>>   98cee6742c80 ("docs/vm: split memory hotplug notifier description to Documentation/core-api")
>>
>> from the jc_docs tree and patch:
>>
>>   "memory-hotplug.txt: add some details about locking internals"
>>
>> from the akpm tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
> 
> Somehow I've managed to miss the patches from David :(
> 
> I should have called the new
> Documentation/core-api/memory-hotplug-notifier.rst memory-hotplug.rst and
> then the details about locking would fit there just fine.
> 

Yes, my changes certainly don't belong into the admin guide, so having
internal memory-hotplug.rst sounds good to me.

> I can do the renaming and add the patch
> 
>   "memory-hotplug.txt: add some details about locking internals"
> 
> on top of the jc_docs tree.
> 
> Does it sound Ok?
> 

Fine with me.

Thanks!

-- 

Thanks,

David / dhildenb
