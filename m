From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: linux-next: build failure after merge of the final tree (xen
 tree related)
Date: Mon, 26 Jul 2010 11:14:29 -0700
Message-ID: <4C4DD085.1030309@goop.org>
References: <20100726152908.951a95b7.sfr@canb.auug.org.au> <alpine.DEB.2.00.1007261132180.22235@kaball-desktop> <4C4DC505.9040202@goop.org> <alpine.DEB.2.00.1007261835360.19809@kaball-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from claw.goop.org ([74.207.240.146]:45058 "EHLO claw.goop.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751283Ab0GZSOa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 Jul 2010 14:14:30 -0400
In-Reply-To: <alpine.DEB.2.00.1007261835360.19809@kaball-desktop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Xen Devel <Xen-devel@lists.xensource.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sheng Yang <sheng@linux.intel.com>

  On 07/26/2010 10:57 AM, Stefano Stabellini wrote:
> On Mon, 26 Jul 2010, Jeremy Fitzhardinge wrote:
>>    On 07/26/2010 03:43 AM, Stefano Stabellini wrote:
>>> On Mon, 26 Jul 2010, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> After merging the final tree, today's linux-next build (i386 defconfig)
>>>> failed like this:
>>>>
>>>> arch/x86/built-in.o: In function `init_hypervisor_platform':
>>>> (.init.text+0x3ca4): undefined reference to `x86_hyper_xen_hvm'
>>>> arch/x86/built-in.o: In function `init_hypervisor_platform':
>>>> (.init.text+0x3cad): undefined reference to `x86_hyper_xen_hvm'
>>>>
>>>> Caused by commit bee6ab53e652a414af20392899879b58cd80d033 ("x86: early PV
>>>> on HVM features initialization").
>>>>
>>>> I reverted commit 4b9100d12d15c0eaf23d9edc86228e1bdf452dc2 ("Merge branch
>>>> 'upstream/pvhvm' into upstream/xen") for today (since there were
>>>> dependencies on the above commit).
>>> The problem is that x86_hyper_xen_hvm is in arch/x86/xen/enlighten.c,
>>> that is compiled only when CONFIG_XEN is enabled.
>>> The appended patch fixes the issue moving x86_hyper_xen_hvm to
>>> arch/x86/kernel/cpu/xen.c that is always compiled.
>>>
>>> An shorter alternative solution would be just to ifdef CONFIG_XEN
>>> x86_hyper_xen_hvm in arch/x86/kernel/cpu/hypervisor.c.
>> Seems like the most sensible thing to do.  What's the point in detecting
>> Xen if we don't have CONFIG_XEN enabled?
> There isn't much point in doing so apart from avoiding an ifdef.
> This is the alternative:

Thanks.  I'd already committed it ;)

     J

> ---
>
>
> Signed-off-by: Stefano Stabellini<stefano.stabellini@eu.citrix.com>
>
> diff --git a/arch/x86/kernel/cpu/hypervisor.c b/arch/x86/kernel/cpu/hypervisor.c
> index bffd47c..5bccedc 100644
> --- a/arch/x86/kernel/cpu/hypervisor.c
> +++ b/arch/x86/kernel/cpu/hypervisor.c
> @@ -34,7 +34,9 @@ static const __initconst struct hypervisor_x86 * const hypervisors[] =
>   {
>   	&x86_hyper_vmware,
>   	&x86_hyper_ms_hyperv,
> +#ifdef CONFIG_XEN
>   	&x86_hyper_xen_hvm,
> +#endif
>   };
>
>   const struct hypervisor_x86 *x86_hyper;
>
