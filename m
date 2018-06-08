From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: build warning after merge of the pm tree
Date: Fri, 08 Jun 2018 11:14:54 +0200
Message-ID: <2704837.jejCyCdvyd@aspire.rjw.lan>
References: <20180608103035.266fa61b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180608103035.266fa61b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Friday, June 8, 2018 2:30:35 AM CEST Stephen Rothwell wrote:
> 
> --Sig_/ncqmE76IGCiWNItKgM.lURc
> Content-Type: text/plain; charset=US-ASCII
> Content-Transfer-Encoding: quoted-printable
> 
> Hi all,

Hi,

> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> WARNING: vmlinux.o(.text+0xc5b83a): Section mismatch in reference from the =
> function __intel_pstate_cpu_init() to the variable .init.rodata:intel_pstat=
> e_hwp_boost_ids
> The function __intel_pstate_cpu_init() references
> the variable __initconst intel_pstate_hwp_boost_ids.
> This is often because __intel_pstate_cpu_init lacks a __initconst=20
> annotation or the annotation of intel_pstate_hwp_boost_ids is wrong.
> 
> Introduced by commit
> 
>   f50f70793d78 ("cpufreq: intel_pstate: enable boost for Skylake Xeon")

Thanks for the report!

I've dropped the __initconst annotation from intel_pstate_hwp_boost_ids[].

Thanks,
Rafael
