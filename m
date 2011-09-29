From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Thu, 29 Sep 2011 22:25:33 +0200
Message-ID: <201109292225.33716.rjw@sisk.pl>
References: <20110928145144.3d074db9aa9b6f858e0dc4fb@canb.auug.org.au> <201109291126.18470.rjw@sisk.pl> <CACVXFVOA486EvvymPchHB9V1WBLhsdFQRtr_zuOOo4HTbE0OKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:37758 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753782Ab1I2UXU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 29 Sep 2011 16:23:20 -0400
In-Reply-To: <CACVXFVOA486EvvymPchHB9V1WBLhsdFQRtr_zuOOo4HTbE0OKA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ming Lei <ming.lei@canonical.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday, September 29, 2011, Ming Lei wrote:
> On Thu, Sep 29, 2011 at 5:26 PM, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> >> But I don't think it is ugly, and this way is taken by BLOCK/PERF_EVENTS/
> >> KGDB_KDB in kernel/trace/Makefile.
> >
> > You're right about this.
> >
> >> Also this one is a simple fix and don't introduce any new config option,
> >> which is unnecessary.
> >
> > OK, I'll use your last patch.  Care to resend it with a sign-off?
> 
> OK, thanks, see attachment.

Applied.

Thanks,
Rafael
