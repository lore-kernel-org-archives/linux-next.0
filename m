From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: Tree for November 22 (kvm)
Date: Mon, 29 Nov 2010 18:35:03 +0200
Message-ID: <4CF3D637.6060204@redhat.com>
References: <20101122134911.b7e106f9.sfr@canb.auug.org.au>	<20101122132627.bd4e88ef.randy.dunlap@oracle.com> <20101129083324.6870d7da.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <kvm-owner@vger.kernel.org>
In-Reply-To: <20101129083324.6870d7da.randy.dunlap@oracle.com>
Sender: kvm-owner@vger.kernel.org
To: Zachary Amsden <zamsden@redhat.com>, Glauber Costa <glommer@redhat.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, kvm@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 11/29/2010 06:33 PM, Randy Dunlap wrote:
> On Mon, 22 Nov 2010 13:26:27 -0800 Randy Dunlap wrote:
>
> >  On Mon, 22 Nov 2010 13:49:11 +1100 Stephen Rothwell wrote:
> >
> >  >  Hi all,
> >  >
> >  >  Changes since 20101119:
> >
> >
> >  kvm.c:(.init.text+0x11f49): undefined reference to `kvm_register_clock'
> >
> >  when CONFIG_KVM_CLOCK is not enabled.
>
>
> BUild error still present in linux-next-2010-NOV-29.
>

Glauber, Zach?

-- 
error compiling committee.c: too many arguments to function

