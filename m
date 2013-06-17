From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: linux-next: manual merge of the arm64-hugepages tree with the
 arm64 tree
Date: Mon, 17 Jun 2013 10:01:02 +0100
Message-ID: <51BED04E.6030007@arm.com>
References: <20130617174528.fc0381c10f8c5296b4efe776@canb.auug.org.au> <20130617084224.GB28225@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:34574 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751365Ab3FQJBI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 17 Jun 2013 05:01:08 -0400
In-Reply-To: <20130617084224.GB28225@linaro.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steve Capper <steve.capper@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>

On 17/06/13 09:42, Steve Capper wrote:
> On Mon, Jun 17, 2013 at 05:45:28PM +1000, Stephen Rothwell wrote:
>> Hi Steve,
> 
> Hi Stephen,
> 
>>
>> Today's linux-next merge of the arm64-hugepages tree got conflicts in
>> arch/arm64/include/asm/pgtable-hwdef.h and
>> arch/arm64/include/asm/pgtable.h between commit 363116073a26 ("arm64:
>> KVM: define HYP and Stage-2 translation page flags") from the arm64 tree
>> and commits 072b1b62a643 ("ARM64: mm: Make PAGE_NONE pages read only and
>> no-execute") and af07484863e0 ("ARM64: mm: THP support") from the
>> arm64-hugepages tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary (no action
>> is required).
>>
> 
> Thanks, the fixup looks good to me.
> 
>> Note that the arm64 tree version of PMD_SECT_USER used a pteval_t where I
>> would have expected a pmdval_t like the arm64-hugepages tree version.
> 
> Yes I think it should be a pmdval_t too, I will follow this up.

Indeed, my bad. I'll fix this ASAP.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
