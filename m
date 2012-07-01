From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: Tree for June 29 (kvm)
Date: Sun, 01 Jul 2012 12:41:45 +0300
Message-ID: <4FF01B59.1010600@redhat.com>
References: <20120629175341.22a9eccd30d9c085bfd92c1d@canb.auug.org.au> <4FEDEE6A.7020608@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4FEDEE6A.7020608@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, KVM <kvm@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 06/29/2012 09:05 PM, Randy Dunlap wrote:
> On 06/29/2012 12:53 AM, Stephen Rothwell wrote:
> 
>> Hi all,
>> 
>> Changes since 20120628:
> 
> 
> 
> on i386:
> 
> arch/x86/built-in.o: In function `kvm_guest_apic_eoi_write':
> kvm.c:(.text+0x3561f): undefined reference to `apic'
> 
> 
> Full randconfig file is attached.

Michael, please disable pveoi if built with no apic.


-- 
error compiling committee.c: too many arguments to function
