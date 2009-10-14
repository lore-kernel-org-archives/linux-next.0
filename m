From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build warnings
Date: Wed, 14 Oct 2009 15:11:37 -0700 (PDT)
Message-ID: <20091014.151137.30359959.davem@davemloft.net>
References: <20091014152000.15312908.sfr@canb.auug.org.au>
	<20091014153450.3110e34c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932540AbZJNWLn@vger.kernel.org>
In-Reply-To: <20091014153450.3110e34c.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, acme@redhat.com
List-Id: linux-next.vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 14 Oct 2009 15:34:50 +1100

> On Wed, 14 Oct 2009 15:20:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next build (powerpc ppc44x_defconfig) produced these
>> warnings:
>> 
>> In file included from net/socket.c:94:
>> include/net/compat.h:45: warning: 'struct compat_mmsghdr' declared inside parameter list
>> 
>> CONFIG_COMPAT is not set.
>> 
>> Caused by commit a2e2725541fad72416326798c2d7fa4dafb7d337 ("net:
>> Introduce recvmmsg socket syscall").
 ...
> 
> I also get these for i386 and sparc32 defconfig builds.

I've asked Arnaldo to work on fixing this.

Thanks!
