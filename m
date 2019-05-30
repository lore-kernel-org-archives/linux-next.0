From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2019-05-29-20-52 uploaded (mpls)
Date: Thu, 30 May 2019 15:28:46 -0700
Message-ID: <5a9fc4e5-eb29-99a9-dff6-2d4fdd5eb748@infradead.org>
References: <20190530035339.hJr4GziBa%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190530035339.hJr4GziBa%akpm@linux-foundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, broonie@kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-next@vger.kernel.org, mhocko@suse.cz, mm-commits@vger.kernel.org, sfr@canb.auug.org.au, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 5/29/19 8:53 PM, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2019-05-29-20-52 has been uploaded to
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
> 
> You will need quilt to apply these patches to the latest Linus release (5.x
> or 5.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
> http://ozlabs.org/~akpm/mmotm/series
> 
> The file broken-out.tar.gz contains two datestamp files: .DATE and
> .DATE-yyyy-mm-dd-hh-mm-ss.  Both contain the string yyyy-mm-dd-hh-mm-ss,
> followed by the base kernel version against which this patch series is to
> be applied.
> 

on i386 or x86_64:

when CONFIG_PROC_SYSCTL is not set/enabled:

ld: net/mpls/af_mpls.o: in function `mpls_platform_labels':
af_mpls.c:(.text+0x162a): undefined reference to `sysctl_vals'
ld: net/mpls/af_mpls.o:(.rodata+0x830): undefined reference to `sysctl_vals'
ld: net/mpls/af_mpls.o:(.rodata+0x838): undefined reference to `sysctl_vals'
ld: net/mpls/af_mpls.o:(.rodata+0x870): undefined reference to `sysctl_vals'



-- 
~Randy
