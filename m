From: Govindarajulu Varadarajan <_govind@gmx.com>
Subject: Re: randconfig build error with next-20140522, in
 drivers/net/ethernet/cisco/enic/enic_main.c
Date: Fri, 23 May 2014 01:49:22 +0530 (IST)
Message-ID: <alpine.LNX.2.03.1405230148040.15994@ws.cisco>
References: <CA+r1ZhgW_Du8VUCmOof-MYnOun8Pq0FYTu4cG5NAOt3vkztWBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CA+r1ZhgW_Du8VUCmOof-MYnOun8Pq0FYTu4cG5NAOt3vkztWBw@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, benve@cisco.com, ssujith@cisco.com, _govind@gmx.com, neepatel@cisco.com, netdev <netdev@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



On Thu, 22 May 2014, Jim Davis wrote:

> Building with the attached random configuration file,
>
> drivers/built-in.o: In function `enic_poll_msix':
> enic_main.c:(.text+0x48710a): undefined reference to `__udivdi3'
> make: *** [vmlinux] Error 1
>

Looks like 64 bit divide issue. Will look into it.

Thanks for reporting.

Govind
