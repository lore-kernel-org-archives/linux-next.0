From: "Drokin, Oleg" <oleg.drokin@intel.com>
Subject: Re: linux-next: build failure after merge of the nfs tree
Date: Wed, 19 Aug 2015 00:15:29 +0000
Message-ID: <7CEC804B-154C-43DF-AA78-7C8D275F69A0@intel.com>
References: <20150818105634.5be18a1c@canb.auug.org.au>
 <20150819100536.5b4d1ae6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:25274 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751161AbbHSAPf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 18 Aug 2015 20:15:35 -0400
In-Reply-To: <20150819100536.5b4d1ae6@canb.auug.org.au>
Content-Language: en-US
Content-ID: <97A13DB5A20260488A6DF6569E3ADCE9@intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Trond Myklebust <trond.myklebust@fys.uio.no>, "<linux-next@vger.kernel.org>" <linux-next@vger.kernel.org>, "<linux-kernel@vger.kernel.org>" <linux-kernel@vger.kernel.org>, Chuck Lever <chuck.lever@oracle.com>, Anna Schumaker <Anna.Schumaker@Netapp.com>, Christoph Hellwig <hch@infradead.org>, Greg KH <greg@kroah.com>, "Dilger, Andreas" <andreas.dilger@intel.com>, "<HPDD-discuss@lists.01.org>" <HPDD-discuss@lists.01.org>

Hello!

On Aug 18, 2015, at 8:05 PM, Stephen Rothwell wrote:

> Hi Trond,
> 
> On Tue, 18 Aug 2015 10:56:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> 
>> After merging the nfs tree, today's linux-next build (x86_64 allmodconfig)
>> failed like this:
>> 
>> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c: In function 'kiblnd_pmr_pool_map':
>> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:1828:2: error: implicit declaration of function 'ib_reg_phys_mr' [-Werror=implicit-function-declaration]
>>  pmr->pmr_mr = ib_reg_phys_mr(hdev->ibh_pd,
>>  ^
>> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:1828:14: warning: assignment makes pointer from integer without a cast
>>  pmr->pmr_mr = ib_reg_phys_mr(hdev->ibh_pd,
>>              ^
>> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c: In function 'kiblnd_hdev_setup_mrs':
>> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:2380:6: warning: assignment makes pointer from integer without a cast
>>   mr = ib_reg_phys_mr(hdev->ibh_pd, &ipb, 1, acflags, &iova);
>>      ^
>> 
>> Caused by commit
>> 
>>  1241d7bf2ac8 ("core: Remove the ib_reg_phys_mr() and ib_rereg_phys_mr() verbs")
>> 
>> which noted this build failure would occur :-(
>> 
>> Since this commit is self comtained, I have reverted it until someone
>> provides a fix for the lustre code.
> 
> Today, I will disable lustre (from staging) instead (thanks to
> Christoph for reminding me of this policy).

We have a patch for that, actually.
I'll try to build it against your tree and submit it afterwards (will take a bit of time).

Bye,
    Oleg