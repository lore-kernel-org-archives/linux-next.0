From: Ian Kent <raven@themaw.net>
Subject: Re: [RFC PATCH 7/7] autofs - change CONFIG_AUTOFS4_FS to
 CONFIG_AUTOFS_FS
Date: Fri, 05 Jul 2013 17:51:24 +0800
Message-ID: <1373017884.2497.10.camel@perseus.fritz.box>
References: <20130701031335.4423.6154.stgit@perseus.fritz.box>
	 <20130701031449.4423.58614.stgit@perseus.fritz.box>
	 <20130701143924.79f57e7206577a2e7777c0a2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <autofs-owner@vger.kernel.org>
In-Reply-To: <20130701143924.79f57e7206577a2e7777c0a2@canb.auug.org.au>
Sender: autofs-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>, autofs mailing list <autofs@vger.kernel.org>, Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, 2013-07-01 at 14:39 +1000, Stephen Rothwell wrote:
> Hi Ian,
> 
> On Mon, 01 Jul 2013 11:14:51 +0800 Ian Kent <raven@themaw.net> wrote:
> >
> > Signed-off-by: Ian Kent <raven@themaw.net>
> 
> Please don't do this.  Find a simple way to make sure that if
> CONFIG_AUTOFS4_FS is set, then "make oldconfig"  (or equivalent) will
> cause CONFIG_AUTOFS_FS to be set the same.

I get what your recommending but still can't think of a way to do it,
any thoughts?

Am I correct that's a +1 for an outright rename of autofs4 to autofs
rather than keeping the autofs4 directory and a compile stub?

I think what I was intending to do (even though I don't really like that
either) isn't apparent since patch 6 didn't make it to the list. I've
re-organized the series since, so perhaps another post of the series to
the list will provoke some suggestions.

> 
> The maintainers will update the defconfigs over time.
> 

Perhaps the maintainers expected the rename to occur a long time ago
(and it probably should have) since after around three years the configs
are still out of date. Still, as you say, it isn't really my place to
fix that.

Ian


