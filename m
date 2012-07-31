From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for July 31 (media/radio-tea5777)
Date: Tue, 31 Jul 2012 10:22:25 -0700
Message-ID: <50181451.5040202@xenotime.net>
References: <20120731152614.de6ebe9e0d4b8fc6645b793a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20120731152614.de6ebe9e0d4b8fc6645b793a@canb.auug.org.au>
Sender: linux-media-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-media <linux-media@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 07/30/2012 10:26 PM, Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20120730:
> 


on i386:

drivers/built-in.o: In function `radio_tea5777_set_freq':
radio-tea5777.c:(.text+0x4d8704): undefined reference to `__udivdi3'



-- 
~Randy
