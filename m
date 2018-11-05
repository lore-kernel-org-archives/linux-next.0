From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: Tree for Nov 5 (net/ipv6/af_inet6)
Date: Mon, 05 Nov 2018 10:12:09 -0800 (PST)
Message-ID: <20181105.101209.563084010777423448.davem@davemloft.net>
References: <20181105165109.410358fd@canb.auug.org.au>
        <2ad190b3-0b0d-972b-2a6e-16abf4a81c5b@infradead.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2ad190b3-0b0d-972b-2a6e-16abf4a81c5b@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rdunlap@infradead.org
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 0xeffeff@gmail.com
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>
Date: Mon, 5 Nov 2018 08:21:28 -0800

> On 11/4/18 9:51 PM, Stephen Rothwell wrote:
>> Hi all,
>> 
>> Changes since 20181102:
>> 
>> Non-merge commits (relative to Linus' tree): 418
> 
> on i386 or x86_64:
> 
> ld: net/ipv6/af_inet6.o: in function `inet6_init':
> af_inet6.c:(.init.text+0x285): undefined reference to `ipv6_anycast_init'
> ld: af_inet6.c:(.init.text+0x376): undefined reference to `ipv6_anycast_cleanup'
> 
> 
> Full randconfig file is attached (for i386).

Jeff, please fix this.
