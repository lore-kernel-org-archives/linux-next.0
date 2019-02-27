From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Feb 27 (mshyperv)
Date: Wed, 27 Feb 2019 09:25:26 -0800
Message-ID: <a6cfb923-c21e-b0e3-44e1-33197aac2625@infradead.org>
References: <20190227174427.4e8f7f24@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190227174427.4e8f7f24@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-hyperv@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 2/26/19 10:44 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190226:
> 

on i386:

../arch/x86/kernel/cpu/mshyperv.c: In function ‘ms_hyperv_init_platform’:
../arch/x86/kernel/cpu/mshyperv.c:339:3: error: ‘x2apic_phys’ undeclared (first use in this function)
   x2apic_phys = 1;
   ^


-- 
~Randy
