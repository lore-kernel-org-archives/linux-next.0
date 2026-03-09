Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0ED36C0BB;
	Mon,  9 Mar 2026 21:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773093204; cv=none; b=o2hAcNCTXir1Xt3XXIiCRlglOrL54C2JVHehy00mdxOyTs0EsejagiUCQy5gmczyO34e8w/NCGbyNyy1g4d5Y/oxkPJY/mEKgKqtincGU4W6+E+bpc3lDnQJYum6o2a+38nAeMlXtCeXLcx0FXeCYxhrmLNDLDZmC4iwBf5QIUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773093204; c=relaxed/simple;
	bh=+kFgppPy3/Gh9u5N1rRAyzzZbUJ0E0o2FMiGzCQ79Ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F83x9CTXQg3482VfhgoxMT4ZtedyRjv/B+9GLByI5v8wcrXrt40p/5WD2jM9l4cNxPS+z5dhCxhsePAu2YPduzIkTcFjuaJZjqePhWWtK1zOsHOdiqz/31nrnnecEsLJtu1ZT5kQHDVIVRcHZaJPTucZEDlRc+9Tv9VEHYJiHAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fbmDOCyR; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fbmDOCyR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=iVEmQLqe/tsMBxlLD0Wqf9BfJxBNGSFc+SNC2crCmIA=; b=fbmDOCyRhCDYX5ahEKtMkcYmU7
	SxANs3OKlBxn7swDVpV5PhDT3fU0IIxiWmE9WLdfUCOVvgheLb0S+dbkz5tFOnvbFwZ1V54+6HqzX
	U82jUFpkcmdsehIm2WzRX829bRS1atebXqxxKzQIJxcZqiL/8bmtOdF/+ma1uUPLYgw9eI/bGmnuf
	U2qodBd8KRblAvleS1j2zvECDn56Q45S9vswY3xQax3EY6n7w2cRNgFkQhDpVKs1Lfa8gaJoUlMuD
	XzITarKTiQKu8EOUMNOEj2pSw+6BvU9lKwfqv5MYqFPCH/QMwKJnaY/mS7VdevmbstAy39W/7x9b6
	PUQcnbAg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vziXT-00000008CIR-1BFM;
	Mon, 09 Mar 2026 21:53:23 +0000
Message-ID: <69576db3-352c-41fd-a96e-a1bc6ed7b74b@infradead.org>
Date: Mon, 9 Mar 2026 14:53:21 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Mar 9
To: Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jim Mattson <jmattson@google.com>, Sean Christopherson <seanjc@google.com>
References: <aa8WV_KvEV_TFPPZ@sirena.org.uk>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aa8WV_KvEV_TFPPZ@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/9/26 11:49 AM, Mark Brown wrote:
> Hi all,
> 
> Changes since 20260306:
> 

for linux-next 2026030[459]:

linux-next/Documentation/virt/kvm/api.rst:8547: ERROR: Malformed table.
Text in column margin in table line 110.

=================================== ============================================
 KVM_X86_QUIRK_LINT0_REENABLED      By default, the reset value for the LVT
                                    LINT0 register is 0x700 (APIC_MODE_EXTINT).
                                    When this quirk is disabled, the reset value
                                    is 0x10000 (APIC_LVT_MASKED).
...
KVM_X86_QUIRK_VMCS12_FREEZE_IN_SMM_CC By default, KVM relaxes the consistency
                                      check for GUEST_IA32_DEBUGCTL in vmcs12
                                      to allow FREEZE_IN_SMM to be set.  When
                                      this quirk is disabled, KVM requires this
                                      bit to be cleared.  Note that the vmcs02
                                      bit is still completely controlled by the
                                      host, regardless of the quirk setting.
=================================== ============================================

The last table entry does not fit into the table's "columns".

From:
commit 0f70db0758be
Author: Jim Mattson <jmattson@google.com>
Date:   Thu Feb 5 15:15:26 2026 -0800
    KVM: x86: Introduce KVM_X86_QUIRK_VMCS12_FREEZE_IN_SMM_CC


-- 
~Randy

