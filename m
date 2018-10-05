From: Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: linux-next: Tree for Oct 5 (net/core/filter.c)
Date: Fri, 5 Oct 2018 17:51:54 +0200
Message-ID: <e5a04d2f-df44-4616-5621-23d7738353d6@iogearbox.net>
References: <20181005163943.3f8d4f32@canb.auug.org.au>
 <51ea61d3-032b-f316-4a61-b63ab208d8d4@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51ea61d3-032b-f316-4a61-b63ab208d8d4@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, joe@wand.net.nz
List-Id: linux-next.vger.kernel.org

[ +Joe ]

On 10/05/2018 05:42 PM, Randy Dunlap wrote:
> On 10/4/18 11:39 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20181004:
>>
> 
> on i386 or x86_64:
> 
> net/core/filter.o: In function `bpf_sk_release':
> filter.c:(.text+0x3c5c): undefined reference to `sock_gen_put'
> net/core/filter.o: In function `sk_lookup':
> filter.c:(.text+0x79a5): undefined reference to `tcp_hashinfo'
> filter.c:(.text+0x79bc): undefined reference to `__inet_lookup_established'
> filter.c:(.text+0x79eb): undefined reference to `tcp_hashinfo'
> filter.c:(.text+0x79f3): undefined reference to `__inet_lookup_listener'
> filter.c:(.text+0x7a14): undefined reference to `udp_table'
> filter.c:(.text+0x7a26): undefined reference to `__udp4_lib_lookup'
> 
> 
> Full randconfig file is attached.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> 
