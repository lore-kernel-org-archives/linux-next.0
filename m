From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the fixes tree
Date: Thu, 7 Feb 2019 07:15:38 -0600
Message-ID: <d89f5995-b8fb-5a66-f3a7-b8c27d3c2fe2@embeddedor.com>
References: <20190207154747.03209c75@canb.auug.org.au>
 <20190207165134.57c853dd@canb.auug.org.au>
 <20190207171554.59c91dbf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207171554.59c91dbf@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org



On 2/7/19 12:15 AM, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 7 Feb 2019 16:51:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> On Thu, 7 Feb 2019 15:47:47 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>
>>> Today's linux-next merge of the scsi-mkp tree got a conflict in:
>>>
>>>   drivers/scsi/osd/osd_initiator.c
>>>
>>> between commit:
>>>
>>>   24648908acac ("scsi: osd: osd_initiator: mark expected switch fall-throughs")  
>>
>> I will remove that from my fixes tree for tomorrow.
> 
> And that same patch appears in the kspp-gustavo tree as well ...
> 

I will remove it from my tree.

Thanks, Stephen.

--
Gustavo
