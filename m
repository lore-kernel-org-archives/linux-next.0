From: Roberto Medina <robertoxmed@gmail.com>
Subject: Re: [PATCH v2] Staging: octeon: ethernet-tx: fixed coding style warnings,
 missing blank lines
Date: Wed, 08 Oct 2014 21:46:55 +0200
Message-ID: <543594AF.4030507@gmail.com>
References: <1412795924-17759-1-git-send-email-robertoxmed@gmail.com> <543592FD.9010900@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:38310 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753049AbaJHTrJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 8 Oct 2014 15:47:09 -0400
Received: by mail-wi0-f182.google.com with SMTP id n3so57253wiv.3
        for <linux-next@vger.kernel.org>; Wed, 08 Oct 2014 12:47:07 -0700 (PDT)
In-Reply-To: <543592FD.9010900@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: gregkh@linuxfoundation.org, josh@joshtripplet.org, ebru.akagunduz@gmail.com, aaro.koskinen@iki.fi, ebiederm@xmission.com, devel@driverdev.osuosl.org, linux-next@vger.kernel.org

On 10/08/2014 09:39 PM, Paul Gortmaker wrote:
> On 14-10-08 03:18 PM, Roberto Medina wrote:
>> From: Roberto Medina <robertoxmed@gmail.com>
>>
>> Fixed coding style warnings due to missing blank lines.
>> Dubious additions removed.
>>
>> Signed-off-by: Roberto Medina <robertoxmed@gmail.com>
>>
>> ---
>> @@ -550,6 +559,7 @@ int cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
>>
>>   	/* Get a work queue entry */
>>   	cvmx_wqe_t *work = cvmx_fpa_alloc(CVMX_FPA_WQE_POOL);
>> +
>>   	if (unlikely(work == NULL)) {
>
> This one is still bogus.
>
> P.
> --
>

Thank you very much for your feedback. I just want to let you know that 
I didn't ignore that annotation from the last patch. I actually added 
the white line because checkpatch shows a warning there.

WARNING: Missing a blank line after declarations
#553: FILE: drivers/staging/octeon/ethernet-tx.c:553:
+	cvmx_wqe_t *work = cvmx_fpa_alloc(CVMX_FPA_WQE_POOL);
+	if (unlikely(work == NULL)) {

I don't see why I shouldn't insert a line there.

Cheers,

Roberto Medina
