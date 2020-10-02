Return-Path: <SRS0=Edkf=DJ=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F9ABC46466
	for <linux-next@archiver.kernel.org>; Fri,  2 Oct 2020 22:04:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2D1620754
	for <linux-next@archiver.kernel.org>; Fri,  2 Oct 2020 22:04:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="goSevYuq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725283AbgJBWEu (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 2 Oct 2020 18:04:50 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:7051 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbgJBWEt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Oct 2020 18:04:49 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f77a3f40000>; Fri, 02 Oct 2020 15:04:36 -0700
Received: from [10.2.58.214] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 22:04:48 +0000
Subject: Re: [PATCH v2 2/2] selftests/vm: fix run_vmtest.sh: restore
 executable bits, and "s" in name
To:     Andrew Morton <akpm@linux-foundation.org>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
References: <20201002084049.556824-1-jhubbard@nvidia.com>
 <20201002084049.556824-3-jhubbard@nvidia.com>
 <20201002145945.c5abb5f57dbeac30351b7757@linux-foundation.org>
From:   John Hubbard <jhubbard@nvidia.com>
Message-ID: <9c41820b-05d5-8e62-2ef2-ab82d5e02f06@nvidia.com>
Date:   Fri, 2 Oct 2020 15:04:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201002145945.c5abb5f57dbeac30351b7757@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601676276; bh=tsVL+aYK5H/xpBAIEurPJopgRTkiLvAbf0cAHKTbOVY=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=goSevYuqzGKTKFDYTjm0H1Dh3EAUWuicHgP/aF5RHge52TmeUwv6AFDidhwf237hR
         AAvBqnV5sErsPmUJd7FJiCG7hykSdsE2NLpG4yY8gP0sCZTocQl1Ydw8g7ydFn1S/9
         GFEQLalCW8IG6EK0zaEuMlAMstmROPscLN3w4TciV6/ufqrwsDN7cQW/R1fh9vrED0
         u2CmBdea6dwjHfKUAk675BNqXYvU57JrFYZq1QCteBIFH+a730omJIKaXDWF4msUir
         NLduV6M2amMzR52e1XvogLy/2WYB8OR9182X3MAZUbayadMYpUVnxkW9BJxexLw1xu
         Ad2IfHL32hCSQ==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/2/20 2:59 PM, Andrew Morton wrote:
> On Fri, 2 Oct 2020 01:40:49 -0700 John Hubbard <jhubbard@nvidia.com> wrote:
> 
>> commit cb2ab76685d7 ("selftests/vm: rename run_vmtests -->
>> run_vmtests.sh") changed the name of run_vmtests to run_vmtest.sh, but
>> inadvertently dropped the executable bits.
> 
> We cannot depend on the x bit.  Because downloading linux-foo.patch.gz
> and installing it with patch(1) is a supported way of obtaining Linux.
> And patch(1) loses the x bit.

OK. I was just hoping that, within our processes here, there's still some
way to get something committed that does have the bit set. Because it's a
nice touch to be able to do

./run_vmtests.sh

Not a big deal of course.

> 
> If $(CONFIG_SHELL) is unavailable then invoking the script with
> "/bin/sh foo.sh" should do the trick.

OK, I'll use that for the Makefile.

> 
>> Somehow the name is missing an "s", too. Fix both of these problems by
>> renaming, and restoring the executable bits.
> 
> But that's what your patch did!
> 
> tools/testing/selftests/vm/{run_vmtests => run_vmtest.sh} | 0
> 
> Here: https://lkml.kernel.org/r/20200929212747.251804-4-jhubbard@nvidia.com
> 

Yes, the dropped "s" is my mistake!

> 
> So all confused.  I'll drop this version - please redo and resend when
> convenient?
> 

Coming up, sorry about the mess here!

thanks,
-- 
John Hubbard
NVIDIA
