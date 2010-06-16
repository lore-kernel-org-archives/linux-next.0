From: Anton Vorontsov <cbouatmailru@gmail.com>
Subject: Re: linux-next: manual merge of the battery tree with the
 arm-current tree
Date: Wed, 16 Jun 2010 16:26:19 +0400
Message-ID: <20100616122619.GA22259@oksana.dev.rtsoft.ru>
References: <20100615125512.09c79d9b.sfr@canb.auug.org.au>
 <AANLkTilwnVs1970j0DkobtpyDKY8mOX9EX6iFP2uSvYR@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTilwnVs1970j0DkobtpyDKY8mOX9EX6iFP2uSvYR@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Miao <eric.y.miao@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Russell King <rmk@arm.linux.org.uk>, Huang Weiyi <weiyi.huang@gmail.com>
List-Id: linux-next.vger.kernel.org

On Tue, Jun 15, 2010 at 02:54:58PM +0800, Eric Miao wrote:
> On Tue, Jun 15, 2010 at 10:55 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi Anton,
> >
> > Today's linux-next merge of the battery tree got a conflict in
> > drivers/power/z2_battery.c between commit
> > 56b925fccc58cd43fc553a8302dbbdd440aef288 ("[ARM] pxa/z2: fix missing
> > include in battery driver") from the arm-current tree and commit
> > 5d111107b7994349feb681466f873b1a4f8a09d6 ("z2_battery: Remove duplicated
> > #include") from the battery tree.
> >
> > The former is a superset of the latter.
> 
> Marek has submitted a revised patch which goes into the -pxa tree
> due to dependency of z2_battery and some of the pxa machine files.
> 
> Anton,
> 
> Any suggestion? Or if you feel OK for this to go through the -pxa tree, I'd
> like to have your Ack.

Sure thing,

Acked-by: Anton Vorontsov <cbouatmailru@gmail.com>

Meanwhile, I dropped the "z2_battery: Remove duplicated #include"
patch from battery-2.6.git.

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
