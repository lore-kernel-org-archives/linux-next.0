Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB65C43461
	for <linux-next@archiver.kernel.org>; Sat, 10 Apr 2021 23:50:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F89A610D1
	for <linux-next@archiver.kernel.org>; Sat, 10 Apr 2021 23:50:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235173AbhDJXvH (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sat, 10 Apr 2021 19:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234975AbhDJXvG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 10 Apr 2021 19:51:06 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E66C06138B;
        Sat, 10 Apr 2021 16:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=ImmH4my3bHskVbDwy22MNIevC3JZsdugYTzI/EryWkY=; b=aR70jOycvNYFuV3tcZOk7DKHNV
        wwdlXd86iX0i7Dv4V81aWvKYteZk/MeMjLynkhLvjrXt3BTKk0BhyYN7PXzX0l6NX/NHwqtCx+EGe
        2pObU6rHjWf+xepnPo8orlZIISsbSszsp9wIGauULGChfa8owXWceYyprrwIvGHwAc0rpnG9svFon
        G44UhroOekVI4z3OzypDxyS5zW1To35PbppALbOEP/ThoGonzb9Z1BdRVYsoHRCAHAfzzjtZDsyZk
        jEfWFLWOPIV9fhM0L6UIAVf0FlSh4wczWKL3QXA+Byp4+r9HLg1Ylptj89O40GaFOMr5jyeEjjO5U
        bm1fQlPA==;
Received: from [2601:1c0:6280:3f0::e0e1]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lVNMu-002HrR-Cl; Sat, 10 Apr 2021 23:50:36 +0000
Subject: Re: linux-next: Tree for Apr 9 (drivers/iommu/intel/pasid.c)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org
References: <20210409215103.03999588@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7fbf0e6e-bd63-d370-7d22-eafc2ed81ad2@infradead.org>
Date:   Sat, 10 Apr 2021 16:50:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210409215103.03999588@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/9/21 4:51 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20210408:
> 
> New trees: iio, iio-fixes
> 

on ia64: (not X86)

(from a 01.org kernel config file)


../drivers/iommu/intel/pasid.c: In function 'pasid_enable_wpe':
../drivers/iommu/intel/pasid.c:554:22: error: implicit declaration of function 'read_cr0' [-Werror=implicit-function-declaration]
  554 |  unsigned long cr0 = read_cr0();
      |                      ^~~~~~~~
In file included from ../include/linux/build_bug.h:5,
                 from ../include/linux/bits.h:22,
                 from ../include/linux/bitops.h:6,
                 from ../drivers/iommu/intel/pasid.c:12:
../drivers/iommu/intel/pasid.c:557:23: error: 'X86_CR0_WP' undeclared (first use in this function)
  557 |  if (unlikely(!(cr0 & X86_CR0_WP))) {
      |                       ^~~~~~~~~~
../include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
   78 | # define unlikely(x) __builtin_expect(!!(x), 0)
      |                                          ^
../drivers/iommu/intel/pasid.c:557:23: note: each undeclared identifier is reported only once for each function it appears in
  557 |  if (unlikely(!(cr0 & X86_CR0_WP))) {
      |                       ^~~~~~~~~~
../include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
   78 | # define unlikely(x) __builtin_expect(!!(x), 0)
      |                                          ^



-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
