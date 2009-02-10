From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: next Feb 10: mm/slqb build break
Date: Tue, 10 Feb 2009 13:53:51 +0200
Message-ID: <84144f020902100353x4074f342ne4d61483074a06b7@mail.gmail.com>
References: <20090210194121.80256b72.sfr@canb.auug.org.au>
	 <49914790.6050008@in.ibm.com> <49914EE7.7030205@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.154]:36823 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751266AbZBJLxx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Feb 2009 06:53:53 -0500
In-Reply-To: <49914EE7.7030205@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Sachin P. Sant" <sachinp@in.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, npiggin@suse.de, linuxppc-dev@ozlabs.org

On Tue, Feb 10, 2009 at 11:54 AM, Sachin P. Sant <sachinp@in.ibm.com> w=
rote:
> Sachin P. Sant wrote:
>>
>> Hi Stephen,
>>
>> Todays next randconfig build on powerpc fails with
>>
>> =A0CC =A0 =A0 =A0mm/slqb.o
>> mm/slqb.c: In function __slab_free:
>> mm/slqb.c:1648: error: implicit declaration of function
>> slab_free_to_remote
>> mm/slqb.c: In function kmem_cache_open:
>> mm/slqb.c:2174: error: implicit declaration of function
>> kmem_cache_dyn_array_free
>> mm/slqb.c:2175: warning: label error_cpu_array defined but not used
>> mm/slqb.c: In function kmem_cache_destroy:
>> mm/slqb.c:2294: error: implicit declaration of function
>> claim_remote_free_list
>> mm/slqb.c: In function kmem_cache_reap_percpu:
>> mm/slqb.c:2547: error: implicit declaration of function
>> flush_remote_free_cache
>> mm/slqb.c: In function kmem_cache_init:
>> mm/slqb.c:2783: error: per_cpu__kmem_cpu_nodes undeclared (first use=
 in
>> this function)
>> mm/slqb.c:2783: error: (Each undeclared identifier is reported only =
once
>> mm/slqb.c:2783: error: for each function it appears in.)
>> mm/slqb.c:2784: error: kmem_cpu_cache undeclared (first use in this
>> function)
>> make[1]: *** [mm/slqb.o] Error 1
>> make: *** [mm] Error 2
>
> CONFIG_SMP is not set hence the failure.

Actually, that's not the root cause here. You seem to have CONFIG_SMP
disabled but CONFIG_NUMA enabled. That's not possible on x86 which
makes me think it's a ppc kconfig bug. Hmm?

                                                     Pekka
