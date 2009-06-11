From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for June 11 (cnic)
Date: Thu, 11 Jun 2009 15:21:12 -0700
Message-ID: <4A318358.20804@oracle.com>
References: <20090611191420.1f4d5e4f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20090611191420.1f4d5e4f.sfr@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Netdev <netdev@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20090610:


In 2 separate builds:

ERROR: "ip_route_output_key" [drivers/net/cnic.ko] undefined!

when CONFIG_INET=n

and

drivers/net/cnic.c:2520: error: implicit declaration of function '__symbol_get'

when CONFIG_MODULES=n


-- 
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
