From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Nov 10 (net/ipv4/ip_tunnel.c)
Date: Mon, 10 Nov 2014 10:15:11 -0800
Message-ID: <546100AF.40201@infradead.org>
References: <20141110205945.51af32a6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:60135 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751119AbaKJSPS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 10 Nov 2014 13:15:18 -0500
In-Reply-To: <20141110205945.51af32a6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "netdev@vger.kernel.org" <netdev@vger.kernel.org>

On 11/10/14 01:59, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20141106:
> 

on x86_64:
when CONFIG_NET_IP_TUNNEL=y and CONFIG_NET_FOU=m:

net/built-in.o: In function `ip_tunnel_encap':
(.text+0xb04d8): undefined reference to `gue_build_header'
net/built-in.o: In function `ip_tunnel_encap':
(.text+0xb04ea): undefined reference to `fou_build_header'



-- 
~Randy
