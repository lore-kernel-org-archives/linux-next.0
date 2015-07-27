From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jul 27 (net/mpls/af_mpls.c)
Date: Mon, 27 Jul 2015 08:30:24 -0700
Message-ID: <55B64E90.7030503@infradead.org>
References: <20150727160232.009f3c91@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20150727160232.009f3c91@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 07/26/15 23:02, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150724:
> 

on i386 or x86_64:

when CONFIG_IPV6 is not enabled:


net/built-in.o: In function `find_outdev':
af_mpls.c:(.text+0x1e8ddd): undefined reference to `ip6_route_output'
af_mpls.c:(.text+0x1e8e90): undefined reference to `ip_route_output_flow'




-- 
~Randy
