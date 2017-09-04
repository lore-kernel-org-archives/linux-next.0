From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: linux-next: build warning after merge of the powerpc tree
Date: Mon, 4 Sep 2017 10:59:28 +0200
Message-ID: <9bf0fd0d-c56c-3826-9301-1ef720aacb44@kaod.org>
References: <20170904185341.58e3ff62@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20170904185341.58e3ff62@canb.auug.org.au>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 09/04/2017 10:53 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the powerpc tree, today's linux-next build (powerpc
> allyesconfig) produced this warning:
> 
> WARNING: vmlinux.o(.text+0xa7cb8): Section mismatch in reference from the function .xive_spapr_init() to the function .init.text:.xive_core_init()
> The function .xive_spapr_init() references
> the function __init .xive_core_init().
> This is often because .xive_spapr_init lacks a __init 
> annotation or the annotation of .xive_core_init is wrong.
> 
> Introduced by commit
> 
>   eac1e731b59e ("powerpc/xive: guest exploitation of the XIVE interrupt controller")
> 

yes. I just sent a patch for this :

	http://patchwork.ozlabs.org/patch/809542/

Cheers,

C.
