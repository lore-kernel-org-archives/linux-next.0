From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for June 29 (kvm)
Date: Sun, 01 Jul 2012 09:24:09 -0700
Message-ID: <4FF079A9.6090405@xenotime.net>
References: <20120629175341.22a9eccd30d9c085bfd92c1d@canb.auug.org.au> <4FEDEE6A.7020608@xenotime.net> <4FF01B59.1010600@redhat.com> <20120701094430.GB4642@redhat.com> <4FF01D41.5070600@redhat.com> <20120701105643.GA4782@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy6-pub.bluehost.com ([67.222.54.6]:43384 "HELO
	oproxy6-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751384Ab2GAQYn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 1 Jul 2012 12:24:43 -0400
In-Reply-To: <20120701105643.GA4782@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Avi Kivity <avi@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, KVM <kvm@vger.kernel.org>, x86@kernel.org

On 07/01/2012 03:56 AM, Michael S. Tsirkin wrote:

> On Sun, Jul 01, 2012 at 12:49:53PM +0300, Avi Kivity wrote:
>> On 07/01/2012 12:44 PM, Michael S. Tsirkin wrote:
>>> On Sun, Jul 01, 2012 at 12:41:45PM +0300, Avi Kivity wrote:
>>>> On 06/29/2012 09:05 PM, Randy Dunlap wrote:
>>>>> On 06/29/2012 12:53 AM, Stephen Rothwell wrote:
>>>>>
>>>>>> Hi all,
>>>>>>
>>>>>> Changes since 20120628:
>>>>>
>>>>>
>>>>>
>>>>> on i386:
>>>>>
>>>>> arch/x86/built-in.o: In function `kvm_guest_apic_eoi_write':
>>>>> kvm.c:(.text+0x3561f): undefined reference to `apic'
>>>>>
>>>>>
>>>>> Full randconfig file is attached.
>>>>
>>>> Michael, please disable pveoi if built with no apic.
>>>
>>> Will do.
>>> How do I tweak config to test this? Any hints?
>>
>> See the original mail, there's a .config there.
> 
> This https://lkml.org/lkml/2012/6/29/40 ?
> I don't see a .config there.

It's in   https://lkml.org/lkml/2012/6/29/350


>> Basically, i386 UP with
>> IOAPIC disabled.


-- 
~Randy
