From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: Tree for November 22 (kvm)
Date: Thu, 16 Dec 2010 11:37:00 +0200
Message-ID: <4D09DDBC.4090507@redhat.com>
References: <20101122134911.b7e106f9.sfr@canb.auug.org.au>	<20101122132627.bd4e88ef.randy.dunlap@oracle.com>	<20101129083324.6870d7da.randy.dunlap@oracle.com>	<4CF3D637.6060204@redhat.com>	<4CF3E733.8090809@redhat.com>	<4CF3E870.4040308@oracle.com>	<4CF3EC1E.7050707@redhat.com> <20101210091859.63a6a43e.randy.dunlap@oracle.com> <4D049488.5020105@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4D049488.5020105@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zachary Amsden <zamsden@redhat.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Glauber Costa <glommer@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, kvm@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 12/12/2010 11:23 AM, Avi Kivity wrote:
> On 12/10/2010 07:18 PM, Randy Dunlap wrote:
>> >  Looks like this is the appropriate fix:
>> >
>> >  #ifdef CONFIG_SMP
>> >  static void __init kvm_smp_prepare_boot_cpu(void)
>> >  {
>> >  #ifdef CONFIG_KVM_CLOCK
>> >      WARN_ON(kvm_register_clock("primary cpu clock"));
>> >  #endif
>> >      kvm_guest_cpu_init();
>> >      native_smp_prepare_boot_cpu();
>> >  }
>>
>>
>> Can we get this fix merged, please?
>>
>> Build error is still happening in linux-next 20101210.
>>
>
> Zach, a proper patch please.
>

Should be fixed for the next spin.

-- 
error compiling committee.c: too many arguments to function
