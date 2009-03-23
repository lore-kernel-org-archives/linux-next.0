From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for March 23 (media/video/hdpvr)
Date: Mon, 23 Mar 2009 13:37:22 -0700
Message-ID: <49C7F302.6030004@oracle.com>
References: <20090323205454.d0cbf721.sfr@canb.auug.org.au> <49C7D965.5080202@oracle.com> <20090323204940.GA5079@aniel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20090323204940.GA5079@aniel>
Sender: linux-media-owner@vger.kernel.org
To: Janne Grunau <j@jannau.net>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Janne Grunau wrote:
> Hi,
> 
> On Mon, Mar 23, 2009 at 11:48:05AM -0700, Randy Dunlap wrote:
>> Stephen Rothwell wrote:
>>> Changes since 20090320:
>>> The v4l-dvb tree gained a build failure for which I have reverted 3 commits.
>> drivers/built-in.o: In function `hdpvr_disconnect':
>> hdpvr-core.c:(.text+0xf3894): undefined reference to `i2c_del_adapter'
>> drivers/built-in.o: In function `hdpvr_register_i2c_adapter':
>> (.text+0xf4145): undefined reference to `i2c_add_adapter'
>>
>>
>> CONFIG_I2C is not enabled.
> 
> following patch should fix that.

Ack.  Thanks.

> Janne
> 
> ps: Mauro, I'll send a pull request shortly


-- 
~Randy
