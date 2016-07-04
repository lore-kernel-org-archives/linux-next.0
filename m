From: =?UTF-8?Q?Matias_Bj=c3=b8rling?= <m@bjorling.me>
Subject: Re: linux-next: build failure after merge of the lightnvm tree
Date: Mon, 4 Jul 2016 09:06:08 +0200
Message-ID: <577A0AE0.3040506@bjorling.me>
References: <20160630125635.008b33b6@canb.auug.org.au>
 <20160704143153.57dacf1e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:37035 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751323AbcGDHGL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Jul 2016 03:06:11 -0400
Received: by mail-wm0-f52.google.com with SMTP id a66so102099291wme.0
        for <linux-next@vger.kernel.org>; Mon, 04 Jul 2016 00:06:11 -0700 (PDT)
In-Reply-To: <20160704143153.57dacf1e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/04/2016 06:31 AM, Stephen Rothwell wrote:
> Hi Matias,
>
> On Thu, 30 Jun 2016 12:56:35 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the lightnvm tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> ERROR: "nvm_alloc_dev" [drivers/nvme/host/nvme-core.ko] undefined!
>> ERROR: "nvm_alloc_dev" [drivers/block/null_blk.ko] undefined!
>>
>> Caused by commit
>>
>>    3daf1adc80a8 ("lightnvm: let drivers control the lifetime of nvm_dev")
>>
>> I have used the lightnvm tree from next-20160629 for today.
>
> I am still getting this error.
>

Hi Stephen,

Sorry for the delay. The patch is removed for now.
