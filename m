From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: build warning after merge of the net-next tree
Date: Wed, 18 Jul 2018 20:52:56 -0700
Message-ID: <cbc20089-6847-c0eb-5b5a-735245986be1@roeck-us.net>
References: <20180719120447.6e7ba23d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180719120447.6e7ba23d@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Andrew Lunn <andrew@lunn.ch>
List-Id: linux-next.vger.kernel.org

On 07/18/2018 07:04 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the net-next tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> *
> * Restart config...
> *
> ....
> 
> This is output by my "make allmodconfig" and only started after merging
> the net-next tree today.  It has continued for further merges/builds.
> 
> I suspect commit
> 
>    1323061a018a ("net: phy: sfp: Add HWMON support for module sensors")
> 
> which added an "imply" clause.
> 
I thought "imply" was better than "depends on HWMON || HWMON=n", but maybe
not. Is that a caveat when using "imply", and does it mean that "imply"
should better not be used ?

Guenter
