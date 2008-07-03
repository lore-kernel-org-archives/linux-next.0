From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: generic-ipi tree build failure
Date: Thu, 3 Jul 2008 09:22:13 +0200
Message-ID: <20080703072212.GQ20055@kernel.dk>
References: <20080703171007.5a17ea25.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
Content-Disposition: inline
In-Reply-To: <20080703171007.5a17ea25.sfr@canb.auug.org.au>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linuxppc-dev@ozlabs.org, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>
List-Id: linux-next.vger.kernel.org

On Thu, Jul 03 2008, Stephen Rothwell wrote:
> Hi Ingo, Jens,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> arch/powerpc/mm/tlb_64.c: In function 'pgtable_free_now':
> arch/powerpc/mm/tlb_64.c:66: error: too many arguments to function 'smp_call_function'
> arch/powerpc/mm/slice.c: In function 'slice_get_unmapped_area':
> arch/powerpc/mm/slice.c:559: error: too many arguments to function 'on_each_cpu'
> arch/powerpc/kernel/machine_kexec_64.c: In function 'kexec_prepare_cpus':
> arch/powerpc/kernel/machine_kexec_64.c:175: error: too many arguments to function 'smp_call_function'
> 
> I applied the patch below.

Thanks Stephen, I've verified that the patch is correct!

-- 
Jens Axboe
