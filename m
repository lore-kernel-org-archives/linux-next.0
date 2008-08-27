From: "Bartlomiej Zolnierkiewicz" <bzolnier@gmail.com>
Subject: Re: linux-next: Tree for August 27
Date: Wed, 27 Aug 2008 16:57:18 +0200
Message-ID: <58cb370e0808270757k583c0fc2oc659bc8e2dd6c21e@mail.gmail.com>
References: <20080827183453.eb651f50.sfr@canb.auug.org.au>
	 <200808271206.48370.bzolnier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.153]:28496 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754188AbYH0O5T (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 Aug 2008 10:57:19 -0400
Received: by fg-out-1718.google.com with SMTP id 19so1575956fgg.17
        for <linux-next@vger.kernel.org>; Wed, 27 Aug 2008 07:57:18 -0700 (PDT)
In-Reply-To: <200808271206.48370.bzolnier@gmail.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>

On Wed, Aug 27, 2008 at 12:06 PM, Bartlomiej Zolnierkiewicz
<bzolnier@gmail.com> wrote:
>
> Hi,
>
> On Wednesday 27 August 2008, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since next-20080826:
>
> it fails to build here with:
>
> arch/x86/kernel/cpu/addon_cpuid_features.c: In function 'detect_extended_topology':
> arch/x86/kernel/cpu/addon_cpuid_features.c:119: error: 'struct cpuinfo_x86' hasno member named 'cpu_core_id'
> arch/x86/kernel/cpu/addon_cpuid_features.c:121: error: 'struct cpuinfo_x86' hasno member named 'phys_proc_id'
> arch/x86/kernel/cpu/addon_cpuid_features.c:130: error: 'struct cpuinfo_x86' hasno member named 'phys_proc_id'
> arch/x86/kernel/cpu/addon_cpuid_features.c:133: error: 'struct cpuinfo_x86' hasno member named 'cpu_core_id'
> make[2]: *** [arch/x86/kernel/cpu/addon_cpuid_features.o] Error 1
> make[1]: *** [arch/x86/kernel/cpu] Error 2
> make: *** [arch/x86/kernel] Error 2

which is most likely already fixed in x86 tree by

http://lkml.org/lkml/2008/8/27/34
