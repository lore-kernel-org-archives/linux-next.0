Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD87C54FC9
	for <linux-next@archiver.kernel.org>; Wed, 15 Nov 2023 00:00:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234167AbjKOAAN (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 14 Nov 2023 19:00:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbjKOAAM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Nov 2023 19:00:12 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC2C5C2;
        Tue, 14 Nov 2023 16:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=fI1i46wGmSawxg9bjQqtCDxaszTYtfTdIi2jtLduIII=; b=z08EQD44LOosBYSQh7X5OAeNlk
        i5YGV6CTfwp0fndbsnX0juOwyS0Rgs0EvsHZER+NPjqeDdenGV3/NjhT8eguHN8I7uBxQw3/UziJ0
        2k/LhfOz2dTvZ/nEKnHqt/YoW+5VccyjjDESSmVsioMSdTZzw8QgzV+CK4fW1MN1QxkSKWa9M8HDX
        ggyxr91FgxyR+ghklrTdVzQhboa3ZrUcVW1MXGQkSg07REeGwGHG4S3lgkw/AA/tS/t0x1//j4S98
        D2QFYPyxOK9L10p6l+uoKNIckvdO0VEsIwBcJmdkmRDmNUF8HqoZdjryA6pYATPYBXf95p9NElnE9
        L0WVKVhg==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1r33KA-00H0dp-36;
        Wed, 15 Nov 2023 00:00:06 +0000
Message-ID: <960bef74-ed09-4b6f-8ae8-b3effef6914f@infradead.org>
Date:   Tue, 14 Nov 2023 16:00:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Nov 14 (loongarch: KVM)
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>,
        "open list:LOONGARCH" <loongarch@lists.linux.dev>
References: <20231114141916.6472e5c0@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231114141916.6472e5c0@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 11/13/23 19:19, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20231113:
> 

../arch/loongarch/kvm/mmu.c: In function 'kvm_map_page':
../arch/loongarch/kvm/mmu.c:810:13: error: implicit declaration of function 'mmu_invalidate_retry_hva'; did you mean 'mmu_invalidate_retry_gfn'? [-Werror=implicit-function-declaration]
  810 |         if (mmu_invalidate_retry_hva(kvm, mmu_seq, hva)) {
      |             ^~~~~~~~~~~~~~~~~~~~~~~~
      |             mmu_invalidate_retry_gfn


-- 
~Randy
