From: Sebastian Capella <sebastian.capella@linaro.org>
Subject: Re: linux-next: build warning after merge of the arm tree
Date: Mon, 21 Apr 2014 17:59:01 -0700
Message-ID: <CADHgK6vPpNtKNmqcQgqDUHLSCM0DfDGbqcrXMaNkOpe+6ikR-Q@mail.gmail.com>
References: <20140422103223.f16654774d15a81410eaad22@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140422103223.f16654774d15a81410eaad22@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Russell King <linux@arm.linux.org.uk>, linux-next@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

I'm not sure if this is helpful, but the virt_to_pfn macro added in
arch/arm/include/asm/memory.h:300 (I assume the 297 warning in yours),
in the hibernation patch:

#define virt_to_pfn(kaddr)      (__pa(kaddr) >> PAGE_SHIFT)

Should be removed as there is an improved version of virt_to_pfn for
arm in this commit: e26a9e00afc482b971afcaef1db8c9034d4d6d7c

Thanks,

Sebastian
