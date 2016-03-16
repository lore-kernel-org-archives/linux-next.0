From: "Ismail, Mustafa" <mustafa.ismail@intel.com>
Subject: RE: linux-next: build failure after merge of the rdma tree
Date: Wed, 16 Mar 2016 22:14:37 +0000
Message-ID: <5C5647B5F4794941BAAC07CF28785CBC0D608836@fmsmsx101.amr.corp.intel.com>
References: <20160316121538.6d5a773b@canb.auug.org.au>
 <20160316064953.GA28157@gondor.apana.org.au> <56E9ADD2.2050500@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:57117 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932608AbcCPWOk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Mar 2016 18:14:40 -0400
In-Reply-To: <56E9ADD2.2050500@redhat.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Latif, Faisal" <faisal.latif@intel.com>

Faisal is out until 3/18. We will make the changes and send a patch shortly.
Thanks Herbert for the pointers. Regards.

-----Original Message-----
From: linux-next-owner@vger.kernel.org [mailto:linux-next-owner@vger.kernel.org] On Behalf Of Doug Ledford
Sent: Wednesday, March 16, 2016 2:03 PM
To: Herbert Xu <herbert@gondor.apana.org.au>; Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Latif, Faisal <faisal.latif@intel.com>
Subject: Re: linux-next: build failure after merge of the rdma tree

On 3/16/2016 2:49 AM, Herbert Xu wrote:
> On Wed, Mar 16, 2016 at 12:15:38PM +1100, Stephen Rothwell wrote:
>> Hi Doug,
>>
>> After merging the rdma tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> In file included from drivers/infiniband/hw/i40iw/i40iw.h:57:0,
>>                  from drivers/infiniband/hw/i40iw/i40iw_cm.c:63:
>> drivers/infiniband/hw/i40iw/i40iw_osdep.h:175:12: warning: 'struct hash_desc' declared inside parameter list
>>             u32 length, u32 value);
>>             ^
>>
>> And it went downhill badly after that.
>>
>> Caused by commit
>>
>>   896545098777 ("crypto: hash - Remove crypto_hash interface")
>>
>> from the crypto tree interacting with commits
>>
>>   786c6adb3a94 ("i40iw: add puda code")
>>   4e9042e647ff ("i40iw: add hw and utils files")
>>
>> (at least) from the rdma tree.
>>
>> Its a bit of a pain finding these conflicts now - it would have been 
>> better a few weeks ago.
>>
>> For now, all I can do is to use the rdma tree from next-20160315 for 
>> today.
>>
>> Herbert, any hints for Doug, Faisal?
> 
> crypto_hash is obsolete.  You should be using shash if your input is 
> completely linear or ahash if you need SG lists.  For an example of 
> how you can do the conversion, have a look at
> 
> commit 69110e3cedbb8aad1c70d91ed58a9f4f0ed9eec6
> Author: Herbert Xu <herbert@gondor.apana.org.au>
> Date:   Sun Jan 24 21:19:52 2016 +0800
> 
>     iscsi-target: Use shash and ahash
> 
> Cheers,
> 

Pending an update from Intel on the i40iw driver, I have pulled it from my for-next area.  This should not be a problem with tonight's merge.
