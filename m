From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2018-10-30-16-08 uploaded (arch/x86/kernel/vsmp_64.c)
Date: Tue, 30 Oct 2018 20:20:09 -0700
Message-ID: <9e14d183-55a4-8299-7a18-0404e50bf004@infradead.org>
References: <20181030230905.xHZmM%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181030230905.xHZmM%akpm@linux-foundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, broonie@kernel.org, mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org, Ravikiran Thirumalai <kiran@scalemp.com>, Shai Fultheim <shai@scalemp.com>, X86 ML <x86@kernel.org>
List-Id: linux-next.vger.kernel.org

On 10/30/18 4:09 PM, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2018-10-30-16-08 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 
> mmotm-readme.txt says
> 
> README for mm-of-the-moment:
> 
> http://www.ozlabs.org/~akpm/mmotm/
> 
> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> more than once a week.


Build error on x86_64 from origin.patch (i.e., not mmotm)
when CONFIG_PCI is not enabled:
Oh:  CONFIG_X86_VSMP is also not enabled, but
arch/x86/kernel/Makefile always tries to build vsmp_64.o.


ld: arch/x86/kernel/vsmp_64.o: in function `vsmp_cap_cpus':
vsmp_64.c:(.init.text+0x1e): undefined reference to `read_pci_config'


-- 
~Randy
