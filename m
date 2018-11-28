From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Nov 27 (net/ipv4/af_inet.c)
Date: Tue, 27 Nov 2018 19:47:28 -0800
Message-ID: <f43a02d1-db24-369f-90df-8f7326144195@infradead.org>
References: <20181127152539.55426063@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181127152539.55426063@canb.auug.org.au>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 11/26/18 8:25 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20181126:
> 

as reported for linux-next-20181109:
(see https://lore.kernel.org/lkml/499e91d0-7349-641f-9826-7535713176f8@infradead.org/)

when CONFIG_PROC_FS is not enabled:

ld: net/ipv4/af_inet.o: in function `inet_init':
af_inet.c:(.init.text+0x42d): undefined reference to `raw_init'


-- 
~Randy
