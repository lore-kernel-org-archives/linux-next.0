From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the arm-soc tree
Date: Thu, 15 Oct 2015 16:10:45 +0200
Message-ID: <364744228.v8zmI08FKn@wuerfel>
References: <20151015101920.7fa592f7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151015101920.7fa592f7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, Thomas Hebb <tommyhebb@gmail.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: linux-next.vger.kernel.org

On Thursday 15 October 2015 10:19:20 Stephen Rothwell wrote:
> 
> After merging the arm-soc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> arch/arm/boot/dts/berlin2q.dtsi:62.24-25 syntax error
> FATAL ERROR: Unable to parse input tree
> 
> I can't see what caused this error, so I have just used the arm-soc tree
> from next-20151013 for today.
> 
> 

Thanks a lot, I've merged a broken branch that was based on the
wrong start point.

	Arnd
